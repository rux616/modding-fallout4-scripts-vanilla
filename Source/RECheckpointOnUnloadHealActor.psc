Scriptname RECheckpointOnUnloadHealActor extends Actor

GlobalVariable Property RECheckpointHealDaysUntilReset Const Auto
ActorValue Property Rads Auto Const
float HealResetTimer = 0.0

Event OnUnload()
	;debug.trace(self + "RECheckpoint Heal: Actor unloaded. Current time: " + Utility.GetCurrentGameTime() + ". Reset time: "+ HealResetTimer)

	;If defender is alive, not in combat, and enough time has passed...
	if !self.IsDead() && !self.IsInCombat() && Utility.GetCurrentGameTime() >= HealResetTimer
		
		;Lose any rads the actor has...
		self.RestoreValue(Rads, self.GetValue(Rads))

		;Reset their health and limb damage...
		self.ResetHealthandLimbs()

		;And set their timestamp so this won't happen again until the appropriate amount of time has passed.
		HealResetTimer = Utility.GetCurrentGameTime() + RECheckpointHealDaysUntilReset.GetValue()

		;debug.trace(self + "RECheckpoint Heal: Reseting health and limbs. Updated reset timer: " + HealResetTimer)
	endif
EndEvent