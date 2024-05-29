Scriptname holdupAddExplosionScript extends ActiveMagicEffect

explosion property holdupExplosion auto mandatory
actor victimActor 

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;***When the player holds up victim actor, place explosion to potentially catch nearby actors***
	victimActor = aktarget
	objectreference myexplosion = victimActor.placeatme(holdupExplosion)
EndEvent