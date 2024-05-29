Scriptname MagazineRackContainerScript extends ObjectReference Hidden

Keyword Property PerkMagKeyword const auto

Keyword Property BlockWorkshopInteractionKeyword const auto
Keyword Property FeaturedItem const auto

Struct DisplayPerkMagStruct
	ObjectReference PerkMagDisplayRef
	{This will hold the currently displayed PerkMag reference.}
	String PerkMagDisplayNode
	{The node the PerkMag should be placed at.}
EndStruct

Form[] Property PerkMagsInContainer auto
{Array of current bobblheads that are in the container.}

DisplayPerkMagStruct[] Property DisplayPerkMagStructArray auto
{Struct Array of each display bobblehead ref, and the node it should go to.}

Message Property MagazineRackContainerFullMessage auto
Message Property MagazineRackContainerNotMagazineMessage auto

Bool Property IsSwivelRack = FALSE auto
Int Property SwivelRackStage = 1 auto

bool AlreadyLoaded


Event OnLoad()
	if !AlreadyLoaded
		AlreadyLoaded = TRUE
    	PerkMagsInContainer = New Form[0]
    endif
EndEvent


auto STATE AllowActivate

	Event OnActivate(ObjectReference akActionRef)
			; Block activation of the stand when the players activates it, delete the magazine, swap their Quest Object...
			; ...status if the player currently has them, and then display the magazine when the player leaves the container screen.

		GoToState("Busy")
		BlockActivation(TRUE)
		AddInventoryEventFilter(NONE)

		debug.Trace(self + "OnActivate()")
	    if akActionRef == Game.GetPlayer()
	    	DeletePerkMags()
	    	Utility.Wait(0.1)
	    	DisplayPerkMags()
	    endif

	    GoToState("AllowActivate")
		BlockActivation(FALSE)

	EndEvent

EndSTATE



STATE Busy
	;Do Nothing
EndSTATE



Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		; If an item is added and it's a bobblehead then add it to the array, else give it back to the player.
	debug.Trace(self + "OnItemAdded() " + aiItemCount + " " + akBaseItem)
    if akBaseItem.HasKeyword(PerkMagkeyword)
    	if PerkMagsInContainer.Length == DisplayPerkMagStructArray.Length
    			; The magazine rack is full.
	    	debug.Trace(self + "OnItemAdded() The Magazine Rack is full, give the magazine back to the player.")
	    	RemoveItem(akBaseItem, aiItemCount, false, Game.GetPlayer())
	    	MagazineRackContainerFullMessage.Show()
    	else
	    		; Item is a Magazine, let it stay in the container, and add it to the array
	    	PerkMagsInContainer.Add(akBaseItem)
	    	debug.Trace(self + "OnItemAdded() Item was a Magazine, adding it to the array.")
	    endif
    else
    	;item is NOT a Magazine, give it back to the player
    	debug.Trace(self + "OnItemAdded() Item was NOT a Magazine, giving it back to the player.")
    	;utility.WaitMenuMode(0.1)
    	RemoveItem(akBaseItem, aiItemCount, false, Game.GetPlayer())
    	MagazineRackContainerNotMagazineMessage.Show()
    endif
EndEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
		; If an item is removed, and its' a bobblhead, then remove it from the array.
	debug.Trace(self + "OnItemRemoved() " + aiItemCount + " " + akBaseItem)
    if akBaseItem.HasKeyword(PerkMagkeyword)
		debug.Trace(self + "OnItemRemoved() Item was a Magazine")
    	int ItemIndex = PerkMagsInContainer.Find(akBaseItem)
    	if ItemIndex >= 0
			debug.Trace(self + "OnItemRemoved() Magazine found in Array, removing it.")

    		PerkMagsInContainer.Remove(ItemIndex)
    	endif
    endif
EndEvent


