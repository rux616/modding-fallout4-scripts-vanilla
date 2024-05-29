Scriptname BoSM02DanseOverrides_PlayerAliasScript extends ReferenceAlias Const Hidden
{Script on the player alias on BoSM02DanseOverrides. Makes absolutely sure to stop it if the player leaves the airport ruins. Failing to do so would be bad.}

Location property BostonAirportRuinsLocation Auto Const Mandatory
Quest property BoSM02DanseOverrides Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if (akOldLoc == BostonAirportRuinsLocation)
		BoSM02DanseOverrides.Stop()
	EndIf
EndEvent