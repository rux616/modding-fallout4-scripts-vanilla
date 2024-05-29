Scriptname DLC04:DLC04BottleRackScript extends ObjectReference
{This script is for the bottle rack that lets the player display bottles of Nuka Cola}


FormList Property DLC04NukaBottleRackAllowedBeverages Auto
{All beverages allowed by the rack
	Note to modders: This is done as a formlist
	because you can add things to a formlist through script.
	If you want to add new drinks to be supported, do so as to not cause Mod conflicts}

;This could also be done with an array, but is simpler with a formlist


Struct ItemSlot
	String Node
	objectReference myRef
	form myBaseForm
EndStruct
;BottlePlacement_01 - 08

ItemSlot[] Property ItemSlots Auto Mandatory

Message Property DLC04BottleRackWrongItemMessage Auto Const Mandatory
Message Property DLC04BottleRackWrongItemMessage2 Auto Const Mandatory
Message Property DLC04BottleRackFullMessage Auto Const Mandatory

Keyword Property BlockWorkshopInteractionKeyword Auto Const Mandatory

Keyword Property WorkshopItemKeyword Auto Const Mandatory



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	States Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


auto STATE AllowActivate

	Event OnActivate(ObjectReference akActionRef)
			; Block activation of the stand when the players activates it, delete the magazine, swap their Quest Object...
			; ...status if the player currently has them, and then display the magazine when the player leaves the container screen.

		GoToState("Busy")
		BlockActivation(TRUE)
		AddInventoryEventFilter(NONE)

		debug.Trace(self + "OnActivate()")
	    if akActionRef == Game.GetPlayer()
	    	;DeletePerkMags()
	    	Utility.Wait(0.1)
	    	;DisplayPerkMags()
	    endif

	    GoToState("AllowActivate")
		BlockActivation(FALSE)

	EndEvent

EndSTATE



STATE Busy
	;Do Nothing
EndSTATE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Interaction Events Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool InitComplete
Event OnLoad()
	if !InitComplete
		InitComplete = TRUE
    	;PerkMagsInContainer = New Form[0]
    endif
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		; If an item is added and it's a bobblehead then add it to the array, else give it back to the player.
	debug.Trace(self + "OnItemAdded() " + aiItemCount + " " + akBaseItem)
	;This returns Negative if the form is not in the formlist

    if DLC04NukaBottleRackAllowedBeverages.Find(akBaseItem) >= 0
    	
    	int i = 0
    	;Go through for the number of items added, till we are out of slots
    	int openSlot = GetOpenSlot()
    	While i < aiItemCount && openSlot > -1
	    	;If we find an open slot
	    	if openSlot > -1
	    		;RemoveItem(akBaseItem, 1, true)
	    		objectReference NewBottle = PlaceAtNode(ItemSlots[openSlot].node, akBaseItem, abDeleteWhenAble = false, abAttach = true)
	    		ItemSlots[openSlot].myBaseForm = akBaseItem
	    		ItemSlots[openSlot].myRef = NewBottle
	    		ItemSlots[openSlot].myRef.AddKeyword(BlockWorkshopInteractionKeyword)
	    		RegisterForRemoteEvent(ItemSlots[openSlot].myRef, "OnContainerChanged")
	    	else
	    		;RemoveItem(akBaseItem, aiItemCount, false, Game.GetPlayer())
		    	DLC04BottleRackFullMessage.Show()

	    	endif
	    	openSlot = GetOpenSlot()
	    	i += 1
    	EndWhile
    	
    	if i < aiItemCount
    		DLC04BottleRackFullMessage.Show()
    		int itemsReturned = aiItemCount - i
    		RemoveItem(akBaseItem, itemsReturned, false)
			Game.GetPlayer().AddItem(akBaseItem, itemsReturned)
    	Endif
		
    else
    	;item is NOT a Bottle, give it back to the player
    	debug.Trace(self + "OnItemAdded() Item was NOT a Bottle, giving it back to the player.")
    	;utility.WaitMenuMode(0.1)
    	RemoveItem(akBaseItem, aiItemCount, false, Game.GetPlayer())
    	DLC04BottleRackWrongItemMessage2.Show()
    endif
EndEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	; If an item is removed, and its' a bobblhead, then remove it from the array.
	debug.Trace(self + "OnItemRemoved() " + aiItemCount + " , " + akBaseItem)
	;if we are removing this TO somewhere (aka the player is taking it)
	if akDestContainer
		int i = 0
		bool DidNotFindInDisplaySlot
		while i < aiItemCount && !DidNotFindInDisplaySlot
			int ItemIndex = ItemSlots.FindStruct("myBaseForm", akBaseItem)
			if ItemIndex >= 0
				debug.Trace(self + "OnItemRemoved() Bottle found in Array >> " + ItemIndex)
				ItemSlots[ItemIndex].myRef.DisableNoWait()
				ItemSlots[ItemIndex].myRef.Delete()
				ItemSlots[ItemIndex].myRef = NONE
				ItemSlots[ItemIndex].myBaseForm = none
			else
				DidNotFindInDisplaySlot = true
			endif
			i += 1
		endWhile
	endif
EndEvent


Event ObjectReference.OnContainerChanged(ObjectReference akSender, ObjectReference akNewContainer, ObjectReference akOldContainer)
	UnregisterForRemoteEvent(akSender, "OnContainerChanged")
	int i = ItemSlots.FindStruct("myRef", akSender)
	ItemSlots[i].myRef = NONE
	ItemSlots[i].myBaseForm = none
	RemoveItem(akSender.GetBaseObject())
	akSender.RemoveKeyword(BlockWorkshopInteractionKeyword)
EndEvent



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Functions Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This function returns the first open display slot, if none are availible it returns -1
int Function GetOpenSlot()
	int i = 0
	int count = ItemSlots.Length
	while i < count
		if ItemSlots[i].myRef == NONE
			Return i
		endif
		i += 1
	EndWhile
	Return -1
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Workshop Events Block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ObjectReference MyWorkshopContainer
Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)

	Debug.Trace(self + ": OnWorkshopObjectDestroyed")
	int i = 0
	int	count = ItemSlots.Length
	While i < Count
		UnregisterForRemoteEvent(ItemSlots[i].myRef, "OnContainerChanged")
		ItemSlots[i].myRef.DisableNoWait()
		ItemSlots[i].myRef.Delete()
		ItemSlots[i].myRef = NONE
		ItemSlots[i].myBaseForm = none
		i += 1
	EndWhile
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
    MyWorkshopContainer = GetLinkedRef(WorkshopItemKeyword)
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	debug.Trace(self + ": OnWorkshopObjectMoved")
    int i = 0
	int	count = ItemSlots.Length
	while i < count
		if ItemSlots[i].myRef != none
			ItemSlots[i].myRef.MoveToNode(self, ItemSlots[i].node)
			ItemSlots[i].myRef.EnableNoWait()
		endif
		i += 1
	endWhile
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akReference)
	debug.Trace(self + ": OnWorkshopObjectGrabbed")
	int i = 0
	int	count = ItemSlots.Length
	while i < count
		if ItemSlots[i].myRef != none
			ItemSlots[i].myRef.DisableNoWait()
		endif
		i += 1
	endWhile
EndEvent