Scriptname Vault111OverseerDoorScript extends ReferenceAlias

Scene Property p006_PlayerDoorTerminal Auto

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If Self.GetRef().IsLocked() == True && p006_PlayerDoorTerminal.IsPlaying() == False
			p006_PlayerDoorTerminal.Start()
		EndIf
	EndIf
EndEvent