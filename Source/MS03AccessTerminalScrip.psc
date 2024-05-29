Scriptname MS03AccessTerminalScrip extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == game.GetPlayer()
		MS03.SetStage(5)
	else
		;open door
	endif
EndEvent

Quest Property MS03 Auto Const
