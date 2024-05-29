Scriptname MinArtillerySmokeScript extends ObjectReference Const
{script for calling in Minuteman artillery with a smoke grenade
}

Keyword Property MinArtilleryStart Auto Const

event OnInit()
	debug.tracefunction()
	Location myLocation = GetCurrentLocation()
	debug.trace(self + " OnInit: location=" + myLocation)
	MinArtilleryStart.SendStoryEvent(akLoc = myLocation, akRef1 = self)
endEvent

