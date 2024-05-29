ScriptName DLC01:DLC01_MultiCounterQuest extends Quest
{Maintains an array of counters and sets stages when their target thresholds are reached.}
;
;The MultiCounter* scripts are a variation on the DefaultCounter* setup, since DLC01Lair would otherwise need a large number of individual
;scripts for the different waves of enemies in the Mechanist Battle. Having a single script to manage all of the counters is cleaner.

Struct CounterObject
	String name 		;User-readable name for the counter.
	int count 		;The current value.
	int targetValue 	;The target value.
	int stageToSet 	;Stage to set when count >= targetValue.
EndStruct

CounterObject[] property counters Auto
{Array of counters being managed by this script.}


;Increment the specified counter.
Function Increment(int index)
	counters[index].count = counters[index].count + 1
	;Debug.Trace("Incrementing count for index " + index + " now " + counters[index].count)
	;Has the counter reached its target value?
	if (counters[index].count >= counters[index].targetValue)
		SetStage(counters[index].stageToSet)
	EndIf
	;Debug.Trace("MultiCounter: Incremented counter " + index + "; now " + counters[index].count)
EndFunction

;Decrement the specified counter.
Function Decrement(int index)
	counters[index].count = counters[index].count - 1
EndFunction

;Change a target value to a new value. (We don't check whether we've met the new target, since that's not how the Default script works.)
Function SetTargetValue(int index, int newValue)
	;Debug.Trace("Target value for index " + index + " set to " + newValue + "; count stands at " + counters[index].count)
	counters[index].targetValue = newValue
EndFunction

Function Hello()
	Debug.Trace("HELLO HELLO")
EndFunction

Function TraceCounters()
	int i = 0
	Debug.Trace("COUNTERS:-----")
	While (i < counters.Length)
		if (counters[i].targetValue > 0)
			Debug.Trace(counters[i].name + "=" + counters[i].count + "/" + counters[i].targetValue + "  :" + counters[i].StageToSet)
		EndIf
		i = i + 1
	EndWhile
EndFunction