;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__0100791B Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Actor p = Game.GetPlayer()
if (p.GetItemCount(DN056_GreaterMassPassword) == 0)
     p.AddItem(DN056_GreaterMassPassword)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN102 Auto Const

ObjectReference Property DN102_DeconHallwayEnableMarker Auto Const

Quest Property DN056 Auto Const

Key Property DN056_GreaterMassPassword Auto Const
