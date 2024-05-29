Scriptname DN144FallingCorpseScript extends ObjectReference Hidden

auto STATE WaitForTrigger
	Event OnTriggerEnter(ObjectReference akActionRef)
    	if akActionRef == Game.GetPlayer()
    		GoToState("Done")
    		GetLinkedRef().GetLinkedRef().ApplyHavokImpulse(1.0, 1.0, 1.0, 1.0)
    	endif
	EndEvent
EndSTATE

STATE Done

EndSTATE