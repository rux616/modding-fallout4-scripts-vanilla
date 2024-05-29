ScriptName DN049_MultiCounterQuest extends Quest Hidden
{Maintains an array of counters and stages to set for them.}
;
;This is a variation on the usual DefaultCounterAlias/DefaultCounterQuest setup, since DN049 would otherwise need 10+ scripts for
;different enemy subgroups, which is awkward and difficult to manage.

Group Required_Properties
	int[] property TargetValues Auto Mandatory
	{The values each counter is watching for.}

	int[] property StagesToSet Auto Const Mandatory
	{When a counter reaches its target, the stage to set.}
EndGroup

int[] counters 	;Local array of counters.


Event OnQuestInit()
	if (TargetValues.Length == StagesToSet.Length)
		counters = new int[TargetValues.Length]
	Else ;Arrays are of different length. I'd prefer to just fail in this case.
		Debug.Trace("ERROR in DN049_MultiCounterQuest script on " + Self + "; the Target and Stages arrays are of different lengths.", 2)
	EndIf
EndEvent


;Increment the specified counter.
Function Increment(int counterID)
	counters[counterID] = counters[counterID] + 1
	;Has the counter reached its TargetValue?
	if (counters[counterID] >= TargetValues[counterID])
		SetStage(StagesToSet[counterID])
	EndIf	
EndFunction

;Decrement the specified counter.
Function Decrement(int counterID)
	counters[counterID] = counters[counterID] - 1
EndFunction

;Change a target value to a new value. (We don't check whether we've reached the new target, since that's not how the Default script works.)
Function SetTargetValue(int counterID, int newValue)
	TargetValues[counterID] = newValue
EndFunction