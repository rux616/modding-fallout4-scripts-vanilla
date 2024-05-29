;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN166DoorPodTerminal_0014CCD0 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.GetLinkedRef(LinkCustom01).PlayAnimation("Play01")
(akTerminalRef.GetLinkedRef(LinkCustom01) as Default2StateActivator).IsOpen = TRUE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.GetLinkedRef(LinkCustom01).PlayAnimation("Play02")
(akTerminalRef.GetLinkedRef(LinkCustom01) as Default2StateActivator).IsOpen = FALSE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.GetLinkedRef(LinkCustom01).PlayAnimation("Play02")
(akTerminalRef.GetLinkedRef(LinkCustom01) as Default2StateActivator).IsOpen = FALSE
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const
