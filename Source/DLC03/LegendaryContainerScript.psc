Scriptname DLC03:LegendaryContainerScript extends ObjectReference

Group AutoFill
LegendaryItemQuestScript Property LegendaryItemQuest const auto
{AUTOFILL}
endGroup

Group ItemData

int Property ItemsToCreate = 1 Auto Const
{How many legendary items to put into this container?}

LeveledItem Property LeveledListOfItemsToSpawn Auto Const
{Default: none = standard list.
If set, use this leveled list as the source of the items.}

FormList Property ListOfSpecificModsToChooseFrom Auto Const
{Default: none = standard mod allowance.
If set, try to install one these specific mods}

FormList Property ListOfSpecificModsToDisallow Auto Const
{Default: none = standard mod allowance.
If set, try not to install one these specific mods}

EndGroup

int itemsSpawned

Event OnLoad()
	while (itemsSpawned < itemsToCreate)
		LegendaryItemQuest.GenerateLegendaryItem(self, LeveledListOfItemsToSpawn, ListOfSpecificModsToChooseFrom , ListOfSpecificModsToDisallow)

		self.setvalue(LegendaryItemQuest.SpawnedLegendaryItem, 0)
		itemsSpawned += 1
	endwhile
EndEvent

