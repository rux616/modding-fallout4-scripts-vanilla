Scriptname RECheckpointParentScript extends Quest

; custom event sent each time an Initialize quest completes, to signal starting the next one
CustomEvent CheckpointInitializeLocation

RETriggerScript[] property checkpointTriggers auto const 
{ array of checkpoint triggers for initialization process }

keyword property REEncounterTypeCheckpoint auto const mandatory

function InitializeQuest()
	; start initialize checkpoints process
	RegisterForCustomEvent(self, "CheckpointInitializeLocation")
	SendCustomEvent("CheckpointInitializeLocation")		
endFunction

int initializationIndex = 0
Event RECheckpointParentScript.CheckpointInitializeLocation(RECheckpointParentScript akSender, Var[] akArgs)
	debug.trace("CheckpointInitializeLocation event received " + initializationIndex)
	RETriggerScript nextCheckpoint = NONE
	if (akArgs.Length > 0)
		RETriggerScript checkpointTriggerRef = akArgs[0] as RETriggerScript
		if checkpointTriggerRef
			; this is the location that was just initialized - find the next
			initializationIndex += 1
			int newCheckpointIndex = initializationIndex
			if newCheckpointIndex >= checkpointTriggers.Length
				debug.trace(self + " CheckpointInitializeLocation: Finished all locations")
			else
				debug.trace(self + " 	checkpoint done: " + checkpointTriggerRef + "(" + checkpointTriggerRef.GetCurrentLocation() + ")")
				; send story event for next checkpoint
				nextCheckpoint = checkpointTriggers[newCheckpointIndex]
			endif

		else
			debug.trace(self + " WARNING: CheckpointInitializeLocation event received with invalid args")
		endif
	else
		debug.trace(self + " 	No parameters- start with checkpoint 0=" + checkpointTriggers[0])
		; if no checkpoint sent, start with first
		nextCheckpoint = checkpointTriggers[0]
	endif

	; send event if we found next workshop
	if nextCheckpoint
		debug.trace(self + " 	send story event for next checkpoint: " + nextCheckpoint + "(" + nextCheckpoint.GetCurrentLocation() + ")")
		bool bSuccess = REEncounterTypeCheckpoint.SendStoryEventAndWait(akRef1 = nextCheckpoint)
		if !bSuccess
			; quest failed to start for this location - skip it and move on
			debug.trace(self + "	WARNING: CheckpointInitializeLocation quest failed to start for " + nextCheckpoint + "(" + nextCheckpoint.GetCurrentLocation() + ")")
			; send "done" event
			Var[] kargs = new Var[1]
			kargs[0] = nextCheckpoint
			debug.trace(self + " 	sending CheckpointInitializeLocation event")
			SendCustomEvent("CheckpointInitializeLocation", kargs)		
		endif
	endif
EndEvent

function InitializeCheckpointDone(RETriggerScript checkpointTriggerRef)
	debug.trace(self + " InitializeCheckpointDone: " + checkpointTriggerRef + "(" + checkpointTriggerRef.GetCurrentLocation() + ")")

	; send "done" event
	Var[] kargs = new Var[1]
	kargs[0] = checkpointTriggerRef
	debug.trace(" 	sending CheckpointInitializeLocation event")
	SendCustomEvent("CheckpointInitializeLocation", kargs)		
endFunction


