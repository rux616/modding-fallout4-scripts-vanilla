Scriptname critCryoFreezeSCRIPT extends ActiveMagicEffect


ACTORVALUE PROPERTY pFreeze AUTO
ACTORVALUE PROPERTY pHealth AUTO
ACTORVALUE PROPERTY pAnimationMult AUTO

INT PROPERTY newSpeedPercent=35 AUTO

; the victim
ACTOR victim

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
     victim = akTarget

    ;increase the Freeze value in case theyre using the cryolator
    victim.modValue(pFreeze, 5)

	;slow the victim down
	victim.setValue(pAnimationMult, newSpeedPercent)

EndEvent

EVENT OnEffectFinish(Actor akTarget, Actor akCaster)

	; set the Freeze counter back to 20
	victim.damageValue(pFreeze, 5)

	;slow the victim down
	victim.setValue(pAnimationMult, 100)

ENDEVENT