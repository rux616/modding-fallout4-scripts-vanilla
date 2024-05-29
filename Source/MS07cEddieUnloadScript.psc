Scriptname MS07cEddieUnloadScript extends Actor Const

Quest Property MS07c Auto Const

Event OnUnload()

	if MS07c.GetStageDone(500) && !self.IsDisabled()
		self.Disable()
	endif

EndEvent