Scriptname PrydwenLabDoorScript extends ObjectReference Const

Event OnUnload()
	int iState = self.GetOpenState()

	if iState == 1 || iState == 2
		self.SetOpen(false)
	endif
EndEvent