ScriptName DLC01:DLC01_MultiCounterAliasColIncOnDeath extends DefaultCounterQuestRefColIncOnDeath
{When an alias in this collection dies, increments the counter(s) on the quest with the specified IDs.}
;
;The MultiCounter* scripts are a variation on the DefaultCounter* system, since DLC01Lair would otherwise need a large number of individual
;scripts for the different waves of enemies in the Mechanist Battle. Having a single script to manage all of the counters is cleaner.
;
;This version of the script also supports a settable RemoveWhenDead (which is a Const in the parent script). 

Group MultiCounterProperties
	int[] property myCounters Auto Const Mandatory
	{IDs of the counter(s) to increment.}
EndGroup

bool Local_RemoveWhenDead
;On the Parent, RemoveWhenDead is Const. This script requires a non-Const version, for SetRemoveWhenDead, so we save off the value
;of the Parent's property OnInit and manipulate that instead.

Event OnInit()
	Local_RemoveWhenDead = RemoveWhenDead
EndEvent

;Nothing special here, just an updated version of the default script's Increment function.
Function Increment(ObjectReference akSenderRef)
	DLC01:DLC01_MultiCounterQuest myQuest = GetOwningQuest() as DLC01:DLC01_MultiCounterQuest
	int i = 0
	While (i < myCounters.Length)
		if (MaintainTargetValue)
			myQuest.SetTargetValue(myCounters[i], Self.GetCount())
		EndIf
		myQuest.Increment(myCounters[i])
		i = i + 1
	EndWhile
	if (Local_RemoveWhenDead)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			i = 0
			While (i < myCounters.Length)
				myQuest.Decrement(myCounters[i])
				i = i + 1
			EndWHile
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (MyRemainingStage > -1))
		myQuest.SetStage(MyRemainingStage)
	EndIf
EndFunction

Function SetRemoveWhenDead(bool shouldRemove)
	;Set the local ShouldRemoveWhenDead.
	Local_RemoveWhenDead = shouldRemove

	;If we now want to remove dead actors, go through and clean up the collection.
	if (Local_RemoveWhenDead)
		int i = 0
		While (i < Self.GetCount())
			Actor current = Self.GetAt(i) as Actor
			if ((current != None) && (current.IsDead()))
				Self.RemoveRef(current)
				;Do NOT increment i if we've just removed an element.
			Else
				i = i + 1
			EndIf
		EndWhile
	EndIf
EndFunction

