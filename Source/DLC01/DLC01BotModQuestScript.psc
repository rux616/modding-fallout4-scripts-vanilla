Scriptname DLC01:DLC01BotModQuestScript extends Quest

Int NumberOfUnlocks
Struct ItemDatum

Keyword BotModKeyword
{Keyword applied by bot mod.}

MiscObject ModMiscItem
{MiscItem associated with the relevant mod.}

GlobalVariable ModUnlockGlobal
{Global unlock variable associated with the relevant mod.}

Message DLC01BotModMessage
{AUTOFILL: Message to display when the inventory item is picked up.}

EndStruct

ItemDatum[] Property ItemData const auto
Keyword Property DLC01MiscModKeyword const auto
GlobalVariable Property DLC01AllowRobotModUnlocksGlobal const auto

Event OnInit()
	;Listen for the player picking up items
	RegisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
	;Only catch items with the keyword
	AddInventoryEventFilter(DLC01MiscModKeyword)
EndEvent

Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	;Get the index of the item
	int ItemIndex = ItemData.FindStruct("ModMiscItem", akBaseItem as MiscObject)
	;if the index is valid, send the item's struct info
	if ItemIndex > -1
		ItemDatum FoundDatum = ItemData[ItemIndex]
		;Check if we've already picked up this item, and if not, unlock mods with message
		if (FoundDatum.ModUnlockGlobal.GetValue() != 1)
			SetModGlobalAndShowMessage(FoundDatum.ModUnlockGlobal, FoundDatum.DLC01BotModMessage)

			;------------------------------------------------------------
			; FAB - Adding an achievement tracker for the recipes found
			NumberOfUnlocks += 1
			;Debug.Trace("Number of mods found: " + NumberOfUnlocks)
			if ( NumberOfUnlocks >= 10 )
				Game.AddAchievement(54)   ; Give the player Robot Hunter
			endif
			;------------------------------------------------------------
		endif
	endif
EndEvent

;Called by actors to determine which miscmod should be in their inventory
Function AddMiscModToMe(ObjectReference akSender)
	;Check if we're allowing robot mods to drop
	if DLC01AllowRobotModUnlocksGlobal.GetValue() == 1
		MiscObject[] AvailableMiscMods = New MiscObject[0]
		MiscObject[] PreferredMiscMods = New MiscObject[0]
		int i = 0
		;Check the array for keyword matches
		while i < ItemData.Length
			;Store struct info
			ItemDatum FoundDatum = ItemData[i]
			;If the actor has the keyword of a struct, add miscmod to arrays
			if akSender.HasKeyword(FoundDatum.BotModKeyword)
				AvailableMiscMods.Add(FoundDatum.ModMiscItem)
				;if the mod hasn't been picked up before, add to preferred
				if FoundDatum.ModUnlockGlobal.GetValue() != 1
					PreferredMiscMods.Add(FoundDatum.ModMiscItem)
				endif
			endif
			i += 1
		endwhile
		;if there are no preferred mods, pick from any available
		if PreferredMiscMods.Length == 0
			PreferredMiscMods = AvailableMiscMods
		endif
		;Randomly select from the preferred mods 
		int max = PreferredMiscMods.Length
		if max > 0
			int dieRoll = Utility.RandomInt(0, max - 1)
			MiscObject MiscModToAdd = PreferredMiscMods[dieRoll]
			;add miscmod to inventory
			akSender.AddItem(MiscModToAdd)
		endif
	endif
EndFunction

Function SetModGlobalAndShowMessage(GlobalVariable ModUnlockGlobal, Message DLC01BotModMessage)
	ModUnlockGlobal.SetValue(1)
	DLC01BotModMessage.Show()
EndFunction