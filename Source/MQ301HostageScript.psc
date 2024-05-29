ScriptName MQ301HostageScript extends ReferenceAlias Const
{script to check if someone we tell you to rescue dies, then fails that objective}

Int Property ObjectiveToFail Auto Const

Event OnDeath(Actor akKiller)
	GetOwningQuest().SetObjectiveFailed(ObjectiveToFail)
EndEvent