Scriptname CommonTeamDeath extends Actor

ObjectReference property TeamOwner auto
{ the marker for the team}

auto STATE waiting
	EVENT onDeath(actor killer)
		if CommonTeam.IsDead(TeamOwner)
			(TeamOwner as CommonTeamDeath_Master).SetStageOnDeath()
			;myQuest.setStage(stage)
		
			gotoState("inactive")
		endif
	endEVENT
endSTATE

STATE inactive
endSTATE
