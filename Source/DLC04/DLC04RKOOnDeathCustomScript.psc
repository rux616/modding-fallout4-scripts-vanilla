Scriptname DLC04:DLC04RKOOnDeathCustomScript extends ReferenceAlias

Quest Property DLC04RaiderKickout Auto Const Mandatory
GlobalVariable Property DLC04EnemyGang Auto Const Mandatory
GlobalVariable Property DLC04BossCount Auto Const Mandatory
Quest Property DLC04MQ05 Auto Const Mandatory

int Property GangIDNumber Auto
int Property KillStage Auto

Event OnDying(Actor akKiller)

	DLC04BossCount.SetValue(DLC04BossCount.GetValue() + 1)

	if akKiller == Game.GetPlayer()
		if DLC04MQ05.GetStageDone(5) == 0
			DLC04RaiderKickout.SetStage(20)
			DLC04RaiderKickout.SetStage(KillStage)
		elseif DLC04MQ05.GetStageDone(5) == 1 && DLC04EnemyGang.GetValue() == GangIDNumber
			DLC04RaiderKickout.SetStage(KillStage)
		elseif DLC04MQ05.GetStageDone(5) == 1 && DLC04EnemyGang.GetValue() != GangIDNumber
			DLC04RaiderKickout.SetStage(20)
			DLC04RaiderKickout.SetStage(KillStage)
		endif
	endif

EndEvent