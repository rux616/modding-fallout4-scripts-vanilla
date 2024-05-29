;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN103TerminalDeskSecuri_00122430 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Unlock and open the door
DN103_SecurityDoor01.Unlock()
DN103_SecurityDoor01.SetOpen(true)

;Turn on and aggro the turret
(DN103_Turret01 as actor).SetUnconscious(False)
(DN103_Turret01 as actor).StartCombat(Game.GetPlayer())

;Turn on and aggro the robots
DN103_RobotEnable01.Enable()
(DN103_Protectron01 as actor).SetUnconscious(False)
(DN103_Protectron01 as actor).StartCombat(Game.GetPlayer())\
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN103_Turret01 Auto Const

ObjectReference Property DN103_Protectron01 Auto Const

ObjectReference Property DN103_SecurityDoor01 Auto Const

ObjectReference Property DN103_RobotEnable01 Auto Const
