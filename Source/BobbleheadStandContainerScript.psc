Scriptname BobbleheadStandContainerScript extends ObjectReference Hidden

Keyword Property BobbleheadKeyword const auto
Keyword Property FeaturedItem const auto

Message Property BobbleheadPerceptionMessage const auto
Message Property BobbleheadAgilityMessage const auto
Message Property BobbleheadBarterMessage const auto
Message Property BobbleheadBigGunMessage const auto
Message Property BobbleheadCharismaMessage const auto
Message Property BobbleheadEnduranceMessage const auto
Message Property BobbleheadEnergyWeaponsMessage const auto
Message Property BobbleheadExplosiveMessage const auto
Message Property BobbleheadIntelligenceMessage const auto
Message Property BobbleheadLockpickingMessage const auto
Message Property BobbleheadLuckMessage const auto
Message Property BobbleheadMedicineMessage const auto
Message Property BobbleheadMeleeMessage const auto
Message Property BobbleheadRepairMessage const auto
Message Property BobbleheadScienceMessage const auto
Message Property BobbleheadSmallGunMessage const auto
Message Property BobbleheadSneakMessage const auto
Message Property BobbleheadSpeechMessage const auto
Message Property BobbleheadStrengthMessage const auto
Message Property BobbleheadUnarmedMessage const auto

	; The starting aliases containing the bobbleheads.  These are set as QUEST ITEMS
ReferenceAlias Property BobbleheadAlias_Perception const auto
ReferenceAlias Property BobbleheadAlias_Agility const auto
ReferenceAlias Property BobbleheadAlias_Barter const auto
ReferenceAlias Property BobbleheadAlias_BigGun const auto
ReferenceAlias Property BobbleheadAlias_Charisma const auto
ReferenceAlias Property BobbleheadAlias_Endurance const auto
ReferenceAlias Property BobbleheadAlias_EnergyWeapons const auto
ReferenceAlias Property BobbleheadAlias_Explosive const auto
ReferenceAlias Property BobbleheadAlias_Intelligence const auto
ReferenceAlias Property BobbleheadAlias_Lockpicking const auto
ReferenceAlias Property BobbleheadAlias_Luck const auto
ReferenceAlias Property BobbleheadAlias_Medicine const auto
ReferenceAlias Property BobbleheadAlias_Melee const auto
ReferenceAlias Property BobbleheadAlias_Repair const auto
ReferenceAlias Property BobbleheadAlias_Science const auto
ReferenceAlias Property BobbleheadAlias_SmallGun const auto
ReferenceAlias Property BobbleheadAlias_Sneak const auto
ReferenceAlias Property BobbleheadAlias_Speech const auto
ReferenceAlias Property BobbleheadAlias_Strength const auto
ReferenceAlias Property BobbleheadAlias_Unarmed const auto

	; The alias the bobblhead gets moved to when it is no longer a quest item.
ReferenceAlias Property BobbleheadAlias_Perception_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Agility_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Barter_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_BigGun_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Charisma_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Endurance_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_EnergyWeapons_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Explosive_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Intelligence_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Lockpicking_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Luck_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Medicine_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Melee_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Repair_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Science_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_SmallGun_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Sneak_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Speech_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Strength_NonQuestObj const auto
ReferenceAlias Property BobbleheadAlias_Unarmed_NonQuestObj const auto

Keyword Property BlockWorkshopInteractionKeyword const auto

Struct DisplayBobbleheadStruct
	ObjectReference BobbleheadDisplayRef
	{This will hold the currently displayed bobblehead reference.}
	String BobbleheadDisplayNode
	{The node the bobblehead should be placed at.}
EndStruct

Form[] Property BobbleheadsInContainer auto
{Array of current bobblheads that are in the container.}

DisplayBobbleheadStruct[] Property DisplayBobbleheadStructArray auto
{Struct Array of each display bobblehead ref, and the node it should go to.}

bool AlreadyLoaded


Event OnLoad()
	if !AlreadyLoaded
		AlreadyLoaded = TRUE
    	BobbleheadsInContainer = New Form[0]
    endif
EndEvent


auto STATE AllowActivate

	Event OnActivate(ObjectReference akActionRef)
			; Block activation of the stand when the players activates it, delete the bobbleheads, swap their Quest Object...
			; ...status if the player currently has them, and then display the bobbleheads when the player leaves the container screen.

		GoToState("Busy")
		BlockActivation(TRUE)
		AddInventoryEventFilter(NONE)

		debug.Trace(self + "OnActivate()")
	    if akActionRef == Game.GetPlayer()
	    	DeleteBobbleheads()
	    	RemoveQuestObjectStatus()
	    	Utility.Wait(0.1)
	    	DisplayBobbleheads()
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
    if akBaseItem.HasKeyword(BobbleheadKeyword)
    	;Item is a Bobblehead, let it stay in the container, and add it to the array
    	BobbleheadsInContainer.Add(akBaseItem)
    	debug.Trace(self + "OnItemAdded() Item was a Bobblehead, adding it to the array.")
    else
    	;item is NOT a Bobblehead, give it back to the player
    	debug.Trace(self + "OnItemAdded() Item was NOT a Bobblehead, giving it back to the player.")
    	;utility.WaitMenuMode(0.1)
    	RemoveItem(akBaseItem, aiItemCount, false, Game.GetPlayer())
    endif
EndEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
		; If an item is removed, and its' a bobblhead, then remove it from the array.
	debug.Trace(self + "OnItemRemoved() " + aiItemCount + " " + akBaseItem)
    if akBaseItem.HasKeyword(BobbleheadKeyword)
		debug.Trace(self + "OnItemRemoved() Item was a Bobblehead")
    	int ItemIndex = BobbleheadsInContainer.Find(akBaseItem)
    	if ItemIndex >= 0
			debug.Trace(self + "OnItemRemoved() Bobblehead found in Array, removing it.")

    		BobbleheadsInContainer.Remove(ItemIndex)
    	endif
    endif
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		ObjectReference RefToCheck
		Message MessageToShow
		Int ButtonPressed
		debug.Trace(self + "OnActivate() |Player activated " + akSender)

		if aksender.GetBaseObject() == BobbleheadAlias_Perception_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Perception_NonQuestObj.GetReference()
			MessageToShow = BobbleheadPerceptionMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Agility_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Agility_NonQuestObj.GetReference()
			MessageToShow = BobbleheadAgilityMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Barter_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Barter_NonQuestObj.GetReference()
			MessageToShow = BobbleheadBarterMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_BigGun_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_BigGun_NonQuestObj.GetReference()
			MessageToShow = BobbleheadBigGunMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Charisma_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Charisma_NonQuestObj.GetReference()
			MessageToShow = BobbleheadCharismaMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Endurance_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Endurance_NonQuestObj.GetReference()
			MessageToShow = BobbleheadEnduranceMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_EnergyWeapons_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_EnergyWeapons_NonQuestObj.GetReference()
			MessageToShow = BobbleheadEnergyWeaponsMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Explosive_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Explosive_NonQuestObj.GetReference()
			MessageToShow = BobbleheadExplosiveMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Intelligence_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Intelligence_NonQuestObj.GetReference()
			MessageToShow = BobbleheadIntelligenceMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Lockpicking_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Lockpicking_NonQuestObj.GetReference()
			MessageToShow = BobbleheadLockpickingMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Luck_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Luck_NonQuestObj.GetReference()
			MessageToShow = BobbleheadLuckMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Medicine_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Medicine_NonQuestObj.GetReference()
			MessageToShow = BobbleheadMedicineMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Melee_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Melee_NonQuestObj.GetReference()
			MessageToShow = BobbleheadMeleeMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Repair_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Repair_NonQuestObj.GetReference()
			MessageToShow = BobbleheadRepairMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Science_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Science_NonQuestObj.GetReference()
			MessageToShow = BobbleheadScienceMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_SmallGun_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_SmallGun_NonQuestObj.GetReference()
			MessageToShow = BobbleheadSmallGunMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Sneak_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Sneak_NonQuestObj.GetReference()
			MessageToShow = BobbleheadSneakMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Speech_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Speech_NonQuestObj.GetReference()
			MessageToShow = BobbleheadSpeechMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Strength_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Strength_NonQuestObj.GetReference()
			MessageToShow = BobbleheadStrengthMessage
		
		elseif aksender.GetBaseObject() == BobbleheadAlias_Unarmed_NonQuestObj.GetReference().GetBaseObject()
			RefToCheck = BobbleheadAlias_Unarmed_NonQuestObj.GetReference()
			MessageToShow = BobbleheadUnarmedMessage
		endif


		ButtonPressed = MessageToShow.Show()
		if ButtonPressed == 0
			akActionRef.AddItem(RefToCheck)
			int ItemIndex = BobbleheadsInContainer.Find(RefToCheck.GetBaseObject())
			BobbleheadsInContainer.Remove(ItemIndex)
			int StructIndex = DisplayBobbleheadStructArray.FindStruct("BobbleheadDisplayRef", akSender)
			DisplayBobbleheadStructArray[StructIndex].BobbleheadDisplayRef = NONE
			akSender.DisableNoWait()
			akSender.Delete()
		endif

	endif
EndEvent

Function ShowBobbleheadMessage()

EndFunction

Function DisplayBobbleheads()
		;Displays all the bobblheads that are currently IN the stand
	debug.Trace(self + "DisplayBobbleheads()")
	int MaxCount = BobbleheadsInContainer.Length
	if MaxCount > 0
		int Count = 0
		while (Count < MaxCount)
			debug.Trace(self + "DisplayBobbleheads() " + (Count + 1) + " of " + MaxCount + ": " + BobbleheadsInContainer[Count])
			;DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef = PlaceAtNode(DisplayBobbleheadStructArray[Count].BobbleheadDisplayNode, BobbleheadsInContainer[Count])
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef = PlaceAtNode(DisplayBobbleheadStructArray[Count].BobbleheadDisplayNode, BobbleheadsInContainer[Count], 1, FALSE, FALSE, FALSE, TRUE)
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef.BlockActivation(TRUE,FALSE)
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef.SetMotionType(Motion_Keyframed, FALSE)
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef.AddKeyword(BlockWorkshopInteractionKeyword)
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef.SetNoFavorAllowed()
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef.SetPlayerHasTaken()
			RegisterForRemoteEvent(DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef, "OnActivate")
			Count += 1
		endwhile
	endif
EndFunction

Function DeleteBobbleheads()
		; Deletes all the bobblheads from the stand.
	debug.Trace(self + "DeleteBobbleheads()")
	int MaxCount = DisplayBobbleheadStructArray.Length
	int Count = 0
	while (Count < MaxCount)
		if DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef
			debug.Trace(self + "DeleteBobbleheads() " + (Count + 1) + " of " + MaxCount + ": " + DisplayBobbleheadStructArray[Count])
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef.DisableNoWait()
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef.Delete()
			DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef = NONE
		else
			debug.Trace(self + "DeleteBobbleheads() There are " + DisplayBobbleheadStructArray[Count].BobbleheadDisplayRef + " in the DisplayBobbleheadStructArray.")
		endif
		Count += 1
	endwhile
EndFunction


Function RemoveQuestObjectStatus()
		; Removes the Quest Object status of the bobblheads by moving them from one alias to the other.
		; Only bobblheads that are currently in the players inventory get switched.

	debug.Trace(self + "RemovequestObjectStatus()")

	if BobbleheadAlias_Perception.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Perception.GetReference()) > 0
			debug.Trace(self + "Player has the Perception Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Perception_NonQuestObj.ForceRefTo(BobbleheadAlias_Perception.GetReference())
			BobbleheadAlias_Perception.Clear()
		endif
	endif

	if BobbleheadAlias_Agility.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Agility.GetReference()) > 0
			debug.Trace(self + "Player has the Agility Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Agility_NonQuestObj.ForceRefTo(BobbleheadAlias_Agility.GetReference())
			BobbleheadAlias_Agility.Clear()
		endif
	endif

	if BobbleheadAlias_Barter.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Barter.GetReference()) > 0
			debug.Trace(self + "Player has the Barter Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Barter_NonQuestObj.ForceRefTo(BobbleheadAlias_Barter.GetReference())
			BobbleheadAlias_Barter.Clear()
		endif
	endif

	if BobbleheadAlias_BigGun.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_BigGun.GetReference()) > 0
			debug.Trace(self + "Player has the BigGun Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_BigGun_NonQuestObj.ForceRefTo(BobbleheadAlias_BigGun.GetReference())
			BobbleheadAlias_BigGun.Clear()
		endif
	endif

	if BobbleheadAlias_Charisma.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Charisma.GetReference()) > 0
			debug.Trace(self + "Player has the Charisma Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Charisma_NonQuestObj.ForceRefTo(BobbleheadAlias_Charisma.GetReference())
			BobbleheadAlias_Charisma.Clear()
		endif
	endif

	if BobbleheadAlias_Endurance.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Endurance.GetReference()) > 0
			debug.Trace(self + "Player has the Endurance Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Endurance_NonQuestObj.ForceRefTo(BobbleheadAlias_Endurance.GetReference())
			BobbleheadAlias_Endurance.Clear()
		endif
	endif

	if BobbleheadAlias_EnergyWeapons.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_EnergyWeapons.GetReference()) > 0
			debug.Trace(self + "Player has the EnergyWeapons Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_EnergyWeapons_NonQuestObj.ForceRefTo(BobbleheadAlias_EnergyWeapons.GetReference())
			BobbleheadAlias_EnergyWeapons.Clear()
		endif
	endif

	if BobbleheadAlias_Explosive.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Explosive.GetReference()) > 0
			debug.Trace(self + "Player has the Explosive Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Explosive_NonQuestObj.ForceRefTo(BobbleheadAlias_Explosive.GetReference())
			BobbleheadAlias_Explosive.Clear()
		endif
	endif

	if BobbleheadAlias_Intelligence.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Intelligence.GetReference()) > 0
			debug.Trace(self + "Player has the Intelligence Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Intelligence_NonQuestObj.ForceRefTo(BobbleheadAlias_Intelligence.GetReference())
			BobbleheadAlias_Intelligence.Clear()
		endif
	endif

	if BobbleheadAlias_Lockpicking.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Lockpicking.GetReference()) > 0
			debug.Trace(self + "Player has the Lockpicking Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Lockpicking_NonQuestObj.ForceRefTo(BobbleheadAlias_Lockpicking.GetReference())
			BobbleheadAlias_Lockpicking.Clear()
		endif
	endif

	if BobbleheadAlias_Luck.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Luck.GetReference()) > 0
			debug.Trace(self + "Player has the Luck Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Luck_NonQuestObj.ForceRefTo(BobbleheadAlias_Luck.GetReference())
			BobbleheadAlias_Luck.Clear()
		endif
	endif

	if BobbleheadAlias_Medicine.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Medicine.GetReference()) > 0
			debug.Trace(self + "Player has the Medicine Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Medicine_NonQuestObj.ForceRefTo(BobbleheadAlias_Medicine.GetReference())
			BobbleheadAlias_Medicine.Clear()
		endif
	endif

	if BobbleheadAlias_Melee.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Melee.GetReference()) > 0
			debug.Trace(self + "Player has the Melee Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Melee_NonQuestObj.ForceRefTo(BobbleheadAlias_Melee.GetReference())
			BobbleheadAlias_Melee.Clear()
		endif
	endif

	if BobbleheadAlias_Repair.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Repair.GetReference()) > 0
			debug.Trace(self + "Player has the Repair Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Repair_NonQuestObj.ForceRefTo(BobbleheadAlias_Repair.GetReference())
			BobbleheadAlias_Repair.Clear()
		endif
	endif

	if BobbleheadAlias_Science.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Science.GetReference()) > 0
			debug.Trace(self + "Player has the Science Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Science_NonQuestObj.ForceRefTo(BobbleheadAlias_Science.GetReference())
			BobbleheadAlias_Science.Clear()
		endif
	endif

	if BobbleheadAlias_SmallGun.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_SmallGun.GetReference()) > 0
			debug.Trace(self + "Player has the SmallGun Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_SmallGun_NonQuestObj.ForceRefTo(BobbleheadAlias_SmallGun.GetReference())
			BobbleheadAlias_SmallGun.Clear()
		endif
	endif

	if BobbleheadAlias_Sneak.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Sneak.GetReference()) > 0
			debug.Trace(self + "Player has the Sneak Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Sneak_NonQuestObj.ForceRefTo(BobbleheadAlias_Sneak.GetReference())
			BobbleheadAlias_Sneak.Clear()
		endif
	endif

	if BobbleheadAlias_Speech.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Speech.GetReference()) > 0
			debug.Trace(self + "Player has the Speech Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Speech_NonQuestObj.ForceRefTo(BobbleheadAlias_Speech.GetReference())
			BobbleheadAlias_Speech.Clear()
		endif
	endif

	if BobbleheadAlias_Strength.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Strength.GetReference()) > 0
			debug.Trace(self + "Player has the Strength Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Strength_NonQuestObj.ForceRefTo(BobbleheadAlias_Strength.GetReference())
			BobbleheadAlias_Strength.Clear()
		endif
	endif

	if BobbleheadAlias_Unarmed.GetReference()
		if Game.GetPlayer().GetItemCount(BobbleheadAlias_Unarmed.GetReference()) > 0
			debug.Trace(self + "Player has the Unarmed Bobblehead.  Removing it's QUEST OBJECT Status.")
			BobbleheadAlias_Unarmed_NonQuestObj.ForceRefTo(BobbleheadAlias_Unarmed.GetReference())
			BobbleheadAlias_Unarmed.Clear()
		endif
	endif
EndFunction


Event OnWorkshopObjectGrabbed(ObjectReference akReference)
		; Delete the bobbleheads when the stand is picked up in workshop mode.
	;DeleteBobbleheads()
EndEvent


Event OnWorkshopObjectMoved(ObjectReference akReference)
		; Re-display the bobbleheads whent he stand is set back down in workshop mode.
	;DisplayBobbleheads()
EndEvent


Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
		;  Delete the bobbleheads when the stand is destroyed in workshop mode.
	DeleteBobbleheads()
EndEvent


;DEBUG function for moving the bobblheads to the player to test the Bobblehead Stand
Function DoThing()
	Game.GetPlayer().AddItem(BobbleheadAlias_Perception.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Agility.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Barter.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_BigGun.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Charisma.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Endurance.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_EnergyWeapons.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Explosive.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Intelligence.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Lockpicking.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Luck.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Medicine.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Melee.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Repair.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Science.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_SmallGun.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Sneak.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Speech.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Strength.GetReference(), 1, TRUE)
	Game.GetPlayer().AddItem(BobbleheadAlias_Unarmed.GetReference(), 1, TRUE)
EndFunction