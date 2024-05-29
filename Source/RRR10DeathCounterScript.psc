Scriptname RRR10DeathCounterScript extends ReferenceAlias Conditional

Event OnLoad()
	(GetOwningQuest() as RRR10Script).EnemyCount()
EndEvent

Event onDying(Actor akKiller)
	(GetOwningQuest() as RRR10Script).CountDead()
EndEvent