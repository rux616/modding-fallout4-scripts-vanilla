;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04RaidSubdue_01016E18 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Let game know player heard this intro
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
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(20)

;Remove ownership from player and block fast travel until this thang is over
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(false)

;Set this quest active if MQ04 is still running
if DLC04MQ04.IsRunning()
  DLC04MQ04.SetStage(130)
  SetActive()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
;END AUTOCAST
;BEGIN CODE
;Show message player cannot fast travel here anymore
if kmyquest.bDisabledMapMarker
  DLC04RaidSubdueNoFastTravelMessage.Show()
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
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
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
SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetObjectiveCompleted(55)

;If all defenders are in bleedout, proceed to next stage of quest 
if GetStageDone(70)
  SetStage(95)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)

;If all spawned defenders are dead, proceed to next stage of quest 
if GetStageDone(65)
  SetStage(95)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;If attack hasn't begun, fail talk objective and have the player attack

SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
;END AUTOCAST
;BEGIN CODE
;Start failsafe timer
kmyquest.StartSceneFailSafeTimer()

;Halt combat on everybody in town
kmyquest.HaltSubdueCombat()
Utility.Wait(1.0)
kmyquest.HaltSubdueCombat()

Actor SpokeAct = Alias_SettlerSpokesperson.GetActorRef()

;If we have a spokesperson, have the quest point to them. Otherwise, call it a day.
if Alias_SettlerSpokesperson.GetRef() != none && SpokeAct.IsEssential() && !SpokeAct.IsDead() && !SpokeAct.IsDisabled()
  SpokeAct.AllowBleedoutDialogue(true)
  SetObjectiveDisplayed(95)
else
  SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
;END AUTOCAST
;BEGIN CODE
;Give player new workshop location
(DLC04WorkshopParent as DLC04:DLC04WorkshopParentScript).SetVassalSettlement(Alias_Workshop.GetRef() as WorkshopScript, kmyquest.iChosenGang)

;Turn bleed out dialogue back off for spokesperson
if Alias_Settlerspokesperson.GetRef() != none
  Alias_SettlerSpokesperson.GetActorRef().AllowBleedoutDialogue(false)
endif

CompleteAllObjectives()

;Set up next section of quest and set raid index var on MQ04
if DLC04MQ04.IsRunning() && !DLC04MQ04.GetStageDone(150)
  DLC04MQ04.SetStage(150)
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).iSecondRaidIndex = 4
endif

;Throw all the attackers into the wrap-up quest
kmyquest.AddAttackerRaidersToDeletionColl()

;Start up Vassal Reward Quest
DLC04RaidVassalRewardKeyword.SendStoryEventAndWait(none, Alias_Workshop.GetRef())

;Halt combat on everybody in town
kmyquest.HaltSubdueCombat()

;Shut it down
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0755_Item_00
Function Fragment_Stage_0755_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
;END AUTOCAST
;BEGIN CODE
int iLength = DLC04RaidFailMessageLength.GetValueInt()

;Show all appropriate failure messages
if kmyquest.bCompanionPresent
  DLC04RaidFailCompanionMessage.ShowAsHelpMessage("DLC04SubdueComp", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bEssentialNPCPresent
  DLC04RaidFailEssentialNPCMessage.ShowAsHelpMessage("DLC04SubdueEssential", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bLocationRequiresUnlock
  DLC04RaidFailRequiresUnlockMessage.ShowAsHelpMessage("DLC04SubdueUnlock", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bNoPopulation
  DLC04RaidFailNoPopulationMessage.ShowAsHelpMessage("DLC04SubdueNoPop", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bTeleporterPresent
  DLC04RaidFailTeleporterPresentMessage.ShowAsHelpMessage("DLC04SubdueTeleporter", iLength, 0, 1, "NoMenu")
endif

if kmyquest.bWorkshopReserved
  DLC04RaidFailWorkshopReservedMessage.ShowAsHelpMessage("DLC04SubdueReserved", iLength, 0, 1, "NoMenu")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
;END AUTOCAST
;BEGIN CODE
;Call function to clean up all the spawned NPCs and shut this thang down
kmyquest.UnstartedQuestCleanUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
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
  kmyquest.SubdueFailShutdown()
elseif !kmyquest.bLocationApproved
  SetStage(760)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidSubdueScript
Quest __temp = self as Quest
DLC04:DLC04RaidSubdueScript kmyQuest = __temp as DLC04:DLC04RaidSubdueScript
;END AUTOCAST
;BEGIN CODE
;Reenable fast travel to location if its been disabled
kmyquest.ToggleMapMarkerFastTravel(false)

;If MQ04 is still active, turn off attack quest var and reflash objectives
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false)
endif

;Turn bleed out dialogue back off for spokesperson
if Alias_Settlerspokesperson.GetRef() != none
  Alias_SettlerSpokesperson.GetActorRef().AllowBleedoutDialogue(false)
endif

;Allow everyone to recover from bleedout again
kmyquest.ToggleDefenderNoBleedOutRecovery(false)

;Clear out the Lone Essential NPC if they're still around
kmyquest.ClearLoneEssentialNPC()

;Turn off Ignore Friendly hits
kmyquest.ToggleIgnoreFriendlyHitsOnRefColl(Alias_Attackers, false)

;And while we're here, restore the health of everyone in the Settlements Target faction, just to ensure they don't instantly die afterwards
kmyquest.RestoreCollectionHealthIfNegative(Alias_SettlementTargets)

;Set var to turn Shank's obj
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

ReferenceAlias Property Alias_SettlerSpokesperson Auto Const Mandatory

Message Property DLC04RaidFailNoPopulationMessage Auto Const Mandatory

Message Property DLC04RaidFailTeleporterPresentMessage Auto Const Mandatory

GlobalVariable Property DLC04PackToolsConversationComplete Auto Const Mandatory

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

GlobalVariable Property DLC04RaidAttackQuestTalkToBossesIntroDone Auto Const Mandatory

Quest Property DLC04MQ04MasonSceneQuest Auto Const Mandatory

Quest Property DLC04MQ04DixieSceneQuest Auto Const Mandatory

Message Property DLC04RaidFailWorkshopReservedMessage Auto Const Mandatory

Faction Property MinutemenFaction Auto Const Mandatory

RefCollectionAlias Property Alias_SettlementChildren Auto Const Mandatory

Quest Property DLC04CollectVassalIncomeMiscQuest Auto Const Mandatory

RefCollectionAlias Property Alias_WorkshopSafetyObjects Auto Const Mandatory

Message Property DLC04RaidSubdueNoFastTravelMessage Auto Const Mandatory

Keyword Property DLC04RaidVassalRewardKeyword Auto Const Mandatory

GlobalVariable Property DLC04RaidFailMessageLength Auto Const Mandatory

RefCollectionAlias Property Alias_SettlementTargets Auto Const Mandatory

ActorValue Property WorkshopRatingPopulation Auto Const Mandatory

WorkshopParentScript Property WorkshopParent Auto Const Mandatory
