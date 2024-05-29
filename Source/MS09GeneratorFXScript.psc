Scriptname MS09GeneratorFXScript extends ObjectReference Const


Event Onload()
	debug.trace(self + "has loaded")
	if Self.Waitfor3dLoad()
		debug.trace(self + " has 3d Loaded")
		utility.wait(2.0)
			if (Self.PlayAnimation("Stage2"))
				debug.trace("Stage2 has played on "+ self)
			endif    
	Else
		debug.trace(self + " has not 3d Loaded")
	endif
EndEvent
