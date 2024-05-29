;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__01003D51 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DN070_SecurityDoorOuter.SetOpen(True)
DN070_SecurityDoorOuter02.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
DN070_SecurityDoorOuter.SetOpen(False)
DN070_SecurityDoorOuter02.SetOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
DN070_Turret01.SetValue(Aggression, 0)
DN070_Turret02.SetValue(Aggression, 0)
DN070_Turret03.SetValue(Aggression, 0)
DN070_Turret04.SetValue(Aggression, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN070_SecurityDoorOuter Auto Const

ObjectReference Property DN070_SecurityDoorOuter02 Auto Const

ObjectReference Property DN070_Turret01 Auto Const

ObjectReference Property DN070_Turret02 Auto Const

ObjectReference Property DN070_Turret03 Auto Const

ObjectReference Property DN070_Turret04 Auto Const

ActorValue Property Aggression Auto Const
