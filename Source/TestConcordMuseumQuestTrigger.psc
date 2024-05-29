ScriptName TestConcordMuseumQuestTrigger extends ObjectReference

;testing script connected to a trigger inside Concord Museum.

Quest Property MQ03 Auto
ObjectReference Property DogmeatREF Auto
ObjectReference Property DogmeatMoveMarker Auto

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if (triggerRef == Game.getPlayer() as actor)
			gotoState("hasBeenTriggered")
			If MQ03.IsRunning() == False
				MQ03.Start()
				(MQ03 as MQ03QuestScript).RaiderA1.GetActorRef().Disable()
				(MQ03 as MQ03QuestScript).RaiderA2.GetActorRef().Disable()
				MQ03.SetStage(70)
				MQ03.SetStage(85)
				MQ03.SetStage(52)
				DogmeatREF.Moveto(DogmeatMoveMarker)
			EndIf
			Self.Disable()			
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
