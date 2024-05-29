ScriptName DN084_SetAVOnLoad extends Actor Hidden Const
{Variant of DefaultSetAVOnCellLoad. Set an AV on this specific actor when he loads and forces a quick package evaluation.}

Group Required_Properties
	ActorValue property AV01 Auto Const Mandatory
	{Actor Value to set.}

	float property AV01_Value Auto Const Mandatory
	{Actor Value's new value.}
EndGroup


Event OnLoad()
	;Set the AV to its new value.
	if (AV01 != None)
		Self.SetValue(AV01, AV01_Value)
	EndIf

	;Force an immediate EVP.
	Self.EvaluatePackage()
EndEvent