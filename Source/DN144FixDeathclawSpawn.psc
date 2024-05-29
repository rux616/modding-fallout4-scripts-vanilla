Scriptname DN144FixDeathclawSpawn extends ObjectReference Hidden


auto STATE WaitForTrigger

	Event OnTriggerEnter(ObjectReference akActionRef)
	    if akActionRef == Game.GetPlayer()
	    	GoToState("Done")
	    	utility.Wait(0.25)
	    	GetLinkedRef().MoveToMyEditorLocation()
	    endif
	EndEvent

EndSTATE

STATE Done
	; Done
EndSTATE