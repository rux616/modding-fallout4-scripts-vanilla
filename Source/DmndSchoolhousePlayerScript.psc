Scriptname DmndSchoolhousePlayerScript extends ReferenceAlias

Keyword Property DmndSchoolhouseEventScript Auto Const
Location Property DiamondCitySchoolhouseLocation Auto
Int MyTimerID = 10

;run the schoolhouse events, but only when the player is in the school
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == DiamondCitySchoolhouseLocation
		StartTimer(25, MyTimerID)
	ElseIf akOldLoc == DiamondCitySchoolhouseLocation
		CancelTimer(MyTimerID)
	EndIf
EndEvent


Event OnTimer(int aiTimerID)
	If aiTimerID == MyTimerID
		DmndSchoolhouseEventScript.SendStoryEvent()
		StartTimer(25, MyTimerID)
	EndIf
EndEvent