Scriptname SuperMutantBerserkerScript extends Actor

CombatStyle Property csSMBerserker Auto Const
{Combat style to put actor in when min health percent is reached.}

float property minHealthPercent = 0.75 Auto Const
{Heath percentage for switching combat styles.}

float property ChanceToBerserk = 0.5 Auto Const
{Chance to go berserk at min health.}

Idle property Supermutant_Berserk Auto Const
ActorValue property Health Auto

float myHealth

Event OnLoad()
    RegisterForHitEvent(self)
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	;debug.trace(self + "Health percentage =" + self.GetValuePercentage(Health))
	myHealth = self.GetValuePercentage(Health) as float
	if (myHealth < minHealthPercent)
		UnregisterForAllHitEvents()
		;Debug.Trace( self + "Berserker hit health threshold!")

		float ChanceRoll = Utility.RandomFloat(0, 1)

		if (ChanceToBerserk >= ChanceRoll)
			;debug.trace(self + "Set berserk combat style")
			
			;Play the bererk animation
			;debug.trace(self + "PLAY BERSERK ANIMATION!*****************")
			self.PlayIdle(Supermutant_Berserk)
			
			;Change combat style to berserk attack
			SetCombatSTyle(csSMBerserker)
			;self.EvaluatePackage()
		endif
	else
		RegisterForHitEvent(self)
	endIf
EndEvent

Event OnDeath(Actor akKiller)
	UnregisterForAllHitEvents()
EndEvent
