Scriptname TurretWiringScript extends Actor Const

keyword property LinkCustom01 auto const

Event OnDying(Actor akKiller)
	GetLinkedRef(LinkCustom01).DamageObject(200.0)
EndEvent