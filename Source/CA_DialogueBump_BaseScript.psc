Scriptname CA_DialogueBump_BaseScript extends TopicInfo
{base script for companion affinity dialogue bumps}

int property eventID = -1 auto hidden
{ this will get set by the child script onInit }

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if abHasBeenSaid
		debug.trace(self + "HasBeenSaid, so NOT sending affinity event")
		RETURN
	endif
	InitializeEventID()
	CompanionAffinityEventQuestScript.GetScript().SendAffinityBumpEvent(self, eventID)
endEvent

; blank function to init eventID on children
; NOTE: not relying on OnInit because otherwise save games don't work
function InitializeEventID()
endFunction
