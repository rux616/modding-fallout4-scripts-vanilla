ScriptName DefaultCounterAliasColIncOnDeathB extends DefaultCounterQuestRefColIncOnDeath Default
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestB script.}

Function Increment(ObjectReference akSenderRef)
	if (MaintainTargetValue)
		(GetOwningQuest() as DefaultCounterQuestB).TargetValue = GetCount()
	EndIf
	(GetOwningQuest() as DefaultCounterQuestB).Increment()
	if (RemoveWhenDead)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			(GetOwningQuest() as DefaultCounterQuestB).Decrement()
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (MyRemainingStage > -1))
		GetOwningQuest().SetStage(MyRemainingStage)
	EndIf
EndFunction