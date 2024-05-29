;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_elevatorGoingUpDownScene_00178D81 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE DNMasterQuestScript
DNMasterQuestScript kmyQuest = GetOwningQuest() as DNMasterQuestScript
;END AUTOCAST
;BEGIN CODE
ObjectReference elevatorRef = AliasElevator.getReference()
LoadElevatorDoorScript elevatorScript = elevatorRef as LoadElevatorDoorScript
if elevatorScript != none
elevatorScript.LoadElevatorDown.SetValueInt(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property AliasElevator Auto Const
