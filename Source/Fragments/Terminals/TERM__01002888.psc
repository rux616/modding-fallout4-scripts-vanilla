;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__01002888 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().AddPerk(DN151WaterPerk1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().AddPerk(DN151WaterPerk2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN102 Auto Const

ObjectReference Property DN102_DeconHallwayEnableMarker Auto Const

Perk Property DN151WaterPerk1 Auto Const

Perk Property DN151WaterPerk2 Auto Const
