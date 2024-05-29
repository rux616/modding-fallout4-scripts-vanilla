;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RaidWipeOut_0100DB37 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Let game know player heard this intro once (used to change intro's to boss scenes)
DLC04RaidAttackQuestTalkToBossesIntroDone.SetValue(1)

if DLC04EnemyGang.GetValue() != 3 && !DLC04MQ04MasonSceneQuest.GetStageDone(50)
  DLC04MQ04MasonSceneQuest.SetStage(20)
endif

if DLC04EnemyGang.GetValue() != 1 && !DLC04MQ04DixieSceneQuest.GetStageDone(50)
  DLC04MQ04DixieSceneQuest.SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
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

;Set this quest active if MQ04 is still running
if DLC04MQ04.IsRunning()
  DLC04MQ04.SetStage(50)
  SetActive()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
;Show message player cannot fast travel here anymore
if kmyquest.bDisabledMapMarker
  DLC04RaidWipeOutNoFastTravelMessage.Show()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20, false)

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
;Start failsafe timer
kmyquest.StartFailSafeTimer()

;Make minutemen faction enemy to player if minutemen defenders are present
if kmyquest.bMinutemenDefender
  MinutemenFaction.SetPlayerEnemy()
endif

;EVP all the attackers
Alias_Attackers.EvaluateAll()

;EVP the children
Alias_SettlementChildren.EvaluateAll()

;Update objectives
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
;If attack hasn't begun, fail talk objective and have the player attack

if !kmyquest.bNoDefenders
  if !GetStageDone(50)
    SetObjectiveFailed(20)
    SetObjectiveDisplayed(50)
  endif
else
  ;If no defenders are present and the player's killed their gang, wrap up the quest
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
WorkshopScript WorkshopREF = Alias_Workshop.GetRef() as WorkshopScript

; Add collection of scrap to workshop here
workshopRef.AddItem(DLC04MQ04RaiderOutpostItems, 1)

;Start flag tracking
kmyquest.StartFlagTracking(true)

;Give player new workshop location
(DLC04WorkshopParent as DLC04:DLC04WorkshopParentScript).SetRaiderSettlement(WorkshopREF, kmyquest.iChosenGang)

;Add new Raiders to location
kmyquest.AssignRaidersToWorkshop()

;Update objectives
SetObjectiveCompleted(20)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)

;If a fight actually occurred, play the victory line
Actor RS = Alias_RaiderSpokesperson.GetActorRef()

if GetStageDone(50) && !RS.IsDead() && !RS.IsInCombat()
  DLC04RaidWipeOut_003_RaiderVictoryLine.Start()
endif

;Show "Clearing Raider Outposts" tutorial
if !DLC04MQ04TutorialQuest.GetStageDone(20)
  DLC04MQ04TutorialQuest.SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
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

;If we're at the portion of MQ04 where we're claiming new settlements, update that global now
if DLC04MQ04.GetStageDone(305) && !DLC04MQ04.GetStageDone(500)
  kmyquest.UpdateMQ04OutpostCount()
endif

;Set raid index var on MQ04
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).iInitialRaidIndex = 2
endif

;Roll through all the remaining Raiders and try to assign them to the locations again
kmyquest.CheckRaiderWorkshopAssignment(Alias_Attackers)

;Try to grab a raider for the player to talk to. If we can't point them back towards Shank
if !DLC04MQ04.GetStageDone(70)
  ;Assign my location and workshop reference to aliases in MQ04
  MQ04InitialRaiderSettlementLocation.ForceLocationTo(Alias_myLocation.GetLocation())
  MQ04InitialRaiderSettlement.ForceRefTo(Alias_Workshop.GetRef())

  if kmyquest.GetLivingRaiderForMQ04()
    DLC04MQ04.SetStage(80)
  else
    DLC04MQ04.SetStage(90)
  endif 

  ;If this location was populated at quest start and not by enemies, mark a global
  if !kmyquest.bNoDefenders && !kmyquest.bLocationHostile
    DLC04MQ04FirstOutpostHadPopulation.SetValue(1)
  endif
endif

;Get turrets set up for new gang faction
kmyquest.AssignFactionToSafetyObjects(Alias_WorkshopSafetyObjects, kmyquest.fcSettlementFaction)

