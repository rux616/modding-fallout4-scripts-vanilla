Scriptname QALegendaryContainerScript extends ObjectReference Const

LegendaryItemQuestScript Property LegendaryItemQuest const auto
{AUTOFILL}

int Property ItemsToCreate = 100 const auto


Event OnLoad()

	int i = 0
	while (i < ItemsToCreate)
		LegendaryItemQuest.GenerateLegendaryItem(self)
		self.setvalue(LegendaryItemQuest.SpawnedLegendaryItem, 0)
		i += 1
	endwhile

    


EndEvent