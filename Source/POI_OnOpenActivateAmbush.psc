Scriptname POI_OnOpenActivateAmbush extends ObjectReference Const

Event OnOpen(ObjectReference akActionRef)

	GetLinkedRef().Activate(Game.GetPlayer())

endEvent