scriptName DLC04:DLC04RideGenericTrapHit extends objectReference
;
;
;
;=========================================

import utility

int property damage = 40 auto const
int property soundLevel = 10 auto const
int property trapPushBack auto const
sound property TrapHitSound auto const
weapon property hitFX auto const
ammo property hitFXAmmo auto const
bool property trapCausesStagger = false Auto const
{does this trap stagger actors
	default = false}
bool property rumble = false Auto const
float property rumbleAmount = 0.7 Auto const
float property rumbleDuration = 0.5 auto const
bool property cameraShake = false Auto const
float property cameraShakeAmount = 0.7 auto const
float property staggerAmount = 0.0 auto
bool property soundCanPlay = TRUE auto hidden
float property soundDelay = 1.0 auto const
bool property throttleSound = TRUE auto
;spell property ghostAbility auto
bool property hitOnlyOnce = false auto const
{This variable to act as a safety mechanism,
if this is true, after one trap hit this will put itself
into the cannotHit State, Mainly for bearTrap
	Default == FALSE}

DLC04:DLC04KiddieKingdomMainQuestScript Property DLC04_KiddieKingdomMain Auto Const
int Property myTrapNumber = 0 Auto Const

explosion property pushbackExplosion auto const
objectReference placedExplosion

faction property noHitFaction auto const
{This faction will not be affected by hits from this trap}

;This only processes the hits, another script should tell this one when to be in the CanHit state
state CanHit	
	Event OnBeginState(string asOldState)
	    debug.Trace(self + " Can Hit")
	EndEvent

	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
 		debug.Trace(self + " has hit " + akTarget)
		;if !(akTarget as actor).hasSpell(ghostAbility) && !(akTarget as actor).IsInFaction(noHitFaction)
		;if !(akTarget as actor).IsInFaction(noHitFaction)
			if hitOnlyOnce
				goToState("CannotHit")
			endif
			akTarget.ProcessTrapHit(self, damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount)
			if throttleSound
				if soundCanPlay
					soundCanPlay = False
					if TrapHitSound
						TrapHitSound.play( self as ObjectReference)		;play hit sound
					endif
					StartTimer(soundDelay, aiTimerID = 0)
				endif
			Else
				TrapHitSound.play( self as ObjectReference)		;play hit sound
			endif
			
			bool isPlayer = false
			if akTarget == game.getPlayer()
				isPlayer = True
			endif
			
			actor myTarget
			myTarget = akTarget as Actor
			

			if hitFX
				hitFX.fire(self, hitFxAmmo)
			endif
			CreateDetectionEvent(myTarget, soundLevel) ; creates a detection event
			;/if trapCausesStagger
				placedExplosion = self.placeatme(pushbackExplosion)
				placedExplosion.moveto(self, afXoffset = afXpos, afYoffset = afYpos, afZoffset = afZpos)
			endif/;
			if rumble && isPlayer
				game.ShakeController(rumbleAmount, rumbleAmount, rumbleDuration)
			EndIf
			if cameraShake && isPlayer
				game.ShakeCamera(game.getPlayer(),cameraShakeAmount, rumbleDuration)
			endif

			if DLC04_KiddieKingdomMain && isPlayer && (DLC04_KiddieKingdomMain as Quest).IsRunning()
				DLC04_KiddieKingdomMain.DoTrapPA(myTrapNumber)
			Endif


		;endif
		;Trace("Damage =")
		;Trace(damage)
			
	endEvent
endState


auto state CannotHit
	Event OnBeginState(string asOldState)
	    debug.Trace(self + " Cannot Hit")
	EndEvent	
	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	EndEvent
endState



event onTimer(int aiTimerID)
	if aiTimerID == 0
		soundCanPlay = TRUE
	endif
EndEvent
	