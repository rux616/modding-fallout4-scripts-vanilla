Scriptname DialogueDrinkingBuddyScript extends Quest Conditional

ReferenceAlias Property DrinkingBuddy Auto Const

bool Property WaitingForHome = false Auto Conditional

bool property IsInDeliveryMode = false Auto Conditional

bool property CanTellRufus = false Auto Conditional

bool property WaitOutsideRexford = true Auto Conditional

bool property livesInRexford = false Auto Conditional

bool hasShownTutorial
Message Property DrinkingBuddyTutorialMessage Auto Const

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Joke Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GlobalVariable Property DrinkingBuddyJokesToldSinceReset Auto Const
GlobalVariable Property DrinkingBuddyJokesDaysTillReset Auto Const
GlobalVariable Property DrinkingBuddyJokesNextResetDay Auto Const

Function ToldAJoke()
	int JokesTold = DrinkingBuddyJokesToldSinceReset.GetValueInt() + 1
	DrinkingBuddyJokesToldSinceReset.SetValue(JokesTold)
EndFunction


Function CheckForJokeReset()
	float currentDay = utility.GetCurrentGameTime()
	if currentDay > DrinkingBuddyJokesNextResetDay.GetValue()
		DrinkingBuddyJokesToldSinceReset.SetValue(0)
		DrinkingBuddyJokesNextResetDay.SetValue(currentDay + DrinkingBuddyJokesDaysTillReset.GetValue())
	endif
EndFunction



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Brewing Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GlobalVariable Property DrinkingBuddyBrewCycleDays Auto Const
GlobalVariable Property DrinkingBuddyBrewLastBrewDay Auto Const
GlobalVariable Property DrinkingBuddyBrewNextCoolingDay Auto Const
GlobalVariable Property DrinkingBuddyBrewMaxCapacity Auto Const
GlobalVariable Property DrinkingBuddyBrewFull Auto Const

BrewingRecipe[] Property BrewingRecipes Auto

int BrewIndex = 0


