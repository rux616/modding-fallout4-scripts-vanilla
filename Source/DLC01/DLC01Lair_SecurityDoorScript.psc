Scriptname DLC01:DLC01Lair_SecurityDoorScript extends ObjectReference
{Event scripting for the MegaSecurityDoors in the Mechanist's Lair Entrance area.}

Quest property DLC01Lair Auto Const Mandatory
{DLC01Lair}

Scene property DLC01Lair_ENT_Player_SecurityDoorInteraction_Closed Auto Const Mandatory
{Scene to play when the player interacts with the door while it's closed.}

Scene property DLC01Lair_ENT_Player_SecurityDoorInteraction_Open Auto Const Mandatory
{Scene to play when the player interacts with the door while it's open.}


Event OnCellLoad()
	Self.BlockActivation()
	Self.SetNoFavorAllowed()
EndEvent

Event OnActivate(ObjectReference akActivator)
	;The scene only plays: (1) If the player activates the doors, AND (2a) The other security door scene (200) isn't playing, or (2b) The doors are open.
	if (akActivator == Game.GetPlayer())
		if ((Self.GetOpenState() == 3) && (!DLC01Lair.GetStageDone(200)))
			DLC01Lair_ENT_Player_SecurityDoorInteraction_Closed.Start()
		ElseIf (Self.GetOpenState() == 1)
			DLC01Lair_ENT_Player_SecurityDoorInteraction_Open.Start()
		EndIf
	EndIf
EndEvent