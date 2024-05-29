;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN102_1FScienceTerminal_000E5239 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
DN102_WeaponsLabPrototypeRef.StartDemo()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
DN102_WeaponsLabPrototypeRef.StopDemo()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property AvailableCondition1 Auto Const

Keyword Property LinkCustom10 Auto Const

DN102_LabDemo3Script Property DN102_WeaponsLabPrototypeRef Auto Const
