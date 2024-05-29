Scriptname PrydwenHallSceneSoldierScript extends Actor Const

Quest Property BoSPrydwenScene_Hall  Auto Const

Event OnUnload()

	if BoSPrydwenScene_Hall.GetStageDone(100)
		self.Disable()
	endif

EndEvent
