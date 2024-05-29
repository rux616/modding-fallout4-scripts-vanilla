Scriptname vaultSuitPackageSCRIPT extends ObjectReference

ARMOR PROPERTY vaultSuit AUTO
MISCOBJECT PROPERTY wrappedSuit AUTO

BOOL DOONCE = TRUE

EVENT ONACTIVATE(OBJECTREFERENCE akActionRef)
  
	IF(akActionRef == game.getPlayer() && DOONCE)
		DOONCE = FALSE

		; //remove this item
		game.getPlayer().removeItem(wrappedSuit, 1, TRUE)

		; //add the vault suit
		game.getPlayer().addItem(vaultSuit, 1)
	

	ENDIF

ENDEVENT