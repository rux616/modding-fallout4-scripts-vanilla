Scriptname DLC03:DLC03ObjectiveClearScript extends Quest

Function CleanObjective(int nObjectiveNumber)
	if ( IsObjectiveDisplayed(nObjectiveNumber) && !IsObjectiveCompleted(nObjectiveNumber) )
		SetObjectiveDisplayed(nObjectiveNumber, FALSE)
	endif
EndFunction