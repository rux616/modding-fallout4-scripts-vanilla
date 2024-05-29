Scriptname defaultAddAmmoOnActivateSCRIPT extends ObjectReference
{When this object is looted, add x amount of the designated ammo}

Ammo PROPERTY ammoType AUTO
Int PROPERTY ammoCount=1 AUTO


EVENT OnActivate(ObjectReference akActionRef)
    
	utility.wait(0.25)

	akActionRef.additem(ammoType, ammoCount)

ENDEVENT