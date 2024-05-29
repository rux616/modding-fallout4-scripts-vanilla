Scriptname DLC01:FXShaderOnEffect extends ActiveMagicEffect
{Simple Script for adding and removing and effect shader.}

EffectShader Property AddedEffectShader Auto Const Mandatory

Bool bOkToPlay = True

Event OnEffectStart(Actor Target, Actor Caster)
	if bOkToPlay
		AddedEffectShader.play(target)
	endif
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	bOkToPlay = False
	AddedEffectShader.stop(target)
EndEvent