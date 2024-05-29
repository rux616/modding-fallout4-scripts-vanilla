Scriptname REChkpntDefenderCombatStateChanged extends ReferenceAlias

Faction Property RECheckpointFactionAttacker Auto Const
GlobalVariable Property RECheckpointObjTriggerDistance Auto Const
ReferenceAlias Property CenterMarker Auto Const
Quest Property myQuest Auto Const

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	;If defender is entering combat with an attacker and the obj stage hasn't already fired
	if aeCombatState >= 1 && !myQuest.GetStageDone(210) ;&& akTarget.IsInFaction(RECheckpointFactionAttacker)

		;And the defender is 3d loaded and the player's within the standard trigger distance
		if self.GetActorRef().Is3dLoaded(); && Game.GetPlayer().GetDistance(CenterMarker.GetRef()) < RECheckpointObjTriggerDistance.GetValue()

			;Trigger the objective stage
			debug.trace(self + "Triggering objective via REChkpntDefenderCombatStateChanged against target: " + akTarget)
			myQuest.SetStage(210)
		endif
	endif
EndEvent
