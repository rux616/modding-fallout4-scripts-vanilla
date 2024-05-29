;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN042_SecurityDoorTermi_000EC354 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.getLinkedRef().Activate(akTerminalRef.getLinkedRef())
akTerminalRef.getLinkedRef(LinkCustom01).Activate(akTerminalRef.getLinkedRef(LinkCustom01))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.getLinkedRef().Activate(akTerminalRef.getLinkedRef())
akTerminalRef.getLinkedRef(LinkCustom01).Activate(akTerminalRef.getLinkedRef(LinkCustom01))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property pLinkCustom01 Auto Const

Keyword Property LinkCustom01 Auto Const
