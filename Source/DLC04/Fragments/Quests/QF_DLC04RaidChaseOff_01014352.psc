;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RaidChaseOff_01014352 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(20)

; flag if owned settlement for Preston conversation
WorkshopScript workshopRef = Alias_workshop.GetRef() as WorkshopScript
if workshopRef.OwnedByPlayer
	DLC04PlayerRaidedFriendlySettlement.SetValue(1)
endif

;Remove ownership from player and block fast travel until this thang is over
workshopRef.SetOwnedByPlayer(false)

;Get map marker on the map
Alias_MapMarker.GetRef().AddToMap()

;Set this quest active if MQ04 is still running
if DLC04MQ04.IsRunning()
  DLC04MQ04.SetStage(50)
  SetActive()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidTrackNearbyOutpostsScript
Quest __temp = self as Quest
DLC04:DLC04RaidTrackNearbyOutpostsScript kmyQuest = __temp as DLC04:DLC04RaidTrackNearbyOutpostsScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartRadioTransmitterTracking()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;If the Operators aren't yet enemies, throw objective points to them
if DLC04EnemyGang.GetValue() != 2 && DLC04OperatorsToolsConversationComplete.GetValue() <= 0
  DLC04DialogueRaiderBossOperators.SetStage(10)
elseif DLC04OperatorsToolsConversationComplete.GetValue() > 0
  SetObjectiveDisplayed(21)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
if Alias_NearbyRaiderWorkshop.GetRef() != none && DLC04MQ04.GetStageDone(70)
  SetObjectiveDisplayed(22)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;If the Operators aren't yet enemies, throw objective points to them
if DLC04EnemyGang.GetValue() != 2 && !IsObjectiveDisplayed(21) && !IsObjectiveCompleted(21) && !GetStageDone(100)
  SetObjectiveDisplayed(21)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetIntimidateActorValue(Alias_SettlementTargets)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
