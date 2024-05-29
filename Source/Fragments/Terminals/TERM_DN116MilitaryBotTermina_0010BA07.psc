;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN116MilitaryBotTermina_0010BA07 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DN116MilitaryBotREF.Activate(Game.GetPlayer())
(DN116MilitaryBotREF as DN116MilitaryBotScript).bSentryBotActivate = TRUE
DN116MilitaryBotREF.BlockActivation(FALSE,FALSE)
utility.Wait(2)
DN116.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN116 Auto Const

ObjectReference Property DN116MilitaryBotREF Auto Const
