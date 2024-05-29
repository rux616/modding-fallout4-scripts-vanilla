;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RaidCoerce_01019088 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20)

;Remove ownership from player and block fast travel until this thang is over
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(false)

;Get map marker on the map
Alias_MapMarker.GetRef().AddToMap()

;Set this quest active if MQ04 is still running
if DLC04MQ04.IsRunning()
  DLC04MQ04.SetStage(130)
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
if Alias_NearbyRaiderWorkshop.GetRef() != none
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
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
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

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(21)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
;Shut down initial conversation loop
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
kmyquest.IncrementIntimidationSuccesses()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
;debug.messagebox("INSERT BRAWL HERE! GET THEM DUKES UP!")
; register for stage set events on brawl quest
kmyQuest.RegisterForRemoteEvent(GenericBrawl, "OnStageSet")
; start brawl
GenericBrawlStart.SendStoryEvent(akRef1 = Alias_SettlementSpokesperson.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
kmyquest.IncrementIntimidationSuccesses()

;Start wrap up victory scene
DLC04RaidCoerce_003_PostBrawlSceneWin.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
;Start player lost scene
;DLC04RaidCoerce_003a_PostBrawlSceneLose.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
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

;If this place has more than two people, start wrap up scene. Otherwise, shut down
Actor SpokeAct = Alias_SettlementSpokesperson.GetActorRef()

if Alias_Workshop.GetRef().GetBaseValue(WorkshopRatingPopulation) >= 1 && !SpokeAct.IsDisabled() && !SpokeAct.IsDead() && !SpokeAct.IsInCombat()
  DLC04RaidCoerce_004_BoughtOutScene.Start()
else
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;Wrap up quest
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;COMPANION AFFINITY - throw different wrap-up stage based on whether player bribed the place or not
if !GetStageDone(90)
  SetStage(101)
else
  SetStage(102)
endif

;Remove old settlers, add new Raiders and shut this thang down
kmyquest.WrapUpQuest()
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

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
int iLength = DLC04RaidFailMessageLength.GetValueInt()

;Show all appropriate failure messages
if kmyquest.bCompanionPresent
  DLC04RaidFailCompanionMessage.ShowAsHelpMessage("DLC04CoerceComp", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bEssentialNPCPresent
  DLC04RaidFailEssentialNPCMessage.ShowAsHelpMessage("DLC04CoerceEssential", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bLocationRequiresUnlock
  DLC04RaidFailRequiresUnlockMessage.ShowAsHelpMessage("DLC04CoerceUnlock", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bNoPopulation
  DLC04RaidFailNoPopulationMessage.ShowAsHelpMessage("DLC04CoerceNoPop", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bTeleporterPresent
  DLC04RaidFailTeleporterPresentMessage.ShowAsHelpMessage("DLC04CoerceTeleporter", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bWorkshopReserved
  DLC04RaidFailWorkshopReservedMessage.ShowAsHelpMessage("DLC04CoerceReserved", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bNoSpokesperson
  DLC04RaidFailNoSpokespersonMessage.ShowAsHelpMessage("DLC04CoerceNoSpokes", iLength, 0, 1, "NoMenu")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
;Call function to clean up all the spawned NPCs and shut this thang down
kmyquest.UnstartedQuestCleanUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
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
  kmyquest.CoerceFailShutdown()
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
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false, true, 110)
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
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidCoerceScript
Quest __temp = self as Quest
DLC04:DLC04RaidCoerceScript kmyQuest = __temp as DLC04:DLC04RaidCoerceScript
;END AUTOCAST
;BEGIN CODE
;If MQ04 is still active, turn off attack quest var
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false)
endif

;Set var to turn Shank's obj back on
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

Scene Property DLC04RaidCoerce_003_PostBrawlSceneWin Auto Const Mandatory

Scene Property DLC04RaidCoerce_003a_PostBrawlSceneLose Auto Const Mandatory

ActorValue Property WorkshopRatingPopulation Auto Const Mandatory

Scene Property DLC04RaidCoerce_004_BoughtOutScene Auto Const Mandatory

GenericBrawlScript Property GenericBrawl Auto Const Mandatory

Keyword Property GenericBrawlStart Auto Const Mandatory

ReferenceAlias Property Alias_SettlementSpokesperson Auto Const Mandatory

Message Property DLC04RaidFailTeleporterPresentMessage Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

ReferenceAlias Property Alias_NearbyRaiderWorkshop Auto Const Mandatory

GlobalVariable Property DLC04OperatorsToolsConversationComplete Auto Const Mandatory

Quest Property DLC04DialogueRaiderBossOperators Auto Const

Message Property DLC04RaidFailWorkshopReservedMessage Auto Const Mandatory

Message Property DLC04RaidFailNoSpokespersonMessage Auto Const Mandatory

RefCollectionAlias Property Alias_SettlementTargets Auto Const Mandatory

GlobalVariable Property DLC04IntimidateAlwaysSucceedsCapsBuyout Auto Const Mandatory

GlobalVariable Property DLC04IntimidateEasyCapsBuyout Auto Const Mandatory

GlobalVariable Property DLC04IntimidateMediumCapsBuyout Auto Const Mandatory

GlobalVariable Property DLC04IntimidateHardCapsBuyout Auto Const Mandatory

GlobalVariable Property DLC04RaidFailMessageLength Auto Const Mandatory
