;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN160_StudioTerminalLig_010212B0 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DN160_Lights_A.EnableNoWait(False)
DN160_Lights_B.DisableNoWait(False)
DN160_Lights_C.DisableNoWait(False)
DN160_Lights_Off.DisableNoWait(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
DN160_Lights_A.DisableNoWait(False)
DN160_Lights_B.EnableNoWait(False)
DN160_Lights_C.DisableNoWait(False)
DN160_Lights_Off.DisableNoWait(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
DN160_Lights_A.DisableNoWait(False)
DN160_Lights_B.DisableNoWait(False)
DN160_Lights_C.EnableNoWait(False)
DN160_Lights_Off.DisableNoWait(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
DN160_Lights_A.DisableNoWait(False)
DN160_Lights_B.DisableNoWait(False)
DN160_Lights_C.DisableNoWait(False)
DN160_Lights_Off.EnableNoWait(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN160_Lights_A Auto Const

ObjectReference Property DN160_Lights_B Auto Const

ObjectReference Property DN160_Lights_C Auto Const

ObjectReference Property DN160_Lights_Off Auto Const
