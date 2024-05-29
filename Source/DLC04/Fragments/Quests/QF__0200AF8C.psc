;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF__0200AF8C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
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
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidWipeOutScript
Quest __temp = self as Quest
DLC04:DLC04RaidWipeOutScript kmyQuest = __temp as DLC04:DLC04RaidWipeOutScript
;END AUTOCAST
;BEGIN CODE
;Remove protected from the targets
kmyquest.ToggleDefenderProtected(false)

;EVP all the attackers
Alias_Attackers.EvaluateAll()

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
;Give player new workshop location
(DLC04WorkshopParent as DLC04:DLC04WorkshopParentScript).SetRaiderSettlement(Alias_Workshop.GetRef() as WorkshopScript, kmyquest.iChosenGang)

;Return ownership to player
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)

;Add new Raiders to location
kmyquest.AssignRaidersToWorkshop()

CompleteAllObjectives()

;If a fight actually occurred, play the victory line
Actor RS = Alias_RaiderSpokesperson.GetActorRef()

if GetStageDone(50) && !RS.IsDead() && !RS.IsInCombat()
  DLC04RaidWipeOut_003_RaiderVictoryLine.Start()
else
  SetStage(110)
endif
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

;Shut down quest
SetStage(1000)
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
