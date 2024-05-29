;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQ02_01000801 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Complete Pre-Reqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set Ada available as a companion
Alias_Ada.GetActorRef().SetAvailableToBeCompanion()

;Set DLC01MQ01 complete
DLC01MQ01.SetStage(2100)
DLC01MQ01.SetStage(2200)
DLC01MQ01.SetStage(2300)
DLC01MQ01.SetStage(2400)
DLC01MQ01.SetStage(2430)
DLC01MQ01.SetStage(3000)

;Give player enough materials to build a robot.
Game.GetPlayer().AddItem(DLC01MQ05RobotMaterialItems)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE dlc01:mq02questscript
Quest __temp = self as Quest
dlc01:mq02questscript kmyQuest = __temp as dlc01:mq02questscript
;END AUTOCAST
;BEGIN CODE
;Reset the General Atomics Factory Location
;Alias_GeneralAtomicsFactoryLocation.GetLocation().Reset()

;Show Map Marker for General Atomics Factory
Alias_GeneralAtomicsFactoryMapMarker.GetRef().AddToMap()

SetStage(2100)

;Enable General Atomics Factory Mechanist Encounters
PDLC01GenAtomicsFactoryMechBotEnabler.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Player has chosen to be positive about Codsworth being able to glean at least some 
; information from the Mechanist hardware they installed in him.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Player has chosen to be negative about Codsworth not being able to immediately pinpoint
; the source of the signal with his newly installed Mechanist hardware, saying it's "useless".
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(2100) ; Investigate General Atomics
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2200_Item_00
Function Fragment_Stage_2200_Item_00()
;BEGIN AUTOCAST TYPE dlc01:mq02questscript
Quest __temp = self as Quest
dlc01:mq02questscript kmyQuest = __temp as dlc01:mq02questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(2100)
If GetStageDone(2400) == 0
   SetObjectiveDisplayed(2200)
EndIf

; Clean up caravan site for DLC01MQ01Caravan
DLC01MQ01Caravan.SetStage(1000)

;Sets global value to determine which scene Ada will play
If Alias_Ada.GetActorRef().IsInFaction(CurrentCompanionFaction)
    DLC01MQ01PlayerKilledRoboWithAda.SetValue(1)
EndIf

;Move Ada if she's not a companion
If Alias_Ada.GetActorRef().IsInFaction(CurrentCompanionFaction) == 0
   kmyQuest.MoveAda()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2400_Item_00
Function Fragment_Stage_2400_Item_00()
;BEGIN AUTOCAST TYPE dlc01:mq02questscript
Quest __temp = self as Quest
dlc01:mq02questscript kmyQuest = __temp as dlc01:mq02questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(2200)
SetObjectiveDisplayed(2400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2400) ; speak to Ada
SetObjectiveDisplayed(2500) ; build workbench - always do this so you don't end up with 2 "speak to Ada" back to back

;Check for existing robot workbenches - if you have one, progress quest
If Alias_WorkbenchRobots.GetCount() > 0
  SetObjectiveCompleted(2500)
   SetObjectiveDisplayed(2600)
   SetStage(2600)
EndIf

;Add items to build Robotics Workbench to workshop (if you have one)
WorkshopScript myWorkshop = DLC01MQ00.GetRobotWorkbenchWorkshop()
if myWorkshop == NONE
  myWorkshop = Alias_SanctuaryWorkshop.GetRef() as WorkshopScript
endif
myWorkshop.AddItem(DLC01MQ02RoboticsWorkbenchItems)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2600_Item_00
Function Fragment_Stage_2600_Item_00()
;BEGIN CODE
;Objectives displayed and completed handled by MQ02QuestScript
SetObjectiveDisplayed(2600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2800_Item_00
Function Fragment_Stage_2800_Item_00()
;BEGIN AUTOCAST TYPE dlc01:mq02questscript
Quest __temp = self as Quest
dlc01:mq02questscript kmyQuest = __temp as dlc01:mq02questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(2600)
SetObjectiveCompleted(2700)
SetObjectiveDisplayed(2800)

;Unlock Radar Beacon Mod
co_DLC01Bot_Misc_MQ02RadarBeacon_Global.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2900_Item_00
Function Fragment_Stage_2900_Item_00()
;BEGIN AUTOCAST TYPE dlc01:mq02questscript
Quest __temp = self as Quest
dlc01:mq02questscript kmyQuest = __temp as dlc01:mq02questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(2800)
SetObjectiveDisplayed(2900)

;Lock up Radar Beacon Mod
co_DLC01Bot_Misc_MQ02RadarBeacon_Global.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2950_Item_00
Function Fragment_Stage_2950_Item_00()
;BEGIN CODE
;Fire up radiant quest DLC01MQ04_01RadiantAssault for DLC01MQ04
DLC01MQ04_01RadiantAssault.Start()

;Start up DLC01MQ04 (which gives radiant a chance to start)
;DLC01MQ04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3000_Item_00
Function Fragment_Stage_3000_Item_00()
;BEGIN CODE
;Sets a stage on DLC01MasterQuest to unlock selling of robot parts.
DLC01MasterQuest.SetStage(20)

;Update radio scene
DLC01MechanistRadio.SetStage(100)

SetObjectiveCompleted(2900)
CompleteAllObjectives()

;Startup next quest.
DLC01MQ04.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property DLC01MQ02RoboticsWorkbenchItems Auto Const
LeveledItem Property DLC01MQ05RobotMaterialItems Auto Const

LocationAlias Property Alias_GeneralAtomicsFactoryLocation Auto Const Mandatory

ReferenceAlias Property Alias_Ada Auto Const Mandatory
ReferenceAlias Property Alias_GeneralAtomicsFactoryMapMarker Auto Const Mandatory
ReferenceAlias Property Alias_SanctuaryWorkshop Auto Const Mandatory

Message Property DLC01MQ02RoboticsWorkbenchPH Auto Const

Quest Property DLC01MQ01 Auto Const
Quest Property MQ102 Auto Const
Quest Property Followers Auto Const
Quest Property DLC01MasterQuest Auto Const
Quest Property DLC01MQ04 Auto Const Mandatory
Quest Property DLC01MQ01Caravan Auto Const Mandatory
Quest Property DLC01MQ04_01RadiantAssault Auto Const Mandatory
Quest Property DLC01MechanistRadio Auto Const Mandatory

ObjectReference Property CodsworthTalkMarker Auto Const

GlobalVariable Property co_DLC01Bot_Misc_MQ02RadarBeacon_Global Auto Const
GlobalVariable Property DLC01MQ01PlayerKilledRoboWithAda Auto Const

Faction Property CurrentCompanionFaction Auto Const

ObjectReference Property PDLC01GenAtomicsFactoryMechBotEnabler Auto Const Mandatory

RefCollectionAlias Property Alias_WorkbenchRobots Auto Const Mandatory

DLC01:DLC01MQ00Script Property DLC01MQ00 Auto Const Mandatory
