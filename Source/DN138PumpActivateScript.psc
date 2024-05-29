Scriptname DN138PumpActivateScript extends ReferenceAlias Hidden

Message Property DN138PumpNotWorking Auto Const

Auto STATE WaitForActivate
	Event OnActivate(ObjectReference akActionRef)
		;if akActionRef == Game.GetPlayer()
		;	GoToState("DoneWaiting")
		;	if GetOwningQuest().IsStageDone(500)
		;		GetOwningQuest().SetStage(700)
		;		GetReference().BlockActivation()
		;	else
		;		DN138PumpNotWorking.Show()
		;		GoToState("WaitForActivate")
		;	endif
		;endif

		if GetOwningQuest().IsStageDone(500)
				; Repairs have been made, turn on pump
			GoToState("DoneWaiting")
			GetReference().PlayAnimationAndWait("play01","done")
			Game.ShakeCamera(Game.GetPlayer(), 0.5, 1)
			Game.ShakeController(0.5, 0.5, 1)
			GetOwningQuest().SetStage(700)
		else
				; Repairs haven't been made, tell the player that
			GoToState("DoneWaiting")
			GetReference().PlayAnimationAndWait("play01","done")
			DN138PumpNotWorking.Show()
			GetReference().PlayAnimationAndWait("play01","done")
			GoToState("WaitForActivate")
		endif

	EndEvent
EndSTATE

STATE DoneWaiting
	; Do Nothing
EndSTATE