;This is where we check if we can dispense more drinks
Function CheckBeerForDispensing()
	Debug.Trace(self + " CheckBeerForDispensing")
	float currentDay = utility.GetCurrentGameTime()
	;if we are past the cooling time (in game days)
	if DrinkingBuddyBrewNextCoolingDay.GetValue() < currentDay
		CheckForCooling()
	endif

	;;;;;;;;;;;;Here we dispense drinks if possible
	int CurrentDrinks = CheckCurrentCapacity()
	int MaxDrinkCapacity = DrinkingBuddyBrewMaxCapacity.GetValueInt()
	;if we are below the max drink capacity (we don't care about other inventory)
	if CurrentDrinks < MaxDrinkCapacity
		;if the current day is greater than the last brew day + the brew cycle
		if currentDay > (DrinkingBuddyBrewLastBrewDay.GetValue() + DrinkingBuddyBrewCycleDays.GetValue())
			;Figure out how many brew cycles to run
			float fBrewCyclesCompleted = (currentDay - (DrinkingBuddyBrewLastBrewDay.GetValue())/DrinkingBuddyBrewCycleDays.GetValue())
			Debug.Trace(self + ": float fBrewCyclesCompleted >> " + fBrewCyclesCompleted)
			int iBrewCyclesCompleted = fBrewCyclesCompleted as int
			Debug.Trace(self + ": float iBrewCyclesCompleted >> " + iBrewCyclesCompleted)
			;Run the specified number of brew cycles
			RunBrewCycle(iBrewCyclesCompleted, CurrentDrinks, MaxDrinkCapacity)
			;set the last day we brewed to today
			DrinkingBuddyBrewLastBrewDay.SetValue(currentDay)
		endif
	endif
	;Here we recheck and set the global to say if the brewmax is full
	if CurrentDrinks < MaxDrinkCapacity
		DrinkingBuddyBrewFull.SetValue(0)
	else
		DrinkingBuddyBrewFull.SetValue(1)
	endif
EndFunction

Function RunBrewCycle(int cycles, int currentDrinks, int maxCapacity)
	int i = 0
	int RecipesTotal = BrewingRecipes.Length
	Actor Buddy = DrinkingBuddy.GetActorRef()
	while currentDrinks < maxCapacity && i < cycles
		;cycle through the list, unless we have reached the end. In that case, reset to 0
		if BrewIndex < (RecipesTotal - 1)
			BrewIndex += 1
		else
			BrewIndex = 0
		endif

		if BrewingRecipes[BrewIndex].hasReceivedThisRecipe
			if BrewingRecipes[BrewIndex].ColdDrinkVariant != NONE
				Buddy.AddItem(BrewingRecipes[BrewIndex].ColdDrinkVariant, 1, abSilent = True)
			else
				Buddy.AddItem(BrewingRecipes[BrewIndex].WarmDrinkVariant, 1, abSilent = True)
			endif
			currentDrinks += 1
			i += 1
		endif
	endWhile
EndFunction

;here we check for cold variants
Function CheckForCooling()
	Debug.Trace(self + " CheckForCooling")
	int i = 0
	int count = BrewingRecipes.Length
	Actor Buddy = DrinkingBuddy.GetActorRef()
	int itemCount
	while i < count
		itemCount = Buddy.GetItemCount(BrewingRecipes[i].WarmDrinkVariant)
		if itemCount > 0 && BrewingRecipes[i].ColdDrinkVariant != NONE
			Buddy.RemoveItem(BrewingRecipes[i].WarmDrinkVariant, itemCount, abSilent = True)
			Buddy.AddItem(BrewingRecipes[i].ColdDrinkVariant, itemCount, abSilent = True)
		endif
		i += 1
	endWhile
	;Set the time to cool drinks to the current time + half a day
	DrinkingBuddyBrewNextCoolingDay.SetValue(utility.GetCurrentGameTime() + 0.5)
EndFunction

;This is called when the player gives buddy new recipes
Function GiveRecipes()
	int i = 0
	int count = BrewingRecipes.Length
	Actor PlayerRef = Game.GetPlayer()
	int itemCount
	while i < count
		if BrewingRecipes[i].RecipeHolotape != none
			itemCount = PlayerRef.GetItemCount(BrewingRecipes[i].RecipeHolotape)
			if itemCount > 0
				PlayerRef.RemoveItem(BrewingRecipes[i].RecipeHolotape, itemCount)
				BrewingRecipes[i].hasReceivedThisRecipe = true
			endif
		endif
		i += 1
	endWhile
EndFunction

;This passes back how many drinks Buddy currently it's in his inventory
int Function CheckCurrentCapacity()
	Debug.Trace(self + " CheckCurrentCapacity")
	int TotalPossessed = 0
	int i = 0
	int count = BrewingRecipes.Length
	Actor Buddy = DrinkingBuddy.GetActorRef()
	int itemCount
	while i < count
		itemCount = Buddy.GetItemCount(BrewingRecipes[i].ColdDrinkVariant)
		itemCount += Buddy.GetItemCount(BrewingRecipes[i].WarmDrinkVariant)
		TotalPossessed += itemCount
		i += 1
	endWhile
	Debug.Trace(self + ": Has a total of >> " + TotalPossessed + " << drinks it can dispense")
	return TotalPossessed
EndFunction

Function ShowTutorialMessage()
	if !hasShownTutorial
		DrinkingBuddyTutorialMessage.Show()
		hasShownTutorial = true
	endif
endFunction

Function InitBrewing()
	float currentDay = utility.GetCurrentGameTime()
	DrinkingBuddyBrewLastBrewDay.SetValue(currentDay)
EndFunction

;Struct holds all the info about what it can brew
Struct BrewingRecipe
	holotape RecipeHolotape
	potion WarmDrinkVariant
	potion ColdDrinkVariant
	bool hasReceivedThisRecipe
EndStruct

