ScriptName DN049_MultiCounterAliasColIncOnDeath extends DefaultCounterQuestRefColIncOnDeath Hidden
{Increments a counter on the quest with the specified ID.}
;
;This is a variation on the usual DefaultCounterAlias/DefaultCounterQuest setup, since DN049 would otherwise need 10+ scripts for
;different enemy subgroups, which is awkward and difficult to manage. (This script is the RefCollection version.)

Group MultiCounterProperties
	int property myCounter Auto Const Mandatory
	{ID of the counter to increment.}
EndGroup

;Nothing special here, just an updated version of the default script's Increment function.
Function Increment(ObjectReference akSenderRef)
	DN049_MultiCounterQuest myQuest = GetOwningQuest() as DN049_MultiCounterQuest
	if (MaintainTargetValue)
		myQuest.SetTargetValue(myCounter, Self.GetCount())
	EndIf
	myQuest.Increment(myCounter)
	if (RemoveWhenDead)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			myQuest.Decrement(myCounter)
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (MyRemainingStage > -1))
		myQuest.SetStage(MyRemainingStage)
	EndIf
EndFunction