Scriptname DLC04:DLC04DrinkingBuddyScript extends DialogueDrinkingBuddyScript

BrewingRecipe[] Property NewBrewingRecipes Auto Mandatory

DialogueDrinkingBuddyScript Property DialogueDrinkingBuddy Auto Const Mandatory

Function AddNewRecipes()
	int count = NewBrewingRecipes.Length
	int i = 0
	Debug.Trace(Self + ": NewBrewingRecipes Count >> " + Count)
	while i < Count
		DialogueDrinkingBuddy.BrewingRecipes.Add(NewBrewingRecipes[i])
		i += 1
	EndWhile

EndFunction