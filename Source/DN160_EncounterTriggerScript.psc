Scriptname DN160_EncounterTriggerScript extends ObjectReference Hidden
{Script for triggers throughout DN160 that send events to the DN160_EncounterManager.}

DN160_EncounterManagerScript property DN160_EncounterManager auto const
{The DN160 Encounter Manager.}

int property myEvent auto const
{The DN160 Event ID for this trigger.}

Auto State Ready
	Event OnTriggerEnter(ObjectReference akActionRef)
		if (akActionRef == Game.GetPlayer())
			GoToState("Done")
			DN160_EncounterManager.EncounterEvent(myEvent)
		EndIf
	EndEvent
EndState

State Done
	Event OnTriggerEnter(ObjectReference akActionRef)
		;Do nothing.
	EndEvent
EndState
