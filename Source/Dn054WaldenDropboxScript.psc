Scriptname Dn054WaldenDropboxScript extends ReferenceAlias

quest property DN054 auto
weapon property RowdysGun auto

Event OnAliasInit()
	AddInventoryEventFilter(RowdysGun)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if DN054.getstage() == 50 && akBaseItem == RowdysGun
    	Dn054.setstage(60)
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if DN054.getstage() == 60 && akBaseItem == RowdysGun
    	Dn054.setstage(50)
	endif
EndEvent