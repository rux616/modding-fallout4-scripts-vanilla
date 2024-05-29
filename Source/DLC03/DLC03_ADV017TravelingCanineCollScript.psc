Scriptname DLC03:DLC03_ADV017TravelingCanineCollScript extends RefCollectionAlias

Keyword Property WorkShopItemKeyword Auto Const Mandatory

;All this does is remove the dog from this ref collection when it is unloaded
Event OnUnload(ObjectReference akSenderRef)
	ObjectReference myWorkshop = akSenderRef.GetLinkedRef(WorkShopItemKeyword)
	if myWorkshop
		akSenderRef.Moveto(myWorkshop)
		RemoveRef(akSenderRef)
		(akSenderRef as Actor).AllowPCDialogue(true)
	endif
EndEvent