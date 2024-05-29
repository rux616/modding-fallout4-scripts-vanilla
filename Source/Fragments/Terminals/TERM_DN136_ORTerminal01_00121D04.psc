;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN136_ORTerminal01_00121D04 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DN136_ORSentryBotActivator01.activate(DN136_ORSentryBotActivator01)
(DN136_SentryBot01 as Actor).RemoveFromAllFactions()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN136_ORSentryBotActivator01 Auto Const

ObjectReference Property DN136_SentryBot01 Auto Const

Faction Property InstituteFaction Auto Const
