Scriptname CommonTeamDeath_Master extends ObjectReference

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

Function SetStageOnDeath() 

	myQuest.setStage(stage)
	
EndFunction