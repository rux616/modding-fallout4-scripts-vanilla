Scriptname FXCriticalPlasmaScript extends ActiveMagicEffect

{Scripted effect for on death ash pile}

import debug
import FormList

;======================================================================================;
;  PROPERTIES  /
;=============/

float property fDelay = 0.75 auto
									{time to wait before Spawning Ash Pile}
; float property fDelayAlpha = 1.65 auto
; 									{time to wait before Setting alpha to zero.}
float property fDelayEnd = 1.65 auto
									{time to wait before Removing Base Actor}
float property ShaderDuration = 0.00 auto
									{Duration of Effect Shader.}
Activator property AshPileObject auto
									{The object we use as a pile.}
EffectShader property MagicEffectShader auto
									{The Effect Shader we want.}
Bool property bSetAlphaZero = True auto
									{When done, set the Actor Alpha to zero.}
Bool property bSetAlphaToZeroEarly = False Auto
									{Use this if we want to set the actor to invisible somewhere before the effect shader is done.}
bool  property onEffectStartOveride = FALSE auto

;======================================================================================;
;  VARIABLES   /
;=============/

actor Victim

;======================================================================================;
;   EVENTS     /
;=============/

Event OnInit()
	victim = getTargetActor()
EndEvent

Event OnEffectStart(Actor Target, Actor Caster)
	if victim.IsEssential() == False
		if onEffectStartOveride == True
			trace("ASHPILE:::: victim just died")
			; DeadAlready = true
			victim.SetCriticalStage(Victim.CritStage_GooStart)

			;victim.SetAlpha (0.99,False)
			if	MagicEffectShader != none
				MagicEffectShader.play(Victim,ShaderDuration)
			endif
			if bSetAlphaToZeroEarly
				victim.SetAlpha (0.0,True)
			endif
			StartTimer(fDelay, 1)
		endif
	endif
EndEvent


Event OnDying(Actor Killer)
	if victim.IsEssential() == False
		if onEffectStartOveride == False
			trace("ASHPILE:::: victim just died")
			; DeadAlready = true
			victim.SetCriticalStage(Victim.CritStage_GooStart)

			;victim.SetAlpha (0.99,False)
			if	MagicEffectShader != none
				MagicEffectShader.play(Victim,ShaderDuration)
			endif
			if bSetAlphaToZeroEarly
				victim.SetAlpha (0.0,True)
			endif
			StartTimer(fDelay, 1)
		endif
	endif
EndEvent

Event OnTimer(int aiTimerID)		
  If aiTimerID == 1
		Victim.AttachAshPile(AshPileObject)
		StartTimer(fDelayEnd, 2)
  EndIf

   If aiTimerID == 2
		if	MagicEffectShader != none
			MagicEffectShader.stop(Victim)
		endif
		if bSetAlphaZero == True
			victim.SetAlpha (0.0,True)
		endif
		victim.SetCriticalStage(Victim.CritStage_GooEnd)
		trace("ASHPILE:::: We did actually finish this stuff")
  EndIf
EndEvent

