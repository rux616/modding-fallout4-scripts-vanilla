;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__0105FDB7 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.GetLinkedRef(LinkCustom01).EnableNoWait()
akTerminalRef.GetLinkedRef(LinkCustom01).MoveTo(akTerminalRef.GetLinkedRef(LinkCustom01).GetLinkedRef())
akTerminalRef.GetLinkedRef(LinkCustom02).PlayAnimation("Play01")
(akTerminalRef as DN116PodTerminalScript).bHasActivated = TRUE
DN116.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const

Keyword Property LinkCustom02 Auto Const

Quest Property DN116 Auto Const
