;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04GZNukaGalaxy_Termi_010504C1 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
DLC04GZNukaGalaxy.ToggleNukaGalaxyLightingNoWait(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
DLC04GZNukaGalaxy.ToggleNukaGalaxyLightingNoWait(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


DLC04:DLC04GZNukaGalaxyQuestScript Property DLC04GZNukaGalaxy Auto Const Mandatory
