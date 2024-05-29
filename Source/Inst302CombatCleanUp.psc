Scriptname Inst302CombatCleanUp extends Actor Const

quest Property Inst302 auto const

Event OnCellDetach()
    debug.trace(self + " has unloaded")
    if (Inst302.GetStageDone(200))
    	BHCleanup()
    endif
EndEvent

Event OnCellAttach()
    debug.trace(self +" has loaded")
    if (Inst302.GetStageDone(200))
    	BHCleanup()
    endif

EndEvent

function BHCleanup()
	debug.trace(inst302 + "Stage = " + Inst302.GetStage())
    self.kill()
    Debug.trace(self + " is disabled")
endFunction
