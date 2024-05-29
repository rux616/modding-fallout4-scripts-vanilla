scriptName DLC02:DLC02WorkshopTrapHit extends objectReference
;
;	This script keeps everything needed for a physical trap hit seperate
;	from the base functionality of animating the trap
;	this prevents having to write redundant script and makes it easier to address
;	bugs in a single point of failure.
;	The script is told when it can and cannot hit by whatever trap script is applicable
;
;=========================================

import utility

int property damage = 25 auto Const
int property soundLevel = 10 auto Const
int property trapPushBack auto Const
sound property TrapHitSound auto Const
sound property TrapHitSoundPA auto Const
weapon property hitFX auto Const
ammo property hitFXAmmo auto Const
bool property trapCausesStagger = false Auto Const
{does this trap stagger actors
	default = false}
bool property rumble = false Auto Const
float property rumbleAmount = 0.7 Auto Const
float property rumbleDuration = 0.5 auto Const
bool property cameraShake = false Auto Const
float property cameraShakeAmount = 0.7 auto Const
float property staggerAmount = 0.0 auto Const
bool soundCanPlay = TRUE 
float property soundDelay = 1.0 auto Const
bool property throttleSound = TRUE auto Const
int property hitsBeforeBreak = -1 auto  Const
int currentHits = 0

	
Struct AppliedEffect
	Spell AppliedSpell
	Float SpellChance
EndStruct

;CULL - clean this up later
Group AppliedEffectsProperties
	AppliedEffect[] Property AppliedEffects Auto Const
EndGroup

faction property noHitFaction auto Const
{This faction will not be affected by hits from this trap}

;This only processes the hits, another script should tell this one when to be in the CanHit state
state CanHit	
	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
 		debug.Trace(Self + "::::::::::: OnTrapHitStart!!!!!")
 		debug.Trace(self + " has hit " + akTarget)
 		Actor akActorTarget = (akTarget as actor)
 		if akActorTarget
			if noHitFaction == none || !akActorTarget.IsInFaction(noHitFaction)
				;if hitOnlyOnce
				;	goToState("CannotHit")
				;endif
				akTarget.ProcessTrapHit(self, damage, trapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, staggerAmount)
				;Apply any Spell Effects in the array
				if AppliedEffects.Length > 0
					int i = 0
					int count = AppliedEffects.Length
					float roll
					while i < count
						roll = randomfloat(0.0, 100.0)
						if roll <= AppliedEffects[i].SpellChance
							akActorTarget.DoCombatSpellApply(AppliedEffects[i].AppliedSpell, akTarget)
						EndIf
						i += 1
					EndWhile
				endif
				;Sounds
				Sound MyHitSound
				if akActorTarget.IsInPowerArmor()
					if TrapHitSoundPA
						MyHitSound = TrapHitSoundPA
					endif
				else
					if TrapHitSound
						MyHitSound = TrapHitSound
					endif
				endif
				if MyHitSound
					if throttleSound
						if soundCanPlay
							soundCanPlay = False
							if MyHitSound
								MyHitSound.play( self as ObjectReference)		;play hit sound
							endif
							StartTimer(soundDelay, aiTimerID = 0)
						endif
					Else
						MyHitSound.play( self as ObjectReference)		;play hit sound
					endif
				endif

				bool isPlayer = false
				if akTarget == game.getPlayer()
					isPlayer = True
				endif
				
				if hitsBeforeBreak > 0
					currentHits += 1
				endif

				if hitFX
					hitFX.fire(self, hitFxAmmo)
				endif
				
				CreateDetectionEvent(akActorTarget, soundLevel) ; creates a detection event
				
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

				if currentHits >= hitsBeforeBreak
					DoDisarm()
				endif
			endif
		endif
		;Trace("Damage =")
		;Trace(damage)
			
	endEvent

	Event OnBeginState(string asOldState)
		Debug.trace(Self + ": OnBeginState CAN HIT")
	EndEvent

endState


auto state CannotHit	
	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	EndEvent

	Event OnBeginState(string asOldState)
		Debug.trace(Self + ": OnBeginState CANNOT HIT")
	EndEvent
endState

Function SetCanHit(bool TrapCanHit = true)
	if TrapCanHit
		goToState("CanHit")
	Else
		goToState("CannotHit")
	endif
EndFunction


event onTimer(int aiTimerID)
	if aiTimerID == 0
		soundCanPlay = TRUE
	endif
EndEvent
	
Function DoDisarm()
	;Defined in child functions
EndFunction

Function SetRepaired()
	currentHits = 0
EndFunction

Event OnReset()
	currentHits = 0
EndEvent