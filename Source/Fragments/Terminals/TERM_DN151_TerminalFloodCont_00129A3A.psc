;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN151_TerminalFloodCont_00129A3A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Force an update of the terminal text here,
;to make sure the security status is up-to-date.
DN151_Tracking.UpdateTerminalText()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DN151_TrackingQuestScript Property DN151_Tracking Auto Const
