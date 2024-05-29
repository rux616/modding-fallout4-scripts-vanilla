Scriptname DN160_EncounterMonkeyScript extends ObjectReference Hidden
{Script for a TrapCymbalMonkey in DN160. Calls an event in DN160_EncounterManagerScript when activated (trap triggered) or damaged.}

DN160_EncounterManagerScript property DN160_EncounterManager auto const
{The DN160 Encounter Manager.}


Auto State Ready
	Event OnActivate(ObjectReference akActivator)
		;An actor has entered the monkey trap trigger. Set off the trap and the ambush.
		GoToState("Done")
		DN160_EncounterManager.EncounterEvent(1)
	EndEvent

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
		;Player damaged. This just triggers the ambush.
		GoToState("Done")
		DN160_EncounterManager.EncounterEvent(2)
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
		;Do nothing.
	EndEvent
EndState
