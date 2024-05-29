Scriptname DLC04:DLC04SafariCitoUnlockScript extends ObjectReference 

referencealias property CitoAlias auto

auto STATE WaitForTrigger
		Event OnTriggerEnter(ObjectReference akActionRef)
			if akActionRef == CitoAlias.getReference()
				GoToState("Done")
			    GetLinkedRef().Unlock()
			endif
		EndEvent
EndSTATE


STATE Done

EndSTATE