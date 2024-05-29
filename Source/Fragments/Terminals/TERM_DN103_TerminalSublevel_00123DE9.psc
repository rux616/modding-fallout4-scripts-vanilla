;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN103_TerminalSublevel_00123DE9 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Unlock and open door
DN103_DoorSublevel.Unlock()
DN103_DoorSublevel.SetOpen(true)

;Enable robots
DN103_RobotEnable02.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN103_DoorSublevel Auto Const

ObjectReference Property DN103_RobotEnable02 Auto Const
