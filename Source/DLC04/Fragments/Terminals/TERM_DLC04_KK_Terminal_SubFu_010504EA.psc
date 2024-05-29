;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04_KK_Terminal_SubFu_010504EA Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
(akTerminalRef.GetLinkedRef(LinkCustom02) as DLC04:DLC04_KK_FunhouseHynoHallController).SetRideActive(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
(akTerminalRef.GetLinkedRef(LinkCustom02) as DLC04:DLC04_KK_FunhouseHynoHallController).SetRideActive(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom02 Auto Const Mandatory
