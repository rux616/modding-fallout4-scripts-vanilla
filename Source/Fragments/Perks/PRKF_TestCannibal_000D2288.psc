;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_TestCannibal_000D2288 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; animations
Game.GetPlayer().StartCannibal(akTargetRef as Actor)

; Effect
PerkCannibalHeal.Cast(Game.GetPlayer(), Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property PerkCannibalHeal Auto Const
