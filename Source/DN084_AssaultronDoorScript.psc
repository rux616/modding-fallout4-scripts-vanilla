ScriptName DN084_AssaultronDoorScript extends Default2StateActivator Hidden
{Script for the Assaultron Switch Doors. Disables them when they open because they don't quite work otherwise.}

Function SetOpen(bool abOpen = true)
	Parent.SetOpen(abOpen)
	if (abOpen)
		Self.Disable()
	EndIf
EndFunction