;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN009_SynthTerminal_000B4652 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
LoadElevatorPanelScript myElevatorPanel
myElevatorPanel = ElevatorPanel01 as LoadElevatorPanelScript
myElevatorPanel.MakeElevatorFunctional()
myElevatorPanel = ElevatorPanel02 as LoadElevatorPanelScript
myElevatorPanel.MakeElevatorFunctional()
DN009_ElevatorLoadActive.setValue(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
LoadElevatorPanelScript myElevatorPanel
myElevatorPanel = ElevatorPanel01 as LoadElevatorPanelScript
myElevatorPanel.MakeElevatorNonFunctional()
myElevatorPanel = ElevatorPanel02 as LoadElevatorPanelScript
myElevatorPanel.MakeElevatorNonFunctional()
DN009_ElevatorLoadActive.setValue(0.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ElevatorPanel01 Auto Const

ObjectReference Property ElevatorPanel02 Auto Const

GlobalVariable Property DN009_ElevatorLoadActive Auto Const
