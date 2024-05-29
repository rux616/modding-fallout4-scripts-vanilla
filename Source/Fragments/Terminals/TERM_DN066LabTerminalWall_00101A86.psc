;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN066LabTerminalWall_00101A86 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Enable interior ghouls
DN066FinalGhoulsEnable.Enable()

;Open lab door
DN066LabDoor.Unlock()
DN066LabDoor.SetOpen()

;Open elevator exit door
DN066ExitDoor.Unlock()
DN066ExitDoor.SetOpen()

;Enable exit elevator
(DN066ElevatorCallButton as LoadElevatorPanelScript).MakeElevatorFunctional()

;Open shutters
DN066LabShutter01.PlayAnimation("Play03")
DN066LabShutter02.PlayAnimation("Play03")
DN066LabShutter03.PlayAnimation("Play03")
DN066LabShutter04.PlayAnimation("Play03")
DN066LabShutter05.PlayAnimation("Play03")
DN066LabShutter06.PlayAnimation("Play03")
DN066LabShutter07.PlayAnimation("Play03")
DN066LabShutter08.PlayAnimation("Play03")
DN066LabShutter09.PlayAnimation("Play03")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN066LabShutter01 Auto Const

ObjectReference Property DN066LabShutter02 Auto Const

ObjectReference Property DN066LabShutter03 Auto Const

ObjectReference Property DN066LabShutter04 Auto Const

ObjectReference Property DN066LabShutter05 Auto Const

ObjectReference Property DN066LabShutter06 Auto Const

ObjectReference Property DN066LabShutter07 Auto Const

ObjectReference Property DN066LabShutter08 Auto Const

ObjectReference Property DN066LabShutter09 Auto Const

ObjectReference Property DN066LabDoor Auto Const

ObjectReference Property DN066ExitDoor Auto Const

ObjectReference Property DN066ElevatorEnable Auto Const

ObjectReference Property DN066FinalGhoulsEnable Auto Const

ObjectReference Property DN066ElevatorCallButton Auto Const
