Scriptname BoS302DanseKillHandlerScript extends ReferenceAlias

Quest Property BOS302 Auto Const
GlobalVariable Property BoS302DanseExecuted Auto Const

Event OnDying(Actor akKiller)

	BoS302DanseExecuted.SetValue(1)

	if akKiller == Game.GetPlayer()
		if BOS302.GetStage() >= 50 && BoS302.GetStage() < 85
			BOS302.SetStage(90)
		elseif BOS302.GetStage() >= 120 && BOS302.GetStage() < 160 
			BOS302.SetStage(170)
		endif
	endif
	
EndEvent
