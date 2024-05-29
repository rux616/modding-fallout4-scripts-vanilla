Scriptname DLC04:DLC04_BloatedAmbushScript extends ObjectReference
{Explodes corpse and spawns actors when player gets too close or corpse is hit}

ActorBase property myLeveledList Auto Mandatory
{Set to DLC04_EncBloodworm*}
Int Property numOfActors = 3 Auto
{Num of actors to spawn}
Float Property	distanceToExplosion = 300.0 Auto
{The distance check to Player before exploding corpse}
EffectShader Property myFX Auto Mandatory
{BloodSplatterHeavyParticles}

;**************************************************
ObjectReference myActor
int counter = 0

;**************************************************

Function ExplodeMe()
	GotoState("Done")
	self.DamageObject(10)
	while(counter < numOfActors)
		myActor = self.PlaceAtMe(myLeveledList, 1, false, false, true)
		myFX.Play(myActor, 5.0)
		counter = counter + 1
		Utility.Wait(0.1)
	endWhile
EndFunction

;**************************************************

Auto State Waiting
	Event OnLoad()
	    RegisterForDistanceLessThanEvent(self, game.GetPlayer(), distanceToExplosion)
	    RegisterForHitEvent(self)
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
		bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
		;was hit by something, explode!
		UnregisterForAllEvents()
		ExplodeMe()
	EndEvent

	Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
		;Player is now close enough to the corpse, explode it and spawn the actors
		UnregisterForAllEvents()
		ExplodeMe()
	endEvent
EndState

;**************************************************

State Done
	;do nothing
EndState

;**************************************************