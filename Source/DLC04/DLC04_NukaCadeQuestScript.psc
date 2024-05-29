Scriptname DLC04:DLC04_NukaCadeQuestScript extends Quest


int Property TicketsEarnedForAchievement = 100000 auto const
int Property TicketAchievementStage = 1000 Auto Const
float Property DaysTillRefill = 3.0 auto const

MiscObject Property DLC04_Nukacade_Ticket01 Auto Const Mandatory
ObjectReference Property DLC04NukacadeTerminalRef Auto Const Mandatory
GlobalVariable Property DLC04TicketsRedeemedTotal Auto Const Mandatory
GlobalVariable Property DLC04TicketsRedeemedCurrent Auto Const Mandatory
GlobalVariable Property DLC04NukacadePrizeLevelRange1 Auto Const Mandatory
GlobalVariable Property DLC04NukacadePrizeLevelRange2 Auto Const Mandatory
GlobalVariable Property DLC04NukacadePrizeLevelRange3 Auto Const Mandatory
GlobalVariable Property DLC04NukacadePrizeLevelRange4 Auto Const Mandatory


int TotalTicketsRedeemed
int PrizeLevelRange1
int PrizeLevelRange2
int PrizeLevelRange3
int PrizeLevelRange4

Struct TextIcon
	String myToken
	GlobalVariable myGlobal
EndStruct

TextIcon[] Property TextVars Auto 
bool Initialized
Function Init()
	if !Initialized
		PrizeLevelRange1 = DLC04NukacadePrizeLevelRange1.GetValue() as Int
		PrizeLevelRange2 = DLC04NukacadePrizeLevelRange2.GetValue() as Int
		PrizeLevelRange3 = DLC04NukacadePrizeLevelRange3.GetValue() as Int
		PrizeLevelRange4 = DLC04NukacadePrizeLevelRange4.GetValue() as Int
	Endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				Ticket Redemption
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function RedeemTickets()
	Actor PlayerActor = game.GetPlayer()
	int PlayerTicketCount = PlayerActor.GetItemCount(DLC04_Nukacade_Ticket01)
	int	numberOfTicketsRedeemed = PlayerActor.GetItemCount(DLC04_Nukacade_Ticket01)

	PlayerActor.RemoveItem(DLC04_Nukacade_Ticket01, numberOfTicketsRedeemed)
	;Add to the current tickets, which changes when you buy stuff
	DLC04TicketsRedeemedCurrent.SetValue(DLC04TicketsRedeemedCurrent.GetValue() + numberOfTicketsRedeemed)

	;Add to the total tickets ever redeemed
	TotalTicketsRedeemed = (DLC04TicketsRedeemedTotal.GetValue() as int) + numberOfTicketsRedeemed
	DLC04TicketsRedeemedTotal.SetValue(TotalTicketsRedeemed)
	;Check for Achievement
	
	if !GetStageDone(TicketAchievementStage) && TotalTicketsRedeemed >= TicketsEarnedForAchievement
		SetStage(TicketAchievementStage)
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				Terminal Integration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;;DECLARE TERMINAL OR SOMETHING
Function UpdateTerminal(ObjectReference ThisTerminal)
	;Redeemed Item
	;DLC04NukacadeTerminalRef.AddTextReplacementData("CurrentRedeemed", DLC04TicketsRedeemedCurrent)
	;DLC04NukacadeTerminalRef.AddTextReplacementData("TotalRedeemed", DLC04TicketsRedeemedTotal)

	int i = 0
	int count = TextVars.length
	while i < count
			ThisTerminal.AddTextReplacementData(TextVars[i].myToken, TextVars[i].myGlobal) 
;			DLC04NukacadeTerminalRef.AddTextReplacementData(TextVars[i].myToken, TextVars[i].myGlobal) 
		i += 1
	EndWhile
	PriceCheck(thisTerminal)
EndFunction



;DLC04NukacadeTerminal.AddTextReplacementData("CurrentRedeemed", (CurrentTicketsRedeemed as string))


