Scriptname DLC01:DLC01RobobrainGhostSpawn extends ActiveMagicEffect

Form Property DLC01EncRobobrain01Ghost auto
EffectShader Property AddedEffectShader Auto Const Mandatory

Bool bOkToPlay = True

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.PlaceAtme(DLC01EncRobobrain01Ghost, 2)
	if bOkToPlay
		AddedEffectShader.play(akCaster)
	endif
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	bOkToPlay = False
	AddedEffectShader.stop(Caster)
EndEvent