SetObjectiveCompleted(21)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
SetObjectiveCompleted(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
kmyquest.IncrementIntimidationSuccesses()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
;Remove caps from player
Actor PA = Game.GetPlayer()

if kmyquest.iCapsBuyoutLevel == 3
  PA.RemoveItem(Caps001, DLC04IntimidateAlwaysSucceedsCapsBuyout.GetValueInt())  
elseif kmyquest.iCapsBuyoutLevel == 2
  PA.RemoveItem(Caps001, DLC04IntimidateEasyCapsBuyout.GetValueInt())  
elseif kmyquest.iCapsBuyoutLevel == 1
  PA.RemoveItem(Caps001, DLC04IntimidateMediumCapsBuyout.GetValueInt())  
else
    PA.RemoveItem(Caps001, DLC04IntimidateHardCapsBuyout.GetValueInt())  
endif

;And wrap up quest
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
WorkshopScript WorkshopREF = Alias_Workshop.GetRef() as WorkshopScript

; Add collection of scrap to workshop here
workshopRef.AddItem(DLC04MQ04RaiderOutpostItems, 1)

kmyQuest.WrapupQuest()
kmyQuest.StartFlagTracking()

SetObjectiveCompleted(20)
SetObjectiveCompleted(21)
SetObjectiveCompleted(22)
SetObjectiveDisplayed(100)

Alias_Settlementspokesperson.GetActorRef().EvaluatePackage()

;COMPANION AFFINITY - Did player chase off location with bribery or without?
if !GetStageDone(90)
  SetStage(101)
else
  SetStage(102)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidTrackNearbyOutpostsScript
Quest __temp = self as Quest
DLC04:DLC04RaidTrackNearbyOutpostsScript kmyQuest = __temp as DLC04:DLC04RaidTrackNearbyOutpostsScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartRadioTransmitterTracking(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;Set right flag number in controller quest
if kmyquest.iChosenGang == 1
  ;Number 1 - Disciples
  DLC04RaiderControllerQuest.SetStage(10)
elseif kmyquest.iChosenGang == 2
  ;Number 2 - Operators
  DLC04RaiderControllerQuest.SetStage(20)
elseif kmyquest.iChosenGang == 3
  ;Number 3 - Pack
  DLC04RaiderControllerQuest.SetStage(30)
endif

if DLC04MQ04.GetStageDone(500)
	; update raider outpost tracker
	DLC04MQ04_RaiderOutpostTracker.UpdateOutpostCount()
endif

kmyquest.Shutdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
int iLength = DLC04RaidFailMessageLength.GetValueInt()

;Show all appropriate failure messages
if kmyquest.bCompanionPresent
  DLC04RaidFailCompanionMessage.ShowAsHelpMessage("DLC04ChaseOffComp", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bEssentialNPCPresent
  DLC04RaidFailEssentialNPCMessage.ShowAsHelpMessage("DLC04ChaseOffEssential", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bLocationRequiresUnlock
  DLC04RaidFailRequiresUnlockMessage.ShowAsHelpMessage("DLC04ChaseOffUnlock", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bNoPopulation
  DLC04RaidFailNoPopulationMessage.ShowAsHelpMessage("DLC04ChaseOffNoPop", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bTeleporterPresent
  DLC04RaidFailTeleporterPresentMessage.ShowAsHelpMessage("DLC04ChaseOffTeleporter", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bWorkshopReserved
  DLC04RaidFailWorkshopReservedMessage.ShowAsHelpMessage("DLC04ChaseOffReserved", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bNoSpokesperson
  DLC04RaidFailNoSpokespersonMessage.ShowAsHelpMessage("DLC04ChaseOffNoSpokes", iLength, 0, 1, "NoMenu")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
;Call function to clean up all the spawned NPCs and shut this thang down
kmyquest.UnstartedQuestCleanUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()

;If MQ04 is still active, turn off attack quest var and reflash objectives
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false)
endif

;If quest has finished start up, make sure quest shuts down and hands off proper aliases
;If it hasn't, delete everybody
if kmyquest.bStartUpComplete
  kmyquest.ChaseOffFailShutdown()
elseif !kmyquest.bLocationApproved
  SetStage(760)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
FailAllObjectives()

;If MQ04 is still active, turn off attack quest var and reflash objectives
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false, true, 20)
endif

;Shut down quest if end game processing hasn't already begun
if !GetStageDone(90) && !GetStageDone(100)
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
Quest __temp = self as Quest
DLC04:DLC04RaidChaseOffScript kmyQuest = __temp as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
;If MQ04 is still active, turn off attack quest var
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false)
endif

;Turn off "Raid Active" var
kmyquest.bRaidActive = false

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Workshop Auto Const Mandatory

Faction Property DLC04RaidWipeOutDefenderFaction Auto Const Mandatory

Message Property DLC04RaidFailCompanionMessage Auto Const Mandatory

Message Property DLC04RaidFailEssentialNPCMessage Auto Const Mandatory

Quest Property DLC04WorkshopParent Auto Const Mandatory

Scene Property DLC04RaidWipeOut_003_RaiderVictoryLine Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Message Property DLC04RaidFailRequiresUnlockMessage Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

Message Property DLC04RaidFailNoPopulationMessage Auto Const Mandatory

Quest Property DLC04MQ04 Auto Const Mandatory

Message Property DLC04RaidFailTeleporterPresentMessage Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

ReferenceAlias Property Alias_NearbyRaiderWorkshop Auto Const Mandatory

Quest Property DLC04DialogueRaiderBossOperators Auto Const Mandatory

GlobalVariable Property DLC04OperatorsToolsConversationComplete Auto Const Mandatory

Message Property DLC04RaidFailWorkshopReservedMessage Auto Const Mandatory

Message Property DLC04RaidFailNoSpokespersonMessage Auto Const Mandatory

ReferenceAlias Property Alias_SettlementSpokesperson Auto Const Mandatory

Quest Property DLC04RaiderControllerQuest Auto Const Mandatory

GlobalVariable Property DLC04PlayerRaidedFriendlySettlement Auto Const Mandatory

RefCollectionAlias Property Alias_SettlementTargets Auto Const Mandatory

LeveledItem Property DLC04MQ04RaiderOutpostItems Auto Const Mandatory

Quest Property DLC04MQ04TutorialQuest Auto Const Mandatory

GlobalVariable Property DLC04IntimidateAlwaysSucceedsCapsBuyout Auto Const Mandatory

GlobalVariable Property DLC04IntimidateEasyCapsBuyout Auto Const Mandatory

GlobalVariable Property DLC04IntimidateHardCapsBuyout Auto Const Mandatory

GlobalVariable Property DLC04IntimidateMediumCapsBuyout Auto Const Mandatory

DLC04:DLC04RaiderOutpostTrackerScript Property DLC04MQ04_RaiderOutpostTracker Auto Const Mandatory

GlobalVariable Property DLC04RaidFailMessageLength Auto Const Mandatory
