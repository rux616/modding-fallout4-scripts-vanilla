Scriptname DLC03:DLC03PostQuestTreasureChestScript extends ReferenceAlias

LegendaryItemQuestScript Property LegendaryItemQuest Auto Const Mandatory
LeveledItem Property LeveledListOfItemsToSpawn Auto Const Mandatory

Function AddLegendaryToChest()
    LegendaryItemQuest.GenerateLegendaryItem(self.GetRef(), LeveledListOfItemsToSpawn, None , None)
EndFunction