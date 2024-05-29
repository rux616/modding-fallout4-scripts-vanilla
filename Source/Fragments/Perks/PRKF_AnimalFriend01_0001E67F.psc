;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_AnimalFriend01_0001E67F Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Actor victim = akTargetRef as Actor 
victim.setValue(pHoldupImmuneToExplosionAV, 1)
if victim.HasMagicEffect(pHoldupPacifyEffect) == false
       pholdupPacifyspell.cast(victim)
       utility.wait(1)
       if victim.getValue(pHoldupAv) == 1
           game.IncrementStat("Animals Friended", 1)
       endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property pHoldupPacifySpell Auto Const

ActorValue Property pHoldupImmuneToExplosionAV Auto Const

MagicEffect Property PholdupPacifyEffect Auto Const Mandatory

ActorValue Property pHoldupAV Auto Const Mandatory