Function PriceCheck(ObjectReference thisTerminal)
	int i = 0
	int count = SaleItems.length
	int currentPrice
	int TicketPrice
	while i < count
		;Clear Price
		currentPrice = 0
		;Get Base Price
		currentPrice = SaleItems[i].myRefAlias.GetReference().GetGoldValue()
		Debug.Trace(self + ": currentPrice = " + currentPrice)
		TicketPrice = math.Floor(currentPrice * DLC04NukacadePriceMult.GetValue())
		Debug.Trace(self + ": TicketPrice = " + TicketPrice)

		SaleItems[i].myPriceGlobal.SetValue(TicketPrice)
		thisTerminal.AddTextReplacementData(SaleItems[i].myPriceString, SaleItems[i].myPriceGlobal)
		i += 1
	Endwhile

EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				Prize Purchase
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ReferenceAlias Property ItemCurrent Auto Const Mandatory
GlobalVariable Property DLC04NukacadeItemCurrentPrice Auto Const Mandatory
GlobalVariable Property DLC04NukacadePriceMult Auto Const Mandatory
Struct SaleItem
	int Number
	referenceAlias myRefAlias
	GlobalVariable myPriceGlobal
	String myPriceString
	bool CanBeRefilled = true
EndStruct

SaleItem[] Property SaleItems Auto Const Mandatory
Int CurrentItemNumber
Function SetItemToBuy(ObjectReference thisTerminal, int ItemNumber)
	Debug.Trace(Self + ": ItemNumber = " + ItemNumber)
	;Check against the saleItems array, remember that it starts with entry 0
	;	Even though the Number on item 0 is 1
	Debug.Trace(self + ": FindStruct = " + (SaleItems.FindStruct("Number", ItemNumber)))
	if (SaleItems.FindStruct("Number", ItemNumber) >= 0)
		CurrentItemNumber = SaleItems.FindStruct("Number", ItemNumber)
		ObjectReference SelectedItem = SaleItems[CurrentItemNumber].myRefAlias.GetReference()
		Debug.Trace(Self + ": SelectedItem = " + SelectedItem)
		ItemCurrent.ForceRefTo(SelectedItem)
		Debug.Trace(Self + ": ItemCurrent = " + ItemCurrent)
		DLC04NukacadeItemCurrentPrice.SetValue(Math.Floor(SelectedItem.GetGoldValue() as float) * DLC04NukacadePriceMult.GetValue())
		
		thisTerminal.AddTextReplacementData("CurrentItemPrice", DLC04NukacadeItemCurrentPrice) 
	else
		Debug.Trace(Self + ": What kind of garbage number is this?!" + ItemNumber)
	endif
EndFunction

ObjectReference Property DLC04NukaCadeItemDropMarker Auto Const Mandatory

Function BuyTheItem()
	Debug.Trace(Self + ": BuyTheItem")
	;Clear the current Item
	ItemCurrent.Clear()
	;Store the Dispensed object from the SaleItems
	ObjectReference DispensedObject = SaleItems[CurrentItemNumber].myRefAlias.GetReference()
	;Take the tickets
	DLC04TicketsRedeemedCurrent.SetValue(DLC04TicketsRedeemedCurrent.GetValue() - DLC04NukacadeItemCurrentPrice.GetValue())
	;Dispense the item
	SaleItems[CurrentItemNumber].myRefAlias.Clear()
	SaleItems[CurrentItemNumber].myPriceGlobal.SetValue(0)
	SaleItems[CurrentItemNumber].CanBeRefilled = True
	AddToDispenserList(DispensedObject)
	;Utility.WaitMenuMode(0.1)
	;DispensedObject.Moveto(DLC04NukaCadeItemDropMarker)

EndFunction

