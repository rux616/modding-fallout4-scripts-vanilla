;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AcadiaDialogue_010052B7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
StairwellDoor.SetLockLevel(255)
StairwellDoor.Lock(true)
FaradayDoor.SetLockLevel(255)
FaradayDoor.Lock(true)
BackStairDoor.SetLockLevel(255)
BackStairDoor.Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;DLC03AcadiaMiscPointers.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;DLC03AcadiaMiscPointers.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;open doors
StairwellDoor.SetLockLevel(0)
StairwellDoor.Lock(false)
FaradayDoor.SetLockLevel(0)
FaradayDoor.Lock(False)

;move Chase to starting position
Chase.GetReference().Moveto(ChaseStartMarker)
Chase.GetActorReference().EvaluatePackage()

;start up relevant scenes/quests
DLC03AcadiaDialogueDimaFaradayScene.Start()
DLC03AcadiaDialogueChaseInitialScene.Start()
DLC03AcadiaM01.Start()

;enable exterior generic actors
GenericNPCEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC03AcadiaDialogueDiMAFaradayScene Auto Const Mandatory

Scene Property DLC03AcadiaDialogueChaseInitialScene Auto Const Mandatory

ObjectReference Property StairwellDoor Auto Const

ObjectReference Property FaradayDoor Auto Const

ObjectReference Property ChaseStartMarker Auto Const

ReferenceAlias Property Chase Auto Const

ObjectReference Property BackStairDoor Auto Const

Quest Property DLC03AcadiaM01 Auto Const Mandatory

Quest Property DLC03AcadiaMiscPointers Auto Const Mandatory

ObjectReference Property GenericNPCEnableMarker Auto Const
