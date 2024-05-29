Scriptname MinDefendCastleBreachedTrigScript extends ObjectReference Const

Quest Property MinDefendCastle Auto Const


Event onTriggerEnter(objectReference TriggerRef)
	if MinDefendCastle &&  MinDefendCastle.isRunning()
		(MinDefendCastle as MinDefendCastleAttackScript).SetWallsBreached()
	endif
EndEvent
