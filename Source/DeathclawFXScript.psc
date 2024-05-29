Scriptname DeathclawFXScript extends Actor
{Damage for deathclaw}

Armor Property SkinDeathclawCrippleRArm Auto
Armor Property SkinDeathclawCrippleLArm Auto

ImpactDataSet Property NPCDeathclawFootWoodRunImpactSet Auto

ActorValue Property DeathclawAttackConditionAV Auto
ActorValue Property DeathclawEnduranceConditionAV Auto

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self) ; get one hit event, any source
	endif
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	Debug.Trace("OnCripple Received: " + akActorValue + ", " + abCrippled)
	if akActorValue == DeathclawAttackConditionAV
		Dismember( "RightArm1", true, false )
			;Debug.Trace("Testworked on right arm")
			;self.AddItem(SkinDeathclawCrippleRArm, 1, true)
			;self.EquipItem(SkinDeathclawCrippleRArm, false, true)
	endif
	if akActorValue == DeathclawEnduranceConditionAV
		Dismember( "LeftArm1", true, false )
			;Debug.Trace("Testworked on left arm")
			;self.AddItem(SkinDeathclawCrippleLArm, 1, true)
			;self.EquipItem(SkinDeathclawCrippleLArm, false, true)
	endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	self.PlayImpactEffect(NPCDeathclawFootWoodRunImpactSet, "LToe1", 0, 0, -1, 128, false, false)
    RegisterForHitEvent(self) ; we're ready for another hit
EndEvent
