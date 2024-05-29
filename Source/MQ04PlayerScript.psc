Scriptname MQ04PlayerScript extends ReferenceAlias

WorldSpace Property DiamondCityWorldSpace Auto
Location Property DiamondCityLocation Auto		

auto STATE Stage10STATE
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		;Track when the player enters Diamond city
		If akNewLoc == DiamondCityLocation
			;make sure we're inside the worldspace
			If Game.GetPlayer().GetWorldSpace() == DiamondCityWorldSpace
				;make sure we're on the right quest stage
				If (GetOwningQuest().GetStageDone(10) == 1) && (GetOwningQuest().GetStageDone(20) == 0)
					GetOwningQuest().SetStage(20)
					gotoState("Stage20STATE")
				EndIf
			EndIf
		EndIf
	EndEvent
endSTATE


STATE Stage20STATE
	; this is an empty state... so far
endSTATE