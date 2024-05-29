;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN021_EdwinsTerminal_Za_0100A56C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
DN021_Zapper.SetValue(AvailableCondition1, 1)
DN021_Zapper.Activate(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom10 Auto Const

ActorValue Property AvailableCondition1 Auto Const

ObjectReference Property DN021_Zapper Auto Const