ObjectReference[] DispenserList
bool WaitingToDispensePrizes
Function AddToDispenserList(objectReference refToDispense)
	If DispenserList.length < 1
		DispenserList = new ObjectReference[0]
	Endif
	DispenserList.Add(refToDispense)

	if !WaitingToDispensePrizes
		WaitingToDispensePrizes = true
		While DLC04NukacadeTerminalRef.IsFurnitureInUse()
			utility.wait(1.0)
		EndWhile
		Utility.WaitMenuMode(0.1)
		DLC04OBJArcadePrizeDispenserDispense.Play(DLC04NukaCadeItemDropMarker)
		utility.wait(3.5)
		;Have to do the dispensing this way so that if 
		;the player adds new items while it is dispensing, it doesn't mess up
		While DispenserList.length > 0
			While DLC04NukacadeTerminalRef.IsFurnitureInUse()
				utility.wait(1.0)
			EndWhile
			DLC04OBJArcadePrizeDispenserDispenseMechanicalB.Play(DLC04NukaCadeItemDropMarker)
			utility.wait(1.0)
			DispenserList[0].Moveto(DLC04NukaCadeItemDropMarker)
			DispenserList.Remove(0)
		EndWhile

		WaitingToDispensePrizes = false
	EndIf
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				Prize Spawning
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Checked externally to make sure we have finished filling the prizes
bool Property BusyRefilling = false auto

;This clears all items that can be cleared, then fills items again
;We don't clear some items so we can keep the initial set of legendaries available
Function RefillItems()
	BusyRefilling = true
	int i = 0
	int Count = SaleItems.Length
	While i < count
		if SaleItems[i].CanBeRefilled
			ObjectReference CurrentRef = SaleItems[i].myRefAlias.GetReference()
			if CurrentRef
				SaleItems[i].myRefAlias.Clear()
				CurrentRef.Delete()
			endif
		endif
		i += 1
	EndWhile

	FillItems()
EndFunction

float lastFilled = 0.0
;This is fired off by an activator in the cell onCellAttach()
Function CheckForRefill()
	if (lastFilled + DaysTillRefill) < utility.GetCurrentGameTime() || lastFilled == 0.0
		RefillItems()
	endif
EndFunction

Struct SaleItemSortData
	ObjectReference saleItemObject
	int saleItemValue
EndStruct

;This tries to fill all empty item alias
Function FillItems()
	BusyRefilling = true
	lastFilled = utility.GetCurrentGameTime() 
	Debug.Trace(Self + ": FillItems")
	int i = 0
	int Count = SaleItems.length
	While i < count
		if SaleItems[i].myRefAlias.GetReference() == NONE
			Debug.Trace(Self + ": Attempting to fill item " + i)
			int PrizeRange = (math.Floor(SaleItems[i].Number / 10) as int)
			ObjectReference GeneratedPrize = GeneratePrize(PrizeRange)

			if utility.Randomfloat(0, 100.0) > ChanceForLegendary
				if GeneratedPrize
					SaleItems[i].myRefAlias.ForceRefTo(GeneratedPrize)
				Endif
			;If we are within the chance for a legendary, spawn one now!
			else
				GeneratedPrize = SpawnLegendaryItem()
				SaleItems[i].myRefAlias.ForceRefTo(GeneratedPrize)
				SaleItems[i].CanBeRefilled = false
			EndIf

		endif
		i += 1
	EndWhile

	;Sort the aliases.
	; - Collect the objects and their values.
	SaleItemSortData[] presortData = new SaleItemSortData[0]
	i = 0
	While i < count
		SaleItemSortData current = new SaleItemSortData
		current.saleItemObject = SaleItems[i].myRefAlias.GetReference()
		current.saleItemValue = current.saleItemObject.GetGoldValue()
		presortData.Add(current)
		i = i + 1
	EndWhile

	; - Insertion sort.
	;Debug.Trace("DATA IN:")
	;i = 0
	;While (i < presortData.Length)
	;	Debug.Trace("-- " + presortData[i].saleItemObject + ": " + presortData[i].saleItemValue)
	;	i = i + 1
	;EndWhile

	SaleItemSortData[] sortedData = new SaleItemSortData[0]
	i = 0
	While i < count
		SaleItemSortData current = presortData[i]
		bool insertDone = False
		int j = 0
		While ((!insertDone) && (j < sortedData.Length))
			if (current.saleItemValue < sortedData[j].saleItemValue)
				sortedData.Insert(current, j)
				insertDone = True
			Endif
			j = j + 1
		EndWhile
		if (!insertDone)
			sortedData.Add(current)
		Endif
		i = i + 1
	EndWhile

	;Debug.Trace("DATA OUT:")
	;i = 0
	;While (i < sortedData.Length)
	;	Debug.Trace("-- " + sortedData[i].saleItemObject + ": " + sortedData[i].saleItemValue)
	;	i = i + 1
	;EndWhile

	; - Repopulate SaleItems with the sorted data.
	i = 0
	While i < count
		SaleItems[i].myRefAlias.ForceRefTo(sortedData[i].saleItemObject)
		i = i + 1
	EndWhile
	BusyRefilling = false
EndFunction

Struct PrizeRange
	GlobalVariable LowGlobal
	GlobalVariable HighGlobal
	LeveledItem MyLvlItem
EndStruct

Group PrizeSpawnProperties
	PrizeRange[] Property PrizeRanges Auto Const mandatory

	ObjectReference Property DLC04NukacadeContainerRef Auto Const Mandatory
	ObjectReference Property DLC04NukacadeSpawneObjectMarkerRef Auto Const Mandatory

	Sound Property DLC04OBJArcadePrizeDispenserDispense Auto Const Mandatory
	Sound Property DLC04OBJArcadePrizeDispenserDispenseMechanicalB Auto Const Mandatory

	Float Property ChanceForLegendary = 5.0 Auto Const
EndGroup
;This function will generate a prize that has a value within the prize range
objectReference Function GeneratePrize(int PrizeRange)
	Debug.Trace(Self + ": GeneratePrize at range " + PrizeRange)
	int TicketMult = DLC04NukacadePriceMult.GetValue() as int
	int PriceLow = 0
	Int PriceHigh = PrizeRanges[PrizeRange].HighGlobal.GetValue() as int

	ObjectReference GeneratedPrize
	bool FoundPrize
	int i = 0
	int maxAttempts = 20
	
	;This gives X attempts to create a prize within the High and Low ranges
	;For this prize range
	While !FoundPrize && i < maxAttempts
		GeneratedPrize = DLC04NukacadeSpawneObjectMarkerRef.PlaceAtMe(PrizeRanges[PrizeRange].MyLvlItem, abDeleteWhenAble = false)
		;GeneratedPrize = DLC04NukacadeContainerRef.AddItem(PrizeRanges[PrizeRange].MyLvlItem)
		Debug.Trace(Self + ": GeneratedPrize = " + GeneratedPrize)
		Int GeneratedPrizeValue = (GeneratedPrize.GetGoldValue() * TicketMult)
		Debug.Trace(Self + ": GeneratedPrizeValue = " + GeneratedPrizeValue)
		if GeneratedPrizeValue > PriceLow && GeneratedPrizeValue <= PriceHigh
			FoundPrize = true
			DLC04NukacadeContainerRef.AddItem(GeneratedPrize)
			Return GeneratedPrize
		else
			Debug.Trace(Self + ": Out of Prize Value range > " + PrizeRange)
			GeneratedPrize.Delete()
		endif
		i += 1
	EndWhile
	
	Debug.Trace(Self + ": GeneratedPrize could not find an item in " + maxAttempts + " attempts.")
	Return NONE
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				Legendary Prize Spawning
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Group AutoFill
LegendaryItemQuestScript Property LegendaryItemQuest const auto
{AUTOFILL}
ActorValue Property SpawnedLegendaryItem const auto
endGroup

Struct LegendaryItemData
	LeveledItem LItemList
	FormList ModsToChooseFrom 
	FormList DisallowedMods
EndStruct

Group ItemData
	LegendaryItemData[] property LegendaryItemTypes Auto Const
EndGroup


objectReference Function SpawnLegendaryItem()
	Debug.Trace(self + ": Spawning Legendary Item")
	DLC04NukacadeContainerRef.SetValue(SpawnedLegendaryItem, 0)
	int count = (LegendaryItemTypes.Length - 1)
	int n = utility.RandomInt(0, count)
	objectReference spawnedLegendary = LegendaryItemQuest.GenerateLegendaryItem(DLC04NukacadeContainerRef, LegendaryItemTypes[n].LItemList, LegendaryItemTypes[n].ModsToChooseFrom , LegendaryItemTypes[n].DisallowedMods)
	Debug.Trace(self + ": spawnedLegendary == " + spawnedLegendary)
    Return spawnedLegendary
EndFunction
