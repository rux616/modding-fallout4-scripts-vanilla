Scriptname MemoryLoungerActivationScript extends ObjectReference

int DoOnce

Event OnInit()
	If DoOnce == 0
		DoOnce = 1
		Self.BlockActivation(True, True)
	EndIf
EndEvent