;Shut this thing down
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Shut down quest
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
int iLength = DLC04RaidFailMessageLength.GetValueInt()

;Show all appropriate failure messages
if kmyquest.bCompanionPresent
  DLC04RaidFailCompanionMessage.ShowAsHelpMessage("DLC04WipeOutComp", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bEssentialNPCPresent
  DLC04RaidFailEssentialNPCMessage.ShowAsHelpMessage("DLC04WipeOutEssential", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bLocationRequiresUnlock
  DLC04RaidFailRequiresUnlockMessage.ShowAsHelpMessage("DLC04WipeOutUnlock", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bTeleporterPresent
  DLC04RaidFailTeleporterPresentMessage.ShowAsHelpMessage("DLC04WipeOutTeleporter", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bWorkshopReserved
  DLC04RaidFailWorkshopReservedMessage.ShowAsHelpMessage("DLC04WipeOutReserved", iLength, 0, 1, "NoMenu")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
;Call function to clean up all the spawned NPCs and shut this thang down
kmyquest.UnstartedQuestCleanUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()

;If MQ04 is still active, turn off attack quest var and reflash objectives
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false, true)
endif

;If quest has finished start up, make sure quest shuts down and hands off proper aliases
;If it hasn't, delete everybody
if kmyquest.bStartUpComplete
  kmyquest.WipeOutFailShutdown()
elseif !kmyquest.bLocationApproved
  SetStage(760)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
;Reenable fast travel to location if its been disabled
kmyquest.ToggleMapMarkerFastTravel(false)

;If MQ04 is still active, turn off attack quest var and reflash objectives
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false)
endif

;Turn off Ignore Friendly hits
kmyquest.ToggleIgnoreFriendlyHitsOnRefColl(Alias_Attackers, false)

;Set var to allow Shank's qt again
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

ReferenceAlias Property Alias_RaiderSpokesperson Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

RefCollectionAlias Property Alias_Attackers Auto Const Mandatory

Message Property DLC04RaidFailRequiresUnlockMessage Auto Const Mandatory

Quest Property DLC04MQ04 Auto Const Mandatory

Message Property DLC04RaidFailTeleporterPresentMessage Auto Const Mandatory

GlobalVariable Property DLC04PackToolsConversationComplete Auto Const

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

GlobalVariable Property DLC04RaidAttackQuestTalkToBossesIntroDone Auto Const Mandatory

Quest Property DLC04MQ04MasonSceneQuest Auto Const Mandatory

Quest Property DLC04MQ04DixieSceneQuest Auto Const Mandatory

Message Property DLC04RaidFailWorkshopReservedMessage Auto Const Mandatory

LocationAlias Property Alias_myLocation Auto Const Mandatory

LocationAlias Property MQ04InitialRaiderSettlementLocation Auto Const Mandatory

ReferenceAlias Property MQ04InitialRaiderSettlement Auto Const Mandatory

Quest Property DLC04RaiderControllerQuest Auto Const Mandatory

Faction Property MinutemenFaction Auto Const Mandatory

GlobalVariable Property DLC04PlayerRaidedFriendlySettlement Auto Const Mandatory

RefCollectionAlias Property Alias_SettlementChildren Auto Const Mandatory

GlobalVariable Property DLC04MQ04FirstOutpostHadPopulation Auto Const Mandatory

RefCollectionAlias Property Alias_WorkshopSafetyObjects Auto Const Mandatory

Faction Property DLC04GangDisciplesFaction Auto Const Mandatory

LeveledItem Property LL_Component_Ceramic Auto Const Mandatory

LeveledItem Property LL_Component_Circuitry Auto Const Mandatory

LeveledItem Property LL_Component_Copper Auto Const Mandatory

LeveledItem Property LL_Component_Crystal Auto Const Mandatory

LeveledItem Property LL_Component_Rubber Auto Const Mandatory

LeveledItem Property DLC04MQ04RaiderOutpostItems Auto Const Mandatory

Message Property DLC04RaidWipeOutNoFastTravelMessage Auto Const Mandatory

Quest Property DLC04MQ04TutorialQuest Auto Const Mandatory

DLC04:DLC04RaiderOutpostTrackerScript Property DLC04MQ04_RaiderOutpostTracker Auto Const Mandatory

GlobalVariable Property DLC04RaidFailMessageLength Auto Const Mandatory
