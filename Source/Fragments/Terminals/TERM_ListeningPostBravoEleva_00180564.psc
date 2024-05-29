;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_ListeningPostBravoEleva_00180564 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
(pElevatorObject as LoadElevatorPanelScript).MakeElevatorFunctional()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ScriptObject Property pElevatorMaster Auto Const

ObjectReference Property pElevatorObject Auto Const
