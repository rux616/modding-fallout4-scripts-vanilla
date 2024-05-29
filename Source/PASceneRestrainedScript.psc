Scriptname PASceneRestrainedScript extends Actor Const

Quest Property BoSPrydwenScene_PA Auto Const

Event OnLoad()
	;debug.trace(self + "loaded in.")
	if !isDead() && !BoSPrydwenScene_PA.GetStageDone(80)
		;debug.trace("Set restrained on " + self)
		Self.SetRestrained(true)
	Endif
EndEvent