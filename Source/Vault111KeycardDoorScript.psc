Scriptname Vault111KeycardDoorScript extends ReferenceAlias

Scene Property p007_PlayerKeycardDoor Auto

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If Self.GetRef().IsLocked() == True && p007_PlayerKeycardDoor.IsPlaying() == False
			p007_PlayerKeycardDoor.Start()
		EndIf
	EndIf
EndEvent