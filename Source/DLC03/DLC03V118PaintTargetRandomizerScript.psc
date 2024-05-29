Scriptname DLC03:DLC03V118PaintTargetRandomizerScript extends ObjectReference

float xSelf
float ySelf
float zSelf

Group Properties
	float Property xSpread = 0.0 Auto Const
	float Property ySpread = 200.0 Auto Const
	float Property zSpread = 64.0 Auto Const
	Float Property RandomTime = 3.0 Auto Const
EndGroup

Event OnCellAttach()
	xSelf = self.GetPositionX()
	ySelf = self.GetPositionY()
	zSelf = self.GetPositionZ()
	StartTimer(RandomTime, 99)
EndEvent

Event OnCellDetach()
	CancelTimer(99)
EndEvent



Event OnTimer(int aiTimerID)
	Debug.Trace(Self + ": OnTimer")
	ObjectReference objSelf = self as ObjectReference
	ObjectReference myMarker = GetLinkedRef()
	float newX = (xSelf + utility.RandomFloat((0 - xSpread), xSpread))
	float newY = (ySelf + utility.RandomFloat((0 - ySpread), ySpread))
	float newZ = (zSelf + utility.RandomFloat((0 - zSpread), zSpread))
	Debug.Trace(Self + ": newX == " + newX)
	Debug.Trace(Self + ": newY == " + newY)
	Debug.Trace(Self + ": newZ == " + newZ)

	myMarker.SplineTranslateTo(newX, newY, newZ, 0, 0, 0, afTangentMagnitude = 5, afSpeed = 25, afMaxRotationSpeed = 0.0)

	if Is3dLoaded()
		StartTimer(RandomTime, 99)
	endif
EndEvent