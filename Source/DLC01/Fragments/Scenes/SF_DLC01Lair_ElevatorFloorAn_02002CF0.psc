;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01Lair_ElevatorFloorAn_02002CF0 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
LoadElevatorDoorScript myElevator = Elevator.GetReference() as LoadElevatorDoorScript
if (myElevator != None)
     myElevator.LoadElevatorDown.SetValueInt(2)
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property elevator Auto Const
