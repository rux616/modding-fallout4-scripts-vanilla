Scriptname RR201RebelChestScript extends ObjectReference

int nNumberOfWeapons
int nWeaponsNeeded = 10

EVENT onLoad()
	registerForRemoteEvent(Self,"OnItemAdded")
	registerForRemoteEvent(Self,"OnItemRemoved")
	AddInventoryEventFilter(None) ; we get everything - hopefully we can handle it
endEVENT

EVENT ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	debug.trace("Item added to Rebel Chest")

	if ( akBaseItem is Weapon )
		debug.trace("It's a weapon")
		; Make sure it's not a one-off type weapon
		if ( !akBaseItem.HasKeyword(pWeaponTypeExplosive) && !akBaseItem.HasKeyword(pWeaponTypeGrenade) && !akBaseItem.HasKeyword(pWeaponTypeMine) && !akBaseItem.HasKeyword(pWeaponTypeThrown))
			; If it's a proper weapon count it for the quest
			nNumberOfWeapons += 1
			debug.trace("Total Weapons = " + nNumberOfWeapons)

			; If you aren't on the quest
			if ( !pRR201.GetStageDone(775) )
				if ( nNumberOfWeapons > 10 )	; Have you put in more than 10 weapons?
					nWeaponsNeeded += 1	        ; If so, now you need to put in N+1 weapons
				endif
			endif

			if ( nNumberOfWeapons >= nWeaponsNeeded && pRR201.GetStageDone(775) && !pRR201.GetStageDone(1050) )
				pRR201.SetStage(780)
				pRR201.SetObjectiveCompleted(775)    ; This ensures that the objective is complete
				;UnregisterForRemoteEvent(Self,"OnItemAdded")
				;UnregisterForRemoteEvent(Self,"OnItemRemoved")					
			endif
		endif
	endif
endEVENT

EVENT ObjectReference.OnItemRemoved(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	debug.trace("Item removed from Rebel Chest")

	if ( akBaseItem is Weapon )
		debug.trace("It's a weapon")
		; Make sure it's not a one-off type weapon
		if ( !akBaseItem.HasKeyword(pWeaponTypeExplosive) && !akBaseItem.HasKeyword(pWeaponTypeGrenade) && !akBaseItem.HasKeyword(pWeaponTypeMine) && !akBaseItem.HasKeyword(pWeaponTypeThrown))
			; If it's a proper weapon count it for the quest
			nNumberOfWeapons -= 1

			;if (nNumberOfWeapons < 0 )
			;	nNumberOfWeapons = 0
			;endif

			; If you aren't on the quest
			if ( !pRR201.GetStageDone(775) )
				if ( nNumberOfWeapons < 10 )	; Is there less than 10 weapons in there?
					nWeaponsNeeded = 10	        ; If so, now you need 10 weapons
				else
					nWeaponsNeeded -= 1
				endif
			endif

			; The player has removed the requisite number of weapons
			if ( pRR201.GetStageDone(780) && nNumberOfWeapons < nWeaponsNeeded && !pRR201.GetStageDone(1050) )
				
				pRR201.SetObjectiveCompleted(775, FALSE)
				pRR201.SetObjectiveDisplayed(775)
			endif

			debug.trace("Total Weapons = " + nNumberOfWeapons)
		endif
	endif
endEVENT

Keyword Property pWeaponTypeExplosive Auto Const
Keyword Property pWeaponTypeGrenade Auto Const
Keyword Property pWeaponTypeMine Auto Const
Keyword Property pWeaponTypeThrown Auto Const
Quest Property pRR201 Auto Const
