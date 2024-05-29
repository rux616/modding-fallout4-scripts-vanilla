Scriptname DLC01:DLC01Lair_SecurityDoorLightScript extends ObjectReference
{Event scripting for the lights above the MegaSecurityDoors in the Mechanist's Lair Entrance area.}
;
;The lights start red and switch to green when DLC01Lair Stage 110 sets them green. They remain green and the doors remain open thereafter.}

Quest property DLC01Lair Auto Const Mandatory
{DLC01Lair}

Event OnCellLoad()
	if (DLC01Lair.GetStageDone(200))
		;If the door-opening scene has already played, on all subsequent loads:
		; - The lights should be green.
		Self.PlayAnimation("Green")
		; - The doors should be open. (Stage 201 is a fallback that just opens all of the doors,
		;   in case the original time-delayed SetOpen calls failed because the player left the cell.)
		DLC01Lair.SetStage(201)
	Else
		Self.PlayAnimation("Red")
	EndIf
EndEvent

Function SetGreen()
	Self.PlayAnimation("Green")
EndFunction