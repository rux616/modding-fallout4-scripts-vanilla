;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN084_Terminal_MassFusi_0015EF44 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Restore power.
DN084.SetStage(250)
StartTimer(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Event OnTimer(int timerID)
	DN084.SetStage(260)
EndEvent


Quest Property DN084 Auto Const
