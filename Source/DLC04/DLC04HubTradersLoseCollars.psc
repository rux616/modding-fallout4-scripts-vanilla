Scriptname DLC04:DLC04HubTradersLoseCollars extends ReferenceAlias
{: Changes all trader outfits to no-collar versions when players leaves Nuka-World after raider kickout quest stage 255 is done}

Quest Property DLC04RaiderKickout Auto Const Mandatory
Quest Property DLC04DialogueSettlement Auto Const Mandatory
Location Property DLC04NukaTownUSALocation Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if !DLC04NukaTownUSALocation.IsChild(akOldLoc) && akNewLoc == !DLC04NukaTownUSALocation && DLC04RaiderKickout.GetStageDone(255)
		DLC04DialogueSettlement.SetStage(300)
	EndIf
endEvent
	
