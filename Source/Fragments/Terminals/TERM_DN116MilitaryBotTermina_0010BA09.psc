;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN116MilitaryBotTermina_0010BA09 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DN116BotStartDefending.Stop()
(DN116MilitaryBotREF as DN116MilitaryBotScript).bSentryBotDefending = TRUE
DN116.SetStage(400)
utility.Wait(1)
(DN116 as DN116QuestScript).ClearTargets()
(DN116 as DN116QuestScript).TargetUSAFOlivia = TRUE
(DN116MilitaryBotRef as Actor).EvaluatePackage()
DN116BotStartDefending.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
DN116BotStartDefending.Stop()
(DN116MilitaryBotREF as DN116MilitaryBotScript).bSentryBotDefending = TRUE
DN116.SetStage(400)
utility.Wait(1)
(DN116 as DN116QuestScript).ClearTargets()
(DN116 as DN116QuestScript).TargetSouthBostonCheckpoint = TRUE
(DN116MilitaryBotRef as Actor).EvaluatePackage()
DN116BotStartDefending.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
DN116BotStartDefending.Stop()
(DN116MilitaryBotREF as DN116MilitaryBotScript).bSentryBotDefending = TRUE
DN116.SetStage(400)
utility.Wait(1)
(DN116 as DN116QuestScript).ClearTargets()
(DN116 as DN116QuestScript).TargetSatelliteArray = TRUE
(DN116MilitaryBotRef as Actor).EvaluatePackage()
DN116BotStartDefending.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
DN116BotStartDefending.Stop()
(DN116MilitaryBotREF as DN116MilitaryBotScript).bSentryBotDefending = TRUE
DN116.SetStage(400)
utility.Wait(1)
(DN116 as DN116QuestScript).ClearTargets()
(DN116 as DN116QuestScript).TargetFortHagan = TRUE
(DN116MilitaryBotRef as Actor).EvaluatePackage()
DN116BotStartDefending.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN116 Auto Const

ObjectReference Property DN116MilitaryBotREF Auto Const

Scene Property DN116BotStartDefending Auto Const
