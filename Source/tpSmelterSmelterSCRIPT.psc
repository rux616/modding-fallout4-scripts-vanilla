Scriptname tpSmelterSmelterSCRIPT extends ObjectReference

; reference to where all our data is stored
OBJECTREFERENCE PROPERTY xMarkerControl AUTO
tpSmelterXMarkerSCRIPT xControl

EVENT onLoad()
  	; //setting the master script to be the one with the stored vars
	xControl = xMarkerControl AS tpSmelterXMarkerSCRIPT

	; this should really be a form list... but trying not to edit data
	AddInventoryEventFilter(xControl.Ammo10mm)
	AddInventoryEventFilter(xControl.Ammo22Caliber)
	AddInventoryEventFilter(xControl.Ammo32Caliber)
	AddInventoryEventFilter(xControl.Ammo556)
	AddInventoryEventFilter(xControl.dn_HasBarrelLong)
	AddInventoryEventFilter(xControl.dn_HasBarrelShort)
	AddInventoryEventFilter(xControl.dn_HasBayonet)
	AddInventoryEventFilter(xControl.dn_HasDamageCryo)
	AddInventoryEventFilter(xControl.dn_HasDamageElectrical)
	AddInventoryEventFilter(xControl.dn_HasDamageFire)
	AddInventoryEventFilter(xControl.dn_HasDamagePoison)
	AddInventoryEventFilter(xControl.dn_HasDamageRadiation)
	AddInventoryEventFilter(xControl.dn_HasExtendedMag)
	AddInventoryEventFilter(xControl.dn_HasGripPistol)
	AddInventoryEventFilter(xControl.dn_HasGripRifle)
	AddInventoryEventFilter(xControl.dn_HasHuntingRifleShortGrip)
	AddInventoryEventFilter(xControl.dn_HasReceiverPipeMachineGun)
	AddInventoryEventFilter(xControl.dn_HasReceiverPipeSemiAuto)
	AddInventoryEventFilter(xControl.dn_HasReceiverPipeSingleShot)
	AddInventoryEventFilter(xControl.dn_HasReceiverRevolver)
	AddInventoryEventFilter(xControl.dn_HasReceiverShotgun)
	AddInventoryEventFilter(xControl.dn_HasScope)
	AddInventoryEventFilter(xControl.dn_HasScopeOptical)
	AddInventoryEventFilter(xControl.dn_HasScopeReflex)
	AddInventoryEventFilter(xControl.dn_HasSilencer)
ENDEVENT

EVENT OnUnload()
	RemoveAllInventoryEventFilters()
ENDEVENT

; ////////////////////////////////////////
; //EVENT: onITEMADDED
; ////////////////////////////////////////
EVENT onITEMADDED(FORM akBaseItem, int aiItemCount, OBJECTREFERENCE akItemReference, OBJECTREFERENCE akSourceContainer)

	debug.trace(aiItemCount)

	; //update the appropriate lists
	;itemKeywordCheck(TRUE, akItemReference, aiItemCount)
	itemKeywordCheck(TRUE, akBaseItem, aiItemCount)

ENDEVENT 

; ////////////////////////////////////////
; //EVENT: onITEMREMOVED
; ////////////////////////////////////////
EVENT onITEMREMOVED(FORM akBaseItem, int aiItemCount, OBJECTREFERENCE akItemReference, OBJECTREFERENCE akSourceContainer)

	debug.trace(akItemReference + "removed")

	; //update the appropriate lists
	itemKeywordCheck(FALSE, akBaseItem, aiItemCount)

ENDEVENT

; ////////////////////////////////////////
; //EVENT: itemKeywordCheck
; ////////////////////////////////////////
FUNCTION itemKeywordCheck(BOOL ADDED, FORM item, INT count )

;	debug.trace("running FUNCTION on" + item)

	; /////////////////////////
	; // AMMO STUFF GOES HERE
	; /////////////////////////

	; //are we ammo?
	;IF(item.getBaseObject() == xControl.Ammo10mm)
	IF(item == xControl.Ammo10mm)
		
		IF(ADDED)
			xControl.ammoPowderCount += (count/6)
			xControl.ammoShellCount += (count/6)
		ELSE
			xControl.ammoPowderCount -= (count/6)
			xControl.ammoShellCount -= (count/6)			
		ENDIF

		debug.trace("10mm: " + xControl.ammoPowderCount)

	ENDIF

	; //are we ammo?
	;IF(item.getBaseObject() == xControl.Ammo22Caliber)
	IF(item == xControl.Ammo22Caliber)
		
		IF(ADDED)
			xControl.ammoPowderCount += (count/6)
			xControl.ammoShellCount += (count/6)
		ELSE
			xControl.ammoPowderCount -= (count/6)
			xControl.ammoShellCount -= (count/6)			
		ENDIF

		debug.trace("22Cal: " + xControl.ammoPowderCount)

	ENDIF

	; //are we ammo?
	;IF(item.getBaseObject() == xControl.Ammo32Caliber)
	IF(item == xControl.Ammo32Caliber)
		
		IF(ADDED)
			xControl.ammoPowderCount += (count/6)
			xControl.ammoShellCount += (count/6)
		ELSE
			xControl.ammoPowderCount -= (count/6)
			xControl.ammoShellCount -= (count/6)			
		ENDIF

		debug.trace("32Cal: " + xControl.ammoPowderCount)

	ENDIF

	; //are we ammo?
	;IF(item.getBaseObject() == xControl.Ammo556)
	IF(item == xControl.Ammo556)		
		
		IF(ADDED)
			xControl.ammoPowderCount += (count/2)
			xControl.ammoShellCount += (count/2)
		ELSE
			xControl.ammoPowderCount -= (count/2)
			xControl.ammoShellCount -= (count/2)
		ENDIF

		debug.trace("556 Ammo: " + xControl.ammoPowderCount)

	ENDIF

	; /////////////////////////
	; // GUN STUFF GOES HERE
	; /////////////////////////	

	; //check for barrels
	IF(item.hasKeyword(xControl.dn_HasBarrelLong) || item.hasKeyword(xControl.dn_HasBarrelShort))
		
		; //are we adding or removing the item
		IF(ADDED)
			xControl.barrelCount += 0.5
		ELSE
			xControl.barrelCount -= 0.5
		ENDIF

	ENDIF

	; //check for bayonets
	IF(item.hasKeyword(xControl.dn_HasBayonet))
		
		; //are we adding or removing the item
		IF(ADDED)
			xControl.bayonetCount += 0.5
		ELSE
			xControl.bayonetCount -= 0.5
		ENDIF

	ENDIF

	; //check for damageTypes
	IF(item.hasKeyword(xControl.dn_HasDamageCryo) || item.hasKeyword(xControl.dn_HasDamageElectrical) || item.hasKeyword(xControl.dn_HasDamageFire) || item.hasKeyword(xControl.dn_HasDamagePoison) || item.hasKeyword(xControl.dn_HasDamageRadiation))
		
		; //are we adding or removing the item
		IF(ADDED)
			xControl.damageTypeCount += 0.5
		ELSE
			xControl.damageTypeCount -= 0.5
		ENDIF

	ENDIF

	; //check for mags
	IF(item.hasKeyword(xControl.dn_HasExtendedMag))
		
		; //are we adding or removing the item
		IF(ADDED)
			xControl.magCount += 0.5
		ELSE
			xControl.magCount -= 0.5
		ENDIF

	ENDIF

	; //check for grips
	IF(item.hasKeyword(xControl.dn_HasGripPistol) || item.hasKeyword(xControl.dn_HasGripRifle) || item.hasKeyword(xControl.dn_HasHuntingRifleShortGrip))
		
		debug.trace("butts")

		; //are we adding or removing the item
		IF(ADDED)
			xControl.gripCount += 0.5
		ELSE
			xControl.gripCount -= 0.5
		ENDIF

	ENDIF

	; //check for receivers
	IF(item.hasKeyword(xControl.dn_HasReceiverPipeMachineGun) || item.hasKeyword(xControl.dn_HasReceiverPipeSemiAuto) || item.hasKeyword(xControl.dn_HasReceiverPipeSingleShot) || item.hasKeyword(xControl.dn_HasReceiverRevolver) || item.hasKeyword(xControl.dn_HasReceiverShotgun))
		
		; //are we adding or removing the item
		IF(ADDED)		
			xControl.receiverCount += 0.5
		ELSE
			xControl.receiverCount -= 0.5
		ENDIF

	ENDIF	

	; //check for scopes
	IF(item.hasKeyword(xControl.dn_HasScope) || item.hasKeyword(xControl.dn_HasScopeOptical) || item.hasKeyword(xControl.dn_HasScopeReflex))
		
		; //are we adding or removing the item
		IF(ADDED)
			xControl.scopeCount += 0.5
		ELSE
			xControl.scopeCount -= 0.5
		ENDIF

	ENDIF	

	; //check for silencer
	IF(item.hasKeyword(xControl.dn_HasSilencer))
		
		; //are we adding or removing the item
		IF(ADDED)		
			xControl.silencerCount += 0.5
		ELSE
			xControl.silencerCount -= 0.5
		ENDIF
	
	ENDIF

	;debug.trace("BarrelCount: " + xControl.barrelCount)
	;debug.trace("BayonetCount: " + xControl.bayonetCount)
	;debug.trace("damageType: " + xControl.damageTypeCount)
	;debug.trace("magCount: " + xControl.magCount)
	;debug.trace("receiverCount: " + xControl.receiverCount)
	;debug.trace("silencerCount: " + xControl.silencerCount)
	;debug.trace("scopeCount: " + xControl.scopeCount)

ENDFUNCTION