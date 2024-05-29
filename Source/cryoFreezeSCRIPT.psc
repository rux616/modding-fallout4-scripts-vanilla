Scriptname cryoFreezeSCRIPT extends ActiveMagicEffect
{Gradually freeze the target, eventually ice explode them. }

import debug
import FormList

ACTORVALUE PROPERTY pFreeze AUTO
ACTORVALUE PROPERTY pHealth AUTO
ACTORVALUE PROPERTY pAnimationMult AUTO

;Different frozen states
KEYWORD PROPERTY pfrozenState01 AUTO
KEYWORD PROPERTY pfrozenState02 AUTO

BOOL PROPERTY RANK2 = FALSE AUTO
{Should we apply the Frozen effect?}

BOOL PROPERTY RANK3 = FALSE AUTO
{Should we apply the Frozen effect?}

INT PROPERTY frzMod = 10 AUTO
{Divide the freeze count by this number to slow it down}

SPELL PROPERTY pCryoFreezeSpell AUTO
{The Cryo freeze spell}

FLOAT PROPERTY ShaderDuration = 10.00 auto 
{shatter shader duration}

EFFECTSHADER PROPERTY MagicEffectShaderShatter auto 
{the shatter FX}

BOOL PROPERTY CRYOEFFECTREMOVER = FALSE Auto
{Are we the remover?}

; the victim
ACTOR victim

STRING[] limbNameArray
INT currentElement = 0

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
    
    victim = akTarget

    ;increase the Freeze value by one
    victim.modValue(pFreeze, 1)

	;if the Freeze value is above a threshold, set the frozen state
	IF(victim.getValue(pFreeze) * frzMod > (victim.getBaseValue(pHealth) * 0.25) && victim.getValue(pFreeze) * frzMod < (victim.getBaseValue(pHealth) * 0.5))
		victim.addKeyword(pfrozenState01)

		;slow the victim down
		victim.setValue(pAnimationMult, 25)

	ELSEIF(victim.getValue(pFreeze) * frzMod > (victim.getBaseValue(pHealth) * 0.5) && victim.hasKeyword(pfrozenState02) != 1)
		victim.removeKeyword(pfrozenState01)
		victim.addKeyword(pfrozenState02)

		;freeze him!
		pCryoFreezeSpell.cast(game.getPlayer(), victim)

		;reset the slow mo
		victim.setValue(pAnimationMult, 100)

	ENDIF

ENDEVENT

EVENT OnEffectFinish(Actor akTarget, Actor akCaster)

	; if this is the rank 3 version, reset it, but give the player a little bump
	IF(CRYOEFFECTREMOVER)
		victim.setValue(pAnimationMult, 100)

		; set the Freeze counter back to 20
		victim.damageValue(pFreeze, victim.getValue(pFreeze))

	ELSEIF(RANK3 && (victim.isDead() == FALSE))
		
		victim.setValue(pAnimationMult, 100)

		; set the Freeze counter back to 20
		victim.damageValue(pFreeze, victim.getValue(pFreeze) - 20)

		; also drop them to stage 1
		victim.addKeyword(pfrozenState01)
		victim.removeKeyword(pfrozenState02)	
	ENDIF

ENDEVENT

; ////////////////////////////// ;
; // ON DYING WHILE IN RANK 3 // ;
; ////////////////////////////// ;

EVENT OnDying(Actor Killer)
	
	IF(RANK3)

		MagicEffectShaderShatter.play(victim, ShaderDuration)

  		IF (currentElement < (limbNameArray.Length - 2))
  	 		Victim.Dismember(limbNameArray[currentElement], False, True)
    		Victim.Dismember((limbNameArray[currentElement + 1]), False, True)
    		currentElement += 2
	   		StartTimer(Utility.RandomFloat(0.01, 0.2) , 1)
	   	ELSE
			Victim.Dismember(limbNameArray[currentElement], False, True)
	   		Victim.Dismember("Torso", True, True)
	   		Victim.SetCriticalStage(Victim.CritStage_FreezeEnd)

	   	ENDIF

	ENDIF

ENDEVENT