Scriptname DefaultUnlockDoorOnTriggerEnter extends ObjectReference
{Unlock my Linked Ref when the player enters the trigger.  Only once.}

auto STATE WaitForTrigger
		Event OnTriggerEnter(ObjectReference akActionRef)
			if akActionRef == Game.GetPlayer()
				GoToState("Done")
			    GetLinkedRef().Unlock()
			endif
		EndEvent
EndSTATE


STATE Done

EndSTATE