Event ObjectReference.OnContainerChanged(ObjectReference akSender, ObjectReference akNewContainer, ObjectReference akOldContainer)
	UnregisterForRemoteEvent(akSender, "OnContainerChanged")
	RemoveItem(akSender.GetBaseObject())
	akSender.RemoveKeyword(BlockWorkshopInteractionKeyword)
EndEvent


Function DisplayPerkMags()
		;Displays all the bobblheads that are currently IN the stand
	debug.Trace(self + "DisplayPerkMags()")
	int MaxCount = PerkMagsInContainer.Length
	if MaxCount > 0
		int Count = 0
		while (Count < MaxCount)
			debug.Trace(self + "DisplayPerkMags() " + (Count + 1) + " of " + MaxCount + ": " + PerkMagsInContainer[Count])
			;DisplayPerkMagStructArray[Count].PerkMagDisplayRef = PlaceAtNode(DisplayPerkMagStructArray[Count].PerkMagDisplayNode, PerkMagsInContainer[Count])
			DisplayPerkMagStructArray[Count].PerkMagDisplayRef = PlaceAtNode(DisplayPerkMagStructArray[Count].PerkMagDisplayNode, PerkMagsInContainer[Count], 1, FALSE, FALSE, FALSE, TRUE)
			;DisplayPerkMagStructArray[Count].PerkMagDisplayRef.BlockActivation(TRUE,TRUE)
			RegisterForRemoteEvent(DisplayPerkMagStructArray[Count].PerkMagDisplayRef, "OnContainerChanged")
			DisplayPerkMagStructArray[Count].PerkMagDisplayRef.SetMotionType(Motion_Keyframed, FALSE)
			DisplayPerkMagStructArray[Count].PerkMagDisplayRef.AddKeyword(BlockWorkshopInteractionKeyword)
			DisplayPerkMagStructArray[Count].PerkMagDisplayRef.SetNoFavorAllowed()
			DisplayPerkMagStructArray[Count].PerkMagDisplayRef.SetPlayerHasTaken()
			Count += 1
		endwhile
	endif
	if IsSwivelRack
		if SwivelRackStage == 1
			SwivelRackStage = 2
			PlayAnimation("Stage2")
		elseif SwivelRackStage == 2
			SwivelRackStage = 3
			PlayAnimation("Stage3")
		elseif SwivelRackStage == 3
			SwivelRackStage = 4
			PlayAnimation("Stage4")
		elseif SwivelRackStage == 4
			SwivelRackStage = 1
			PlayAnimation("Reset")
		endif
	endif
EndFunction

Function DeletePerkMags()
		; Deletes all the bobblheads from the stand.
	debug.Trace(self + "DeletePerkMags()")
	int MaxCount = DisplayPerkMagStructArray.Length
	int Count = 0
	while (Count < MaxCount)
		if DisplayPerkMagStructArray[Count].PerkMagDisplayRef
			debug.Trace(self + "DeletePerkMags() " + (Count + 1) + " of " + MaxCount + ": " + PerkMagsInContainer[Count])
			DisplayPerkMagStructArray[Count].PerkMagDisplayRef.DisableNoWait()
			DisplayPerkMagStructArray[Count].PerkMagDisplayRef.Delete()
			DisplayPerkMagStructArray[Count].PerkMagDisplayRef = NONE
		endif
		Count += 1
	endwhile
EndFunction


Event OnWorkshopObjectGrabbed(ObjectReference akReference)
		; Delete the magazine when the stand is picked up in workshop mode.
	;DeletePerkMags()
EndEvent


Event OnWorkshopObjectMoved(ObjectReference akReference)
		; Re-display the magazine whent he stand is set back down in workshop mode.
	;DisplayPerkMags()
EndEvent


Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
		;  Delete the magazine when the stand is destroyed in workshop mode.
	DeletePerkMags()
EndEvent


;DEBUG function for moving the bobblheads to the player to test the Bobblehead Stand
Function DoThing()

EndFunction