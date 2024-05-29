Scriptname MoleratBombFXScript extends Actor

Explosion Property moleratExplosion Auto Const
Armor Property SkinMoleratBombVest Auto Const
String Property animEventName Auto Const
float property minHealthPercent Auto Const

ActorValue property HealthAV Auto
float myHealth


Event OnLoad()
	if Is3DLoaded()
	    RegisterForAnimationEvent(self, animEventName)
	    RegisterForHitEvent(self)
	endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (akSource == self) && (asEventName == animEventName)
		Debug.Trace("anim event caught")		
		blowUp()

		self.Kill(self)
	endIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	debug.trace("I got hit")
	Debug.Trace(akTarget + " was hit by " + akAggressor)
	myHealth = self.GetValuePercentage(HealthAV) as float
	debug.trace(myHealth)
	if (myHealth < minHealthPercent)
			UnregisterForAllHitEvents()
			Debug.Trace("molerat has less then 10% health remaining")
			blowUp()
			self.Kill(self)		
	else
		RegisterForHitEvent(self)
	endIf
EndEvent

Event OnDeath(Actor akKiller)
	UnregisterForAllHitEvents()
EndEvent

function blowUp()
	debug.trace("Molerat go BOOM!")
	unequipitem(SkinMoleratBombVest)
	placeatme(moleratExplosion)
	;self.Dismember("Head1", true, true)
	;self.Dismember("LeftLeg1", true, true)
	;self.Dismember("RightLeg1", true, true)
	;self.Dismember("LeftLeg2", true, true)
	;self.Dismember("RightLeg2", true, true)
	;self.Dismember("Left Foot", true, true)
	;self.Dismember("Right Foot", true, true)
	Dismember("Torso", true, true, True)
endFunction