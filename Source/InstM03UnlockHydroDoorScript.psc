Scriptname InstM03UnlockHydroDoorScript extends ObjectReference Const
{Sets stage 1000 when the Hydroponics Door is unlocked}

Quest Property InstM03 Auto Const

Event OnLockStateChanged()
	if InstM03.GetStageDone(100)
		InstM03.SetStage(1000)
	endif
EndEvent