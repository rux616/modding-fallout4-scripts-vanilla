Scriptname MQ203BabyScript extends ObjectReference Const

Event OnLoad()
	debug.trace(self + " OnLoad")
	int i = 0
	while Is3DLoaded() == false && i < 6
		Utility.Wait(0.5)
		i += 1
	endwhile
	debug.trace(self + " PlayAnimation")
    PlayAnimation("To_FrozenIdle")
    PlayAnimation("To_UnfrozenIdle")
EndEvent