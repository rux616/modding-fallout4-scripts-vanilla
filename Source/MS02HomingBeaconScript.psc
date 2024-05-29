Scriptname MS02HomingBeaconScript extends ObjectReference Const
{script for calling in missile from MS02 sub with a homing beacon
}

Keyword Property MS02HomingBeaconKeyword Auto Const

event OnInit()
	debug.tracefunction()
	Location myLocation = GetCurrentLocation()
	debug.trace(self + " OnInit: location=" + myLocation)
	MS02HomingBeaconKeyword.SendStoryEvent(akLoc = myLocation, akRef1 = self)
endEvent
