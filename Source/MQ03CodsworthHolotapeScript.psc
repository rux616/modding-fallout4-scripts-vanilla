ScriptName MQ03CodsworthHolotapeScript extends ReferenceAlias

auto STATE waitingForTrigger
	;if the player never receives the holotape from Codsworth, enable this copy of the holotape in the player house
	Event OnLoad()
		If GetOwningQuest().GetStageDone(25) == 1 && GetOwningQuest().GetStageDone(22) == 0
			gotoState("hasBeenTriggered")
			Self.GetRef().Enable()
		; if the player did receive the holotape, stop checking
		ElseIf GetOwningQuest().GetStageDone(22) == 1
			gotoState("hasBeenTriggered")
		EndIf
	EndEvent
EndState

STATE hasBeenTriggered
	; this is an empty state.
endSTATE