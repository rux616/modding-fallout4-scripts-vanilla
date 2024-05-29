Scriptname DN160_EncounterActorScript extends Actor Hidden
{Script for the sequential ambush actors in DN160 involved in the store combat.}

DN160_EncounterManagerScript property DN160_EncounterManager auto const
{The DN160 Encounter Manager.}

Auto State Ready
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		;Any OnCombatStateChange event triggers the ambush. Make sure the sequential ambush script runs.
		GoToState("Done")
		DN160_EncounterManager.EncounterEvent(2)
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack,  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
		;The actor was hit and will enter combat. Make sure the sequential ambush script runs.
		GoToState("Done")
		DN160_EncounterManager.EncounterEvent(2)
	EndEvent
EndState

State Done
	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		;Do nothing
	EndEvent
EndState


Event OnDeath(Actor akKiller)
	;When the actor dies, notify the sequential ambush script.
	DN160_EncounterManager.SequentialAmbushEnemyDead()
EndEvent