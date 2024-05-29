Scriptname EE_LightChangeState_Hostile extends Quest conditional

bool Property bShouldPlaceMarker auto conditional
bool Property bLightTurningOn auto conditional		; false = light turned off

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
	debug.trace(self + " OnStoryScript aiValue1=" + aiValue1)
	bShouldPlaceMarker = aiValue1 as bool
	bLightTurningOn = aiValue2 as bool
	debug.trace(self + " bShouldPlaceMarker=" + bShouldPlaceMarker + ", bLightTurningOn=" + bLightTurningOn)
endEvent
