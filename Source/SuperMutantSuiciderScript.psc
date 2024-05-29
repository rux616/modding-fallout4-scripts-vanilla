Scriptname SuperMutantSuiciderScript extends Actor Conditional

Explosion Property FatManExplosion Auto Const
String Property animEventName Auto Const
float property minHealthPercent = 0.05 Auto Const
float property minLimbPercent = 1.0 Auto Const
ActorValue property HealthAV Auto
ActorValue property RightAttackCondition Auto
Weapon Property SuperMutantSuiciderBomb Auto Const
Ammo Property AmmoFatmanMiniNuke Auto Const
MiscObject Property c_NuclearMaterial_scrap Auto Const

float myHealth
float myLimbCondition

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
	Debug.Trace(akTarget + " was hit by " + akAggressor)
	myHealth = self.GetValuePercentage(HealthAV) as float
	myLimbCondition = self.GetValuePercentage(RightAttackCondition) as float
	debug.trace(myHealth)
	if (myHealth < minHealthPercent && myHealth > 0 || myLimbCondition < minLimbPercent)
			UnregisterForAllHitEvents()
			blowUp()
			self.Kill(self)		
	else
		RegisterForHitEvent(self)
	endIf
EndEvent

Event OnDeath(Actor akKiller)
	UnequipItem(SuperMutantSuiciderBomb)
	UnregisterForAllHitEvents()
EndEvent

function blowUp()
	debug.trace("Mutant 'splode")
	placeatme(FatManExplosion)
	UnequipItem(SuperMutantSuiciderBomb)
	RemoveItem(AmmoFatmanMiniNuke)
	AddItem(c_NuclearMaterial_scrap, 2)
	Dismember("Head1", true, true)
	Dismember("RightArm1", true, true)
	Dismember("LeftArm1", true, true)
	Dismember("LeftLeg1", true, true)
	Dismember("RightLeg1", true, true)
	Dismember("Left Foot", true, true)
	Dismember("Right Foot", true, true)
	;Dismember("Torso", true, true)
endFunction
