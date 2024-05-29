Scriptname WorkshopSetOwnedTriggerScript extends ObjectReference Const
{ set linked workshop to owned when player enters trigger }

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		WorkshopScript myWorkshop = GetLinkedRef() as WorkshopScript
		if myWorkshop
			myWorkshop.SetOwnedByPlayer(true)
			Delete()
		endif
	endif
EndEvent

