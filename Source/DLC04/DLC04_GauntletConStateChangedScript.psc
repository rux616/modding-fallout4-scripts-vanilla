Scriptname DLC04:DLC04_GauntletConStateChangedScript extends Actor

Group Required_Properties
	Quest Property MyQuest Auto Const
	{Quest containing the Stage to Set}

	Int Property StageToSet = -1 Auto Const
	{Stage to Set}
EndGroup

Group Optional_Properties
	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this event to fire}

	Int Property TurnOffStage = -1 Auto Const
	{If the quest stage is equal or greater than TurnOffStage, further events are ignored
	 NOTE: this stage does not actually have to be set - any quest stage equal or higher will turn off this script}

	bool Property SetStageOnUnconscious = True Auto Const
	{If True, set stage on Unconscious; if False on Conscious.}

	bool Property shouldIgnoreFirstUnconsciousEvent = True Auto
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup


Event OnConsciousnessStateChanged(bool abUnconscious)
	Debug.Trace(Self + " sent OnConsciousnessStateChanged; setting Unconscious=" + abUnconscious)
	if (abUnconscious == SetStageOnUnconscious)
		if (abUnconscious && shouldIgnoreFirstUnconsciousEvent)
			Debug.Trace("A")
			shouldIgnoreFirstUnconsciousEvent = False
		Else
			Debug.Trace("B")
			DefaultScriptFunctions.DefaultScriptTrace("DefaultRef: TryToSetStage()", ShowTraces)
			DefaultScriptFunctions.TryToSetStage(MyQuest, StageToSet, PrereqStage, TurnOffStage, False, None, None, None, None, None, None, None, None)
		EndIf
	EndIf		
EndEvent