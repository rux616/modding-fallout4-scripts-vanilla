Scriptname UFOCrashStartCombatOnTriggerEnter extends ObjectReference Hidden


auto STATE WaitForTrigger
	Event OnTriggerEnter(ObjectReference akActionRef)
		GoToState("Done")
	    (GetLinkedRef() as Actor).StartCombat(Game.GetPlayer())
	EndEvent
EndSTATE

STATE Done

EndSTATE