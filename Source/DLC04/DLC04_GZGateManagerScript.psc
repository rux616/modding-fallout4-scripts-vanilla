Scriptname DLC04:DLC04_GZGateManagerScript extends ObjectReference

ObjectReference property DLC04GZCampGate Auto Const Mandatory

Event OnLoad()
	if (Self.IsEnabled())
		DLC04GZCampGate.Unlock()
		DLC04GZCampGate.SetOpen(True)
	EndIf
EndEvent