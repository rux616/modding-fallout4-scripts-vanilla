;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN041_MainFrameSubtermi_0010195B Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
DN041_Elevator.setValue(1)
DN041_ElevatorEnabler.Enable()
DN041_Panel.MakeElevatorFunctional()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DN041_Elevator Auto Const

ObjectReference Property DN041_ElevatorEnabler Auto Const

loadelevatorpanelscript Property DN041_Panel Auto Const
