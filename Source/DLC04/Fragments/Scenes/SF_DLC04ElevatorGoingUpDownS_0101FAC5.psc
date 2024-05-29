;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04ElevatorGoingUpDownS_0101FAC5 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MasterQuestScript
DLC04:DLC04MasterQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MasterQuestScript
;END AUTOCAST
;BEGIN CODE
ObjectReference elevatorRef = elevator.getReference()
LoadElevatorDoorScript elevatorScript = elevatorRef as LoadElevatorDoorScript
if elevatorScript != none
     elevatorScript.LoadElevatorDown.SetValueInt(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property elevator Auto Const
