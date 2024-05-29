Scriptname MS07cTriggerEnableOnUnload extends ObjectReference Const

Quest Property MS07c Auto Const

Event OnUnload()
	;debug.trace(self + "Trigger unloaded.")
	if self.IsDisabled() && MS07c.GetStageDone(1000)
		;debug.trace(self + "Trigger disabled and stage done. Reenable trigger.")
		self.Enable()
	endif
EndEvent