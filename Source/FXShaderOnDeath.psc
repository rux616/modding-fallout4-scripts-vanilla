Scriptname FXShaderOnDeath extends ActiveMagicEffect 
{Play an effect shader when we die.}

EffectShader property MagicEffectShaderOne auto
{The Effect Shader we want.}

EffectShader property MagicEffectShaderTwo auto
{The other Effect Shader we want.}

EffectShader property MagicEffectRemoved auto
{The Effect Shader we want to remove at the start..}

EffectShader property EnderShader auto
{The Effect Shader we apply at the very end of the magic effect..}

float property ShaderDuration = 0.00 auto
{Duration of Effect Shader.}
float property ShaderDurationTwo = 0.00 auto
{Duration of Effect Shader.}

float property EndShaderDuration = -1.0 auto
{Duration of Effect Shader.}

bool property applyOnEffectStart = FALSE auto

actor Victim



;======================================================================================;
;   EVENTS     /
;=============/

Event OnInit()
	victim = GetTargetActor()
EndEvent

Event OnEffectStart(Actor Target, Actor Caster)
	if applyOnEffectStart == TRUE
		if	MagicEffectRemoved != none
			MagicEffectRemoved.stop(Victim)
		endif

		if	MagicEffectShaderOne != none
			MagicEffectShaderOne.play(Victim,ShaderDuration)
		endif

		if	MagicEffectShaderTwo != none
			MagicEffectShaderTwo.play(Victim,ShaderDurationTwo)
		endif
	endif
EndEvent

Event OnDying(Actor Killer)
	if applyOnEffectStart == FALSE
		if	MagicEffectRemoved != none
			MagicEffectRemoved.stop(Victim)
		endif

		if	MagicEffectShaderOne != none
			MagicEffectShaderOne.play(Victim,ShaderDuration)
		endif

		if	MagicEffectShaderTwo != none
			MagicEffectShaderTwo.play(Victim,ShaderDurationTwo)
		endif
	endif
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	if victim.isDead() 
		if	EnderShader != none
			EnderShader.play(Victim,EndShaderDuration)
			MagicEffectShaderOne.stop(Victim)
			if	MagicEffectShaderTwo != none
				MagicEffectShaderTwo.stop(Victim)
			endif
		endif
	endif
EndEvent