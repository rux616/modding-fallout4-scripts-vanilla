ScriptName DN084_SetAVOnDeath extends Actor Hidden Const
{Variant on DefaultSetAVOnCellLoad. Sets AVs on the (transient) linkedref'd actors when this actor dies.}

Group Required_Properties
	ActorValue property AV01 Auto Const Mandatory
	{Actor Value to set.}

	float property AV01_Value Auto Const Mandatory
	{Actor Value's new value.}
EndGroup

Group Optional_Properties
	Keyword property linkKeyword Auto Const
	{Link Keyword for the actor (or chain of actors) whose AVs we're going to set.}

	Quest property myQuest Auto Const
	{Quest with a stage that shuts off this behavior.}

	int property myShutoffStage Auto Const
	{If myQuest.ShutoffStage is set, don't set the AVs.}
EndGroup


Event OnDeath(Actor akKiller)
	if ((myQuest == None) || (!myQuest.GetStageDone(myShutoffStage)))
		int i = 0
		Actor[] chain = (Self.GetLinkedRefChain(linkKeyword) as Actor[])
		While (i < chain.Length)
			if (AV01 != None)
				chain[i].SetValue(AV01, AV01_Value)
			EndIf
			chain[i].EvaluatePackage()
		EndWhile
	EndIf
EndEvent