ScriptName DLC01:DLC01_MultiCounterAliasIncOnceOnDeath extends DefaultCounterQuestIncOnDeath
{When this alias dies, increments the counter(s) on the quest with the specified IDs.}
;
;The MultiCounter* scripts are a variation on the DefaultCounter* setup, since DLC01Lair would otherwise need a large number of individual
;scripts for the different waves of enemies in the Mechanist Battle. Having a single script to manage all of the counters is cleaner.

Group MultiCounterProperties
	int[] property myCounters Auto Const Mandatory
	{IDs of the counter(s) to increment.}
EndGroup

Function Increment()
	int i = 0
	DLC01:DLC01_MultiCounterQuest myQuest = GetOwningQuest() as DLC01:DLC01_MultiCounterQuest
	While (i < myCounters.Length)
		myQuest.Increment(myCounters[i])
		i = i + 1
	EndWhile
EndFunction