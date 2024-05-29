;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname fragments:perks:prkf_putemup02_00065e49 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Actor victim = akTargetRef as Actor 
victim.addspell(pHoldupFrenzySpell)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ptestHoldupSpell Auto Const

SPELL Property pHoldupFrenzySpell Auto Const
