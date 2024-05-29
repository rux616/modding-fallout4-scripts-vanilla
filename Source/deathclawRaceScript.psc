Scriptname deathclawRaceScript extends ActiveMagicEffect  
{This script runs on all memnbers of the Deathclaw race}

import Debug			; Import Debug for access to trace
import objectReference	; Import for access to rampRumble()
import Actor			; Import for access to GetCombatTarget and Dismember
import utility			; Import for access to RandomInt

Actor property mySelf auto hidden
Explosion Property AoEIntimidateEffect Auto Const

EVENT OnEffectStart(ACTOR akTarget, ACTOR akCaster)
	mySelf = getTargetActor()
	RegisterForAnimationEvent(mySelf, "FootLeft")
	RegisterForAnimationEvent(mySelf, "FootRight")
	RegisterForAnimationEvent(mySelf, "Intimidate")
	RegisterForAnimationEvent(mySelf, "GibTarget")
endEVENT

FUNCTION GibTarget( )

	Actor target = mySelf.GetCombatTarget()
	Actor player = Game.GetPlayer()
	if ( target && target != player && target.GetRace() == player.GetRace() )
		trace("Deathclaw: turning combat target into chunky salsa")
		
		string[] bodyParts = new string[6]
		bodyParts[0] = "Torso"
		bodyParts[1] = "Head1"
		bodyParts[2] = "LeftLeg1"
		bodyParts[3] = "RightLeg1"
		bodyParts[4] = "LeftArm1"
		bodyParts[5] = "RightArm1"

		int currentElement = 0
		while (currentElement < bodyParts.Length)
			if ( RandomInt( 0, 1 ) == 0 )
				bool forceExplode = ( RandomInt( 0, 1 ) == 0 ) 
				bool forceDismember = !forceExplode
				target.Dismember( bodyParts[currentElement], forceExplode, forceDismember )
			endif
			currentElement += 1
		endWhile
	endif
		
ENDFUNCTION


EVENT onAnimationEvent(objectReference akSource, string asEventName)
	
	if (asEventName == "FootLeft" || asEventName == "FootRight")
		; trace("Deathclaw Footfall caught.")
		mySelf.rampRumble(0.20, 0.01, 512)
	endif

	if (asEventName == "Intimidate")
		trace("Deathclaw: Beginning Taunt")
		mySelf.placeatme (AoEIntimidateEffect)
	endif

	if (asEventName == "GibTarget" )
		GibTarget( )
		; TEMP - trying to also place the intimidate whenever gibbing.
		mySelf.placeatme (AoEIntimidateEffect)
	endif
	
endEVENT
