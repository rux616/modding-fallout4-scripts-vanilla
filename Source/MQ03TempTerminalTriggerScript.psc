ScriptName MQ03TempTerminalTriggerScript Extends ObjectReference

Quest Property MQ03 Auto
ObjectReference Property MQ03SecurityGateREF Auto
Message Property MQ03TempHackMessage Auto


auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			gotoState("hasBeenTriggered")
			MQ03.SetStage(95)
			MQ03SecurityGateREF.Lock(False)
			MQ03TempHackMessage.Show()
			Self.Disable()
		EndIf
	EndEvent
EndState

STATE hasBeenTriggered
	; this is an empty state.
endSTATE