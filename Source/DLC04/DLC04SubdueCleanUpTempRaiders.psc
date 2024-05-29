Scriptname DLC04:DLC04SubdueCleanUpTempRaiders extends RefCollectionAlias Const

Event OnUnload(ObjectReference akSenderRef)
	Actor act = (akSenderRef as Actor)

	if !act.IsDisabled()
		act.Disable()
	endif

	act.Delete()

	;Finally, remove ref from collection
	RemoveRef(akSenderRef)
EndEvent
