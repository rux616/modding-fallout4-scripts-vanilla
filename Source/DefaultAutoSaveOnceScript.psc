Scriptname DefaultAutoSaveOnceScript extends ObjectReference default

auto STATE WaitForTrigger
		Event OnTriggerEnter(ObjectReference akActionRef)
    		GoToState("Done")
    		Game.RequestAutoSave()
		EndEvent
EndSTATE


STATE Done

EndSTATE