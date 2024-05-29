;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN102_0003479A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;When the player enters the cell, start the intercom radio scene.
;Set by a script on the transmitter.
DN102_HalluciGenIntercomLoop.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Amnesiac Encounter
;When the player gets close enough to the Amnesiac's door or activates it, play the approach scene.
DN102_AmnesiacDoorApproach.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;Amnesiac Encounter
;The Amnesiac unlocks the door and flees.
DN102_AmnesiacDoor.Unlock()
DN102_AmnesiacDoor.SetOpen()
Alias_DN102AmnesiacEnemy.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Amnesiac Encounter
;The Amnesiac refuses to open the door.
Alias_DN102AmnesiacEnemy.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
;Amnesiac Encounter
;If the player opens the door to the Amnesiac's room, she turns hostile.
if (!GetStageDone(23))
     DN102_AmnesiacDoorApproach.Stop()
     DN102_AmnesiacDoorOpened.Start()
     SetStage(27)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
;Amnesiac Encounter
;If the player attacks the Amnesiac or opens the door to her room, she turns hostile.
Actor a = Alias_DN102AmnesiacEnemy.GetActorRef()
a.SetValue(Aggression, 2)
a.StartCombat(Game.GetPlayer())
a.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0028_Item_00
Function Fragment_Stage_0028_Item_00()
;BEGIN CODE
;Amnesiac Encounter
;If the Amnesiac successfully flees the building without being killed, disable her and clear her alias.
if (!GetStageDone(29))
     Alias_DN102AmnesiacEnemy.TryToDisable()
     Alias_DN102AmnesiacEnemy.Clear()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0029_Item_00
Function Fragment_Stage_0029_Item_00()
;BEGIN CODE
;Amnesiac Encounter
;If the Amnesiac is killed, clear her alias so she isn't persistent forever.
Alias_DN102AmnesiacEnemy.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Lab Encounter
;Play the lab entry scene when the player enters the lab area.
DN102_HalluciGenLabEntry.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Lab Encounter
;Release the lockdown on Door #2, opening the door and turning off the button.
DN102_Lab2Door.SetOpenNoWait(True)
DN102_Lab2DoorButton.SetActiveNoWait(False)

;Release the hold positions on the enemies in Lab 2.
ObjectReference[] labActors = DN102_Lab2DoorActivator.GetLinkedRefChain(LinkCustom01)
int i = 0
While (i < labActors.Length)
     labActors[i].SetValue(DMP_ReleaseHoldPosition, 1)
     i = i + 1
EndWhile

;If all three labs are open, the lockdown has ended.
if (GetStageDone(55) && GetStageDone(56) && GetStageDone(58))
     SetStage(59)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN CODE
;Lab Encounter
;Release the lockdown on Door #3, opening the door and turning off the button.
DN102_Lab3Door.SetOpenNoWait(True)
DN102_Lab3DoorButton.SetActiveNoWait(False)

;Release the hold positions on the enemies in Lab 3.
ObjectReference[] labActors = DN102_Lab3DoorActivator.GetLinkedRefChain(LinkCustom01)
int i = 0
While (i < labActors.Length)
     labActors[i].SetValue(DMP_ReleaseHoldPosition, 1)
     i = i + 1
EndWhile

;If all three labs are open, the lockdown has ended.
if (GetStageDone(55) && GetStageDone(56) && GetStageDone(58))
     SetStage(59)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0058_Item_00
Function Fragment_Stage_0058_Item_00()
;BEGIN CODE
;Lab Encounter
;Release the lockdown on Door #5, opening the door and turning off the button.
DN102_Lab5Door.SetOpenNoWait(True)
DN102_Lab5DoorButton.SetActiveNoWait(False)

;Release the hold positions on the enemies in Lab 5.
ObjectReference[] labActors = DN102_Lab5DoorActivator.GetLinkedRefChain(LinkCustom01)
int i = 0
While (i < labActors.Length)
     labActors[i].SetValue(DMP_ReleaseHoldPosition, 1)
     i = i + 1
EndWhile

;If all three labs are open, the lockdown has ended.
if (GetStageDone(55) && GetStageDone(56) && GetStageDone(58))
     SetStage(59)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0059_Item_00
Function Fragment_Stage_0059_Item_00()
;BEGIN CODE
;Once all of the lab doors are open, play the scene announcing the end of the lockdown.
DN102_HalluciGenLabLockdownReleased.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE DN102QuestScript
Quest __temp = self as Quest
DN102QuestScript kmyQuest = __temp as DN102QuestScript
;END AUTOCAST
;BEGIN CODE
;Play the Observation Room Entry Scene
DN102_HalluciGenLabEntry.Stop()
DN102_HalluciGenObsRoomEntry.Start()

;Enable an enemy in Lab #1 for the demo there.
DN102_LabsEnableMarker_Chamber1.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Set the Irradicator room enemy to Frenzied.
Actor iActor = Alias_DN102_IrradicatorEnemy.GetActorRef()
iActor.SetValue(Game.GetAggressionAV(), 3)
iActor.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Give the player the password to the HalluciGen Terminals.
Game.GetPlayer().AddItem(DN102_HalluciGenPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Decontamination Hall Encounter
;Play the venting sound effects.
QSTDN102HallucigenFanLPM.Play(DN102_DeconHallSFXMarker2)

;Disable all of the gas effects and hazards in the decontamination hall.
int i = 0
While (i < Alias_DN102_DeconHallGasRefs.GetCount())
     Alias_DN102_DeconHallGasRefs.GetAt(i).DisableNoWait(True)
     i = i + 1
EndWhile
Alias_DN102_DeconHallGasRefs.RemoveAll()

;Disable the decontamination hall trigger and stop its scenes, if they were playing.
DN102_DeconHallTriggerRef.Disable()
DN102_DeconHallPlayerCoughing.Stop()
DN102_DeconHallEnemyCoughing.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Aggression Auto Const
ActorValue Property DMP_ReleaseHoldPosition Auto Const

ReferenceAlias Property Alias_DN102AmnesiacEnemy Auto Const
RefCollectionAlias Property Alias_DN102_DeconHallGasRefs Auto Const

ObjectReference Property DN102_AmnesiacDoor Auto Const
ObjectReference Property DN102_LabsEnableMarker_Chamber1 Auto Const
ObjectReference Property DN102_DeconHallSFXMarker2 Auto Const
ObjectReference Property DN102_DeconHallTriggerRef Auto Const
ObjectReference Property DN102_Lab2DoorActivator Auto Const
ObjectReference Property DN102_Lab3DoorActivator Auto Const
ObjectReference Property DN102_Lab5DoorActivator Auto Const

Scene Property DN102_AmnesiacDoorApproach Auto Const
Scene Property DN102_HalluciGenLabLockdownReleased Auto Const
Scene Property DN102_AmnesiacFlee Auto Const
Scene Property DN102_HalluciGenIntercomLoop Auto Const
Scene Property DN102_HalluciGenLabEntry Auto Const
Scene Property DN102_HalluciGenObsLabIntro Auto Const
Scene Property DN102_HalluciGenObsRoomEntry Auto Const
Scene Property DN102_DeconHallEnemyCoughing Auto Const
Scene Property DN102_DeconHallPlayerCoughing Auto Const
Scene Property DN102_AmnesiacDoorOpened Auto Const

Key Property DN102_HalluciGenPassword Auto Const

Default2StateActivator Property DN102_Lab2Door Auto Const
ToggleButtonScript Property DN102_Lab2DoorButton Auto Const
Default2StateActivator Property DN102_Lab3Door Auto Const
ToggleButtonScript Property DN102_Lab3DoorButton Auto Const
Default2StateActivator Property DN102_Lab5Door Auto Const
ToggleButtonScript Property DN102_Lab5DoorButton Auto Const

Sound Property QSTDN102HallucigenFanLPM Auto Const

Keyword Property LinkCustom01 Auto Const

ReferenceAlias Property Alias_DN102_CoweringEnemy Auto Const

ReferenceAlias Property Alias_DN102_IrradicatorEnemy Auto Const

ObjectReference Property DN102_CoweringGunnerRef Auto Const

Scene Property DN102_CoweringScene Auto Const
