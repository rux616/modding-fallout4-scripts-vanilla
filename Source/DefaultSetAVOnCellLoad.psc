ScriptName DefaultSetAVOnCellLoad extends Actor Default
{Default script used to set Actor Values (AVs) on cell load.}

Group Required_Properties
	ActorValue property AV01 Auto Const
	{First Actor Value to set.}
	float property AV01_Value Auto Const
	{First Actor Value's new value.}
EndGroup

Group Optional_Properties
	ActorValue property AV02 Auto Const
	{Second Actor Value to set.}
	float property AV02_Value Auto Const
	{Second Actor Value's new value.}

	ActorValue property AV03 Auto Const
	{Third Actor Value to set.}
	float property AV03_Value Auto Const
	{Third Actor Value's new value.}

	ActorValue property AV04 Auto Const
	{Fourth Actor Value to set.}
	float property AV04_Value Auto Const
	{Fourth Actor Value's new value.}

	ActorValue property AV05 Auto Const
	{Fifth Actor Value to set.}
	float property AV05_Value Auto Const
	{Fifth Actor Value's new value.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup


Event OnCellLoad()
	;Set the AVs to their new values.
	DefaultScriptFunctions.DefaultScriptTrace("SETAV on " + self, ShowTraces)
	if (AV01 != None)
		DefaultScriptFunctions.DefaultScriptTrace("SETAV " + AV01 + " on " + self + " to " + AV01_Value, ShowTraces)
		Self.SetValue(AV01, AV01_Value)
	EndIf
	if (AV02 != None)
		DefaultScriptFunctions.DefaultScriptTrace("SetValue " + AV02 + " on " + self + " to " + AV02_Value, ShowTraces)
		Self.SetValue(AV02, AV02_Value)
	EndIf
	if (AV03 != None)
		DefaultScriptFunctions.DefaultScriptTrace("SetValue " + AV03 + " on " + self + " to " + AV03_Value, ShowTraces)
		Self.SetValue(AV03, AV03_Value)
	EndIf
	if (AV04 != None)
		DefaultScriptFunctions.DefaultScriptTrace("SetValue " + AV04 + " on " + self + " to " + AV04_Value, ShowTraces)
		Self.SetValue(AV04, AV04_Value)
	EndIf
	if (AV05 != None)
		DefaultScriptFunctions.DefaultScriptTrace("SetValue " + AV05 + " on " + self + " to " + AV05_Value, ShowTraces)
		Self.SetValue(AV05, AV05_Value)
	EndIf

	;Evaluate package, since this is (often) changed by the new AVs.
	Self.EvaluatePackage()
EndEvent