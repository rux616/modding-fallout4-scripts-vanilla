Scriptname MQ206TinkerTomScannerPlayerScript extends ReferenceAlias

Int ButtonPressed = 0

Message Property MQ206TinkerTomScannerMSG Auto

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			;prevent activate spam
			gotoState("hasBeenTriggered")
			;debug.trace(self + " activated by player")
			ButtonPressed = MQ206TinkerTomScannerMSG.Show()		
				If ButtonPressed == 1
					GetOwningQuest().SetStage(80)
				Else
					; If player does nothing, make sure we can activate again
					gotoState("waitingForPlayer")		
				EndIf
		EndIf

	EndEvent
EndState

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
