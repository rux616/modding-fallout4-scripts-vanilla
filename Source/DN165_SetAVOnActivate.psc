ScriptName DN165_SetAVOnActivate extends Actor
{Variant of DefaultSetAVOnLoad used to set Actor Values on activate.}

ActorValue property AV01 Auto Const Mandatory
{Actor Value to set.}

float property AV01_Value Auto Const Mandatory
{Actor Value's new value.}

State Waiting
	Event OnActivate(ObjectReference akActivator)
		;Set the AV to its new value.
		Self.SetValue(AV01, AV01_Value)

		;Evaluate package, since this is (often) changed by the new AVs.
		Self.EvaluatePackage()
		GoToState("Done")
	EndEvent
EndState


State Done
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState