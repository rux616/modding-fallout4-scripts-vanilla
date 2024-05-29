ScriptName DefaultCounterQuest extends Quest Default hidden
{A simple counter. Place on an Quest, then increment with another script (such as DefaultCounterQuestIncOnDeath, or DefaultCounterQuestIncOnceOnActivate). When the target value is reached (or, optionally, exceeded), the counter sets a Quest Stage.}

Group Required_Properties
	int property TargetValue Auto
	{The stage will be set when this value is reached.}

	int property MyStage Auto Const
	{When the counter reaches its target, sets this stage.}
EndGroup

int count

Auto STATE AllowCounting
	Function Increment()

		count = count + 1

			; Has count reached it's TargetValue?
		if (count >= TargetValue)
			GoToState("StopCounting")
			SetStage(MyStage)
		EndIf
		
	EndFunction


	Function Decrement()
		count = count - 1
	EndFunction
EndSTATE

STATE StopCounting
	; Do Nothing
EndSTATE

Function Increment()
	;Do Nothing
EndFunction

Function Decrement()
	count = count - 1
EndFunction