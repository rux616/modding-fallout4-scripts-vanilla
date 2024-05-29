Scriptname SubwayPAscript extends ObjectReference Const

float property staticFrequency auto const

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	debug.trace("Subway PA radio: I've been hit!")
	if getRadioFrequency() != staticFrequency
		debug.trace("Subway PA radio: Radio was on, so tune to static.")	
		setRadioFrequency(staticFrequency)
	else
		debug.trace("Subway PA radio: Hit again?  Shut me off!")
		setRadioOn(FALSE)
	endif
EndEvent

; Event OnActivate(ObjectReference akActionRef)
;     debug.trace("Subway PA radio: been hit, tune to static frequency!")
; 	setRadioFrequency(0.0)
; EndEvent