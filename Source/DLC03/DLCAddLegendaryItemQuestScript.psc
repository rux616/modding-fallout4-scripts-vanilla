Scriptname DLC03:DLCAddLegendaryItemQuestScript extends Quest
{Adds items to the main LegendaryItemQuest's script's array}

LegendaryItemQuestScript Property LegendaryItemQuest const auto mandatory
{Autofill}

LegendaryItemQuestScript:LegendaryModRule[] Property LegendaryModRules auto
{After the weapon is spawned, check these rules, then add an appropriate legendary mod}

LegendaryItemQuestScript:AmmoDatum[] Property AmmoData const auto
{Used to add the correct leveled list of ammo that the spawned item uses}

Event OnQuestInit()
	AddItemsToBaseGameArray()
EndEvent

;so we can call it from console during development when adding items
Function AddItemsToBaseGameArray()
	
	int i = 0
	int len = LegendaryModRules.length
	
	;loop through our array
	while (i < len)
		
		;add our current item to the main game quest's array
		LegendaryItemQuest.LegendaryModRules.add(LegendaryModRules[i])

		i += 1
	endwhile


	i = 0
	len = AmmoData.length
	
	;loop through our array
	while (i < len)
		
		;add our current item to the main game quest's array
		LegendaryItemQuest.AmmoData.add(AmmoData[i])

		i += 1
	endwhile

EndFunction

Function TraceArrays() debugonly

	debug.trace(self + "TraceArrays()")

	int i = 0
	int len = LegendaryItemQuest.LegendaryModRules.length
	while (i < len)
		
		debug.trace(LegendaryItemQuest.LegendaryModRules[i].LegendaryObjectMod)

		i += 1
	endwhile

	i = 0
	len = LegendaryItemQuest.AmmoData.length
	while (i < len)
		
		debug.trace(LegendaryItemQuest.AmmoData[i].AmmoType)

		i += 1
	endwhile

EndFunction