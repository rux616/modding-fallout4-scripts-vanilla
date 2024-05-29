Scriptname DLC04:DLC04BossKilledAliasScript extends ReferenceAlias

GlobalVariable Property DLC04EnemyGang Auto Const Mandatory
Quest Property DLC04MQ05 Auto Const Mandatory

int Property EnemyGangID Auto Conditional Mandatory
int Property StageToSet Auto Conditional Mandatory

Event OnDying(Actor akKiller)

	If DLC04EnemyGang.GetValue() == EnemyGangID
		DLC04MQ05.SetStage(StageToSet)
	EndIf

EndEvent