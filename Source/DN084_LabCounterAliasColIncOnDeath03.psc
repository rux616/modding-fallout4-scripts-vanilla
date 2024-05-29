ScriptName DN084_LabCounterAliasColIncOnDeath03 extends DefaultCounterQuestRefColIncOnDeath Hidden
{A DN084 name variant of DefaultCounterQuestRefCol. When an Alias in this RefCol dies, increments the quest's DN084_LabCounterQuest03 script.}

;DN084 has a large number of quest counters, and uses named counter scripts instead of the defaults ('A', 'B', etc.) to better identify which counter goes with which encounter.
;These named counters are otherwise identical to the defaults (with the appropriate substitutions).

;Local refs.
DN084_LabCounterQuest03 myQuest

Function Increment(ObjectReference akSenderRef)
	;Store off quest so we don't have to fetch and cast it every time.
	if (myQuest == None)
		myQuest = GetOwningQuest() as DN084_LabCounterQuest03
	EndIf
	if (myQuest != None)
		if (MaintainTargetValue)
			myQuest.TargetValue = GetCount()
		EndIf
		myQuest.Increment()
		if (RemoveWhenDead)
			Self.RemoveRef(akSenderRef)
			if (MaintainTargetValue)
				myQuest.Decrement()
			EndIf
		EndIf
		if ((GetCount() <= TargetRemainingCount) && (MyRemainingStage > -1))
			myQuest.SetStage(MyRemainingStage)
		EndIf
	EndIf
EndFunction