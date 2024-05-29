Scriptname tpSmelterButtonSCRIPT extends ObjectReference

; reference to where all our data is stored
OBJECTREFERENCE PROPERTY xMarkerControl AUTO
tpSmelterXMarkerSCRIPT xControl

EVENT onLoad()
  	; //setting the master script to be the one with the stored vars
	xControl = xMarkerControl AS tpSmelterXMarkerSCRIPT

ENDEVENT

EVENT onACTIVATE(OBJECTREFERENCE triggerRef)
	
	; //add all the barrelcount
	xControl.outputBoxRef.addItem(xControl.llBarrels, xControl.barrelCount AS INT)

	; //add all the bayonetCount
	xControl.outputBoxRef.addItem(xControl.llBayonets, xControl.bayonetCount AS INT)
	
	; //add all the damageTypeCount
	xControl.outputBoxRef.addItem(xControl.llDamageTypes, xControl.damageTypeCount AS INT)

	; //add all the magCount
	xControl.outputBoxRef.addItem(xControl.llMag, xControl.magCount AS INT)

	; //add all the gripCount
	xControl.outputBoxRef.addItem(xControl.llGrips, xControl.gripCount AS INT)

	; //add all the receiverCount
	xControl.outputBoxRef.addItem(xControl.llReceivers, xControl.receiverCount AS INT)

	; //add all the scopeCount
	xControl.outputBoxRef.addItem(xControl.llScopes, xControl.scopeCount AS INT)

	; //add all the silencerCount
	xControl.outputBoxRef.addItem(xControl.llSilencers, xControl.silencerCount AS INT)	

	; //the ammo and shell counts
	xControl.outputBoxRef.addItem(xControl.tpCompGunpowder, xControl.ammoPowderCount AS INT)	
	xControl.outputBoxRef.addItem(xControl.tpCompSteel, xControl.ammoShellCount AS INT)	

	; //clear out the chest
	xControl.inputBoxRef.removeAllItems()

	; //zero out the counts
	xControl.barrelCount = 0
	xControl.bayonetCount = 0
	xControl.damageTypeCount = 0
	xControl.magCount = 0
	xControl.gripCount = 0
	xControl.receiverCount = 0
	xControl.scopeCount = 0
	xControl.silencerCount = 0
	xControl.ammoPowderCount = 0
	xControl.ammoShellCount = 0

ENDEVENT
