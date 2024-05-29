;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQ04_01002833 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Set Sanctuary workshop to be owned by player and give items.
(SanctuaryWorkshopRef as WorkshopScript).SetOwnedByPlayer(True)
SanctuaryWorkshopRef.AddItem(DLC01MQ02RoboticsWorkbenchItems)

;Place a robot workbench in Sanctuary near the player.
Alias_WorkbenchRobotQuickstart.ForceRefTo(CarlaAtSanctuaryHillsMarker.PlaceAtMe(WorkbenchRobot))

;Give player enough materials to build a robot.
Game.GetPlayer().AddItem(DLC01MQ05RobotMaterialItems)

;Set Ada available as a companion
Alias_DLC01MQ04Ada.GetActorRef().SetAvailableToBeCompanion()

;Move Ada to Sanctuary and make her a companion
Alias_DLC01MQ04Ada.GetActorRef().MoveTo(CodsworthTalkMarker)
DLC01COMRobotCompanion.SetStage(70)

;Complete Pre-Reqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set DLC01MQ01 complete
DLC01MQ01.SetStage(2100)
DLC01MQ01.SetStage(2200)
DLC01MQ01.SetStage(2300)
DLC01MQ01.SetStage(2400)
DLC01MQ01.SetStage(2430)
DLC01MQ01.SetStage(3000)

;Set DLC01MQ02 complete
DLC01MQ02.SetStage(2100)
DLC01MQ02.SetStage(2200)
DLC01MQ02.SetStage(2300)
DLC01MQ02.SetStage(2400)
DLC01MQ02.SetStage(2500)
DLC01MQ02.SetStage(2600)
DLC01MQ02.SetStage(2800)
DLC01MQ02.SetStage(2900)
DLC01MQ02.SetStage(2950)
DLC01MQ02.SetStage(3000)

;Internal Stage Setting
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Set Sanctuary workshop to be owned by player and give items.
(SanctuaryWorkshopRef as WorkshopScript).SetOwnedByPlayer(True)
SanctuaryWorkshopRef.AddItem(DLC01MQ02RoboticsWorkbenchItems)

;Place a robot workbench in Sanctuary near the player.
Alias_WorkbenchRobotQuickstart.ForceRefTo(CarlaAtSanctuaryHillsMarker.PlaceAtMe(WorkbenchRobot))

;Give player enough materials to build a robot.
Game.GetPlayer().AddItem(DLC01MQ05RobotMaterialItems)

;Set Ada available as a companion
Alias_DLC01MQ04Ada.GetActorRef().SetAvailableToBeCompanion()

;Move Ada to Sanctuary and make her a companion
Alias_DLC01MQ04Ada.GetActorRef().MoveTo(CodsworthTalkMarker)
DLC01COMRobotCompanion.SetStage(70)


;Complete Pre-Reqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set DLC01MQ01 complete
DLC01MQ01.SetStage(2100)
DLC01MQ01.SetStage(2200)
DLC01MQ01.SetStage(2300)
DLC01MQ01.SetStage(2400)
DLC01MQ01.SetStage(2430)
DLC01MQ01.SetStage(3000)

;Set DLC01MQ02 complete
DLC01MQ02.SetStage(2100)
DLC01MQ02.SetStage(2200)
DLC01MQ02.SetStage(2300)
DLC01MQ02.SetStage(2400)
DLC01MQ02.SetStage(2500)
DLC01MQ02.SetStage(2600)
DLC01MQ02.SetStage(2800)
DLC01MQ02.SetStage(2900)
DLC01MQ02.SetStage(2950)
DLC01MQ02.SetStage(3000)

;Internal Stage Setting
SetStage(10)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Move player to Hagen
Game.GetPlayer().MoveTo(DLC01MQ04HagenStart)

;Set Sanctuary workshop to be owned by player and give items.
(SanctuaryWorkshopRef as WorkshopScript).SetOwnedByPlayer(True)
SanctuaryWorkshopRef.AddItem(DLC01MQ02RoboticsWorkbenchItems)

;Place a robot workbench in Sanctuary near the player.
Alias_WorkbenchRobotQuickstart.ForceRefTo(CarlaAtSanctuaryHillsMarker.PlaceAtMe(WorkbenchRobot))

;Give player enough materials to build a robot.
Game.GetPlayer().AddItem(DLC01MQ05RobotMaterialItems)

;Set Ada available as a companion
Alias_DLC01MQ04Ada.GetActorRef().SetAvailableToBeCompanion()

;Move Ada to Sanctuary and make her a companion
Alias_DLC01MQ04Ada.GetActorRef().MoveTo(CodsworthTalkMarker)
DLC01COMRobotCompanion.SetStage(70)


;Complete Pre-Reqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set DLC01MQ01 complete
DLC01MQ01.SetStage(2100)
DLC01MQ01.SetStage(2200)
DLC01MQ01.SetStage(2300)
DLC01MQ01.SetStage(2400)
DLC01MQ01.SetStage(2430)
DLC01MQ01.SetStage(3000)

;Set DLC01MQ02 complete
DLC01MQ02.SetStage(2100)
DLC01MQ02.SetStage(2200)
DLC01MQ02.SetStage(2300)
DLC01MQ02.SetStage(2400)
DLC01MQ02.SetStage(2500)
DLC01MQ02.SetStage(2600)
DLC01MQ02.SetStage(2800)
DLC01MQ02.SetStage(2900)
DLC01MQ02.SetStage(2950)
DLC01MQ02.SetStage(3000)

;Internal Stage Setting
SetStage(10)
SetStage(20)
SetStage(100)
SetStage(50)
SetStage(110)
SetStage(120)
SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Move player to Sanctuary
Game.GetPlayer().MoveTo(CodsworthTalkMarker)

;Set Sanctuary workshop to be owned by player and give items.
(SanctuaryWorkshopRef as WorkshopScript).SetOwnedByPlayer(True)
SanctuaryWorkshopRef.AddItem(DLC01MQ02RoboticsWorkbenchItems)

;Place a robot workbench in Sanctuary near the player.
Alias_WorkbenchRobotQuickstart.ForceRefTo(CarlaAtSanctuaryHillsMarker.PlaceAtMe(WorkbenchRobot))

;Give player enough materials to build a robot.
Game.GetPlayer().AddItem(DLC01MQ05RobotMaterialItems)

;Set Ada available as a companion
Alias_DLC01MQ04Ada.GetActorRef().SetAvailableToBeCompanion()

;Move Ada to Sanctuary and make her a companion
Alias_DLC01MQ04Ada.GetActorRef().MoveTo(CodsworthTalkMarker)
DLC01COMRobotCompanion.SetStage(70)


;Complete Pre-Reqs for DLC01
MQ102.SetStage(10)
MQ102.SetStage(15)
MQ102.SetStage(20)

;Set DLC01MQ01 complete
DLC01MQ01.SetStage(2100)
DLC01MQ01.SetStage(2200)
DLC01MQ01.SetStage(2300)
DLC01MQ01.SetStage(2400)
DLC01MQ01.SetStage(2430)
DLC01MQ01.SetStage(3000)

;Set DLC01MQ02 complete
DLC01MQ02.SetStage(2100)
DLC01MQ02.SetStage(2200)
DLC01MQ02.SetStage(2300)
DLC01MQ02.SetStage(2400)
DLC01MQ02.SetStage(2500)
DLC01MQ02.SetStage(2600)
DLC01MQ02.SetStage(2800)
DLC01MQ02.SetStage(2900)
DLC01MQ02.SetStage(2950)
DLC01MQ02.SetStage(3000)

;Internal Stage Setting
SetStage(10)
SetStage(20)
SetStage(100)
SetStage(50)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(180)
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DLC01MQ03_01RadiantAssault.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,1)

DLC01MQ04Stage120TriggerRef.Enable()
DLC01FortHagenSatelliteArrayMapMarker.AddToMap()

;Start up dungeon quest
PDLC01FortHagenSatelliteArrayQuest.setstage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Trigger near Satellite Array
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120,1)
SetObjectiveDisplayed(130,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130,1)
SetObjectiveDisplayed(140,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140,1)
SetObjectiveDisplayed(150,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150,1)
SetObjectiveDisplayed(160,1)

;Robohead Picked Up
DLC01JezebelHagenRef.Disable()
Game.GetPlayer().AddItem(Alias_DLC01MQ04RoboheadCarried.GetRef())

;Set stage on dungeon quest to start sentry bot battle
PDLC01FortHagenSatelliteArrayQuest.setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160,1)
SetObjectiveDisplayed(170,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0184_Item_00
Function Fragment_Stage_0184_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_DLC01MQ04RoboheadCarried.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170,1)
SetObjectiveDisplayed(180,1)

co_DLC01Bot_Head_Robobrain_Jezebel_Global.SetValue(1)

;Turn of Jezebel's Ambient Lines
DLC01FortHagenSatelliteArrayQuest.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180,1)
SetObjectiveDisplayed(190,1)
Game.GetPlayer().RemoveItem(Alias_DLC01MQ04RoboheadCarried.GetRef())
co_DLC01Bot_Head_Robobrain_Jezebel_Global.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Game.AddAchievement(52)

;Start Next Quests
DLC01MQ04Post.SetStage(10)
DLC01MQ05.SetStage(10)

;[CT] Progress Mechanist Radio
DLC01MechanistRadio.SetStage(200)

;Clear Jezebel
DLC01JezebelMasterAliasEssential.Clear()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC01FortHagenSatelliteArrayMapMarker Auto Const Mandatory

ObjectReference Property DLC01MQ04MachineRef Auto Const Mandatory

WorkshopParentScript Property WorkshopParent Auto Const

Faction Property HasBeenCompanionFaction Auto Const Mandatory

Quest Property DLC01MQ01 Auto Const Mandatory

Quest Property MQ102 Auto Const Mandatory

ObjectReference Property CodsworthTalkMarker Auto Const Mandatory

Quest Property DLC01MQ02 Auto Const Mandatory

Quest Property DLC01MQ05 Auto Const Mandatory

ObjectReference Property PDLC01MQ04SentryBot Auto Const Mandatory

ObjectReference Property PDLC01MQ04Klaxon01 Auto Const Mandatory

ObjectReference Property PDLC01MQ04Klaxon02 Auto Const Mandatory

ObjectReference Property PDLC01MQ04SentryBotDoor01 Auto Const Mandatory

ObjectReference Property PDLC01MQ04SentryBotDoor02 Auto Const Mandatory

ObjectReference Property DLC01MQ04BRTerminalRef Auto Const Mandatory

Quest Property PDLC01FortHagenSatelliteArrayQuest Auto Const Mandatory

ReferenceAlias Property Alias_DLC01MQ04RoboheadCarried Auto Const Mandatory

ObjectReference Property DLC01MQ04Stage120TriggerRef Auto Const Mandatory

ObjectReference Property DLC01LairMapMarkerRef01 Auto Const Mandatory

Quest Property DLC01MQ04Post Auto Const Mandatory

Quest Property DLC01MQ03_01RadiantAssault Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Head_Robobrain_Jezebel_Global Auto Const Mandatory

ObjectReference Property DLC01MQ04HagenStart Auto Const Mandatory

ObjectReference Property DLC01JezebelHagenRef Auto Const Mandatory

LeveledItem Property DLC01MQ02RoboticsWorkbenchItems Auto Const Mandatory

ObjectReference Property SanctuaryWorkshopREF Auto Const Mandatory

ObjectReference Property CarlaAtSanctuaryHillsMarker Auto Const Mandatory

LeveledItem Property DLC01MQ05RobotMaterialItems Auto Const Mandatory

ReferenceAlias Property Alias_DLC01MQ04Ada Auto Const Mandatory

ReferenceAlias Property Alias_WorkbenchRobotQuickstart Auto Const Mandatory

Quest Property DLC01COMRobotCompanion Auto Const Mandatory

Furniture Property WorkbenchRobot Auto Const Mandatory

Quest Property DLC01MechanistRadio Auto Const Mandatory

Quest Property DLC01FortHagenSatelliteArrayQuest Auto Const

ReferenceAlias Property Alias_DLC01MQ04JezebelBuilt Auto Const Mandatory

ReferenceAlias Property DLC01JezebelMasterAliasEssential Auto Const
