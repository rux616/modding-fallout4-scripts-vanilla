Scriptname MS07cNickGraveHelloTriggerScript extends ObjectReference Const

Quest Property MS07c Auto Const

;Once Nick has reached the spot for his final scene, turn off his hello's one the player is within range
Event OnTriggerEnter(ObjectReference akActionRef)
	if MS07c.IsRunning() && !MS07c.GetStageDone(270)
		if akActionRef == Game.GetPlayer()
			(MS07c as MS07cScript).bNicksGraveHellosBlocked = 1
		endif
	endif
EndEvent

;If player is outside range, let Nick mumble to himself
Event OnTriggerLeave(ObjectReference akActionRef)
	if MS07c.IsRunning() && !MS07c.GetStageDone(270)
		if akActionRef == Game.GetPlayer()
			(MS07c as MS07cScript).bNicksGraveHellosBlocked = 0
		endif
	endif
EndEvent