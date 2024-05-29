;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF__0200D7FB Extends Quest Hidden Const

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

;Add map marker and block fast travel to it
kmyquest.ToggleMapMarkerFastTravel(true)
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
;BEGIN CODE
;EVP all the attackers
Alias_Attackers.EvaluateAll()

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
;Halt combat on everybody in town
kmyquest.HaltSubdueCombat()

;If we have a spokesperson, have the quest point to them. Otherwise, call it a day.
if Alias_SettlerSpokesperson.GetRef() != none
  Alias_SettlerSpokesperson.GetActorRef().AllowBleedoutDialogue(true)
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

;Set raid index var on MQ04
if DLC04MQ04.IsRunning()
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).iSecondRaidIndex = 4
endif

;Throw all the attackers into the wrap-up quest
kmyquest.AddAttackerRaidersToDeletionColl()

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
;Show all appropriate failure messages
if kmyquest.bCompanionPresent
  DLC04RaidFailCompanionMessage.Show()
endif

if kmyquest.bEssentialNPCPresent
  DLC04RaidFailEssentialNPCMessage.Show()
endif

if kmyquest.bLocationRequiresUnlock
  DLC04RaidFailRequiresUnlockMessage.Show()
endif

if kmyquest.bNoPopulation
  DLC04RaidFailNoPopulationMessage.Show()
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
  (DLC04MQ04 as DLC04:DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(false, true)
endif

;Shut down quest
SetStage(1000)
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

;Allow everyone to recover from bleedout again
kmyquest.ToggleDefenderNoBleedOutRecovery(false)

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
