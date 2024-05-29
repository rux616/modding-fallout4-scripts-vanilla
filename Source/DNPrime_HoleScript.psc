Scriptname DNPrime_HoleScript extends ObjectReference
{Script on the Hole that registers for an event and places an explosion}

ObjectReference property myExplosionMarker Auto Mandatory Const
Explosion property myExplosion Auto Mandatory Const

bool doOnce = FALSE

;************************************

Event OnLoad()
	if(doOnce == FALSE)
		doOnce = TRUE
    	RegisterForAnimationEvent(self, "primeDirtExplosion")
    endIf
EndEvent

;************************************

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
  if (asEventName == "primeDirtExplosion")
  	;Prime just threw his nuke
  	myExplosionMarker.placeAtMe(myExplosion, 1)
  endIf
EndEvent

;************************************