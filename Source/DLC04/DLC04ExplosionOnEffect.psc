Scriptname DLC04:DLC04ExplosionOnEffect extends activemagiceffect

Explosion Property myExplosion const auto
Int Property myCount = 1 const auto
Float Property myXOffset = 0.0 const auto
Float Property myYOffset = 0.0 const auto
Float Property myZOffset = 0.0 const auto
Form Property xMarker const auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	objectReference myTarget = akTarget.placeAtMe(xMarker)

	myTarget.MoveTo(akTarget, afXOffset = myXOffset, afYOffset = myYOffset, afZOffset = myZOffset)
	myTarget.PlaceAtMe(myExplosion, myCount)
	myTarget.Delete()
EndEvent