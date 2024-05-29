Scriptname DLC04:DLC04RKOOnDeathSecondaryCustomScript extends ReferenceAlias

Quest Property DLC04RaiderKickout Auto Const
GlobalVariable Property DLC04EnemyGang Auto Const
Quest Property DLC04MQ05 Auto Const

int Property GangIDNumber Auto

Event OnDying(Actor akKiller)

	if akKiller == Game.GetPlayer()
		if DLC04MQ05.GetStageDone(5) == 0
			DLC04RaiderKickout.SetStage(20)
		elseif DLC04MQ05.GetStageDone(5) == 1 && DLC04EnemyGang.GetValue() == GangIDNumber
			;Do Nothing
		elseif DLC04MQ05.GetStageDone(5) == 1 && DLC04EnemyGang.GetValue() != GangIDNumber
			DLC04RaiderKickout.SetStage(20)
		endif
	endif

EndEvent