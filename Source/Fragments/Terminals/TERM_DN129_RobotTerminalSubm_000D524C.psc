;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN129_RobotTerminalSubm_000D524C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Enable hippy hellos
(DN129 as DN129QuestScript).HippyBotHellos = 1
(DrFeelgood as Actor).EvaluatePackage()

;Manage scene loops
DN129DrFeelgoodKillLoop.Stop()
DN129DrFeelgoodLoop.Start()

;Set aggression
(DrFeelgood as Actor).SetValue(Aggression, 0)

;Set protocol variable for package conditions
(DN129 as DN129QuestScript).HippyBotProtocol = 0
(DrFeelgood as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Disable hippy hellos
(DN129 as DN129QuestScript).HippyBotHellos = 0

;Manage scene loops
DN129DrFeelgoodLoop.Stop()
DN129DrFeelgoodKillLoop.Start()

;Set aggression
(DrFeelgood as Actor).SetValue(Aggression, 1)

;Make hostile to all but player, and set protocol variable
DN129_RobotFaction.SetEnemy(FeralGhoulFaction)
(DN129 as DN129QuestScript).HippyBotProtocol = 1
(DrFeelgood as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
;Set protocol variable for package conditions
(DN129 as DN129QuestScript).HippyBotProtocol = 2
(DrFeelgood as Actor).EvaluatePackage()

HestersConsumerRobotics.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DrFeelgood Auto Const

Quest Property DN129 Auto Const

Scene Property DN129DrFeelgoodLoop Auto Const

Faction Property FeralGhoulFaction Auto Const

Faction Property DN129_RobotFaction Auto Const

Scene Property DN129DrFeelgoodKillLoop Auto Const

ActorValue Property Aggression Auto Const

ObjectReference Property HestersConsumerRobotics Auto Const
