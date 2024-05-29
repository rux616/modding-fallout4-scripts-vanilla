Scriptname CA_QuestStage_Bump extends Quest

Struct QuestStageBumpDatum

int QuestStage
{Stage that will send event.
*** IMPORTANT ***
The QuestStage MUST be unique to this script array.
If you need one stage to send multiple events, make new stages one for each event, and have that other stage set those in it's quest fragement.
}

int EventID
{*** IMPORTANT ****
The EventID for this event MUST be *unique* to this script array.
If you have more than one quest stage you want to send the same event:
Make a new quest stage to send the event, and have those other quest stages set that one in their quest fragment.

Corresponds to EventID in the appropriate call in CompanionAffinityEventQuestScript
}

endStruct

QuestStageBumpDatum[] Property QuestStageBumpData const auto


Event OnInit()
    ;make sure there are only unique EventIDs

    ;--- WE SHOULD CONSIDER GETTING AN OnEditorInit() function for warnings like these that represent data errors.

    int[] EventIDs = new int[0]

    int i = 0
    while (i < QuestStageBumpData.length)
    	if EventIDs.Find(QuestStageBumpData[i].EventID)
			Game.Warning(self + "THERE MORE THAN ONE QuestStageBumpDatum with this EventID: " + QuestStageBumpData[i].EventID)    	
    	endif
		EventIDs.add(QuestStageBumpData[i].EventID)

    	i += 1
    endwhile

    int[] QuestStages = new int[0]
    while (i < QuestStageBumpData.length)
    	if QuestStages.Find(QuestStageBumpData[i].QuestStage)
			Game.Warning(self + "THERE MORE THAN ONE QuestStageBumpDatum with this QuestStage: " + QuestStageBumpData[i].QuestStage)    	
    	endif
		QuestStages.add(QuestStageBumpData[i].QuestStage)

    	i += 1
    endwhile

EndEvent

Event OnStageSet(int auiStageID, int auiItemID)
    int foundIndex =  QuestStageBumpData.findStruct("QuestStage", auiStageID)
    QuestStageBumpDatum FoundDatum

    if foundIndex >= 0
    	FoundDatum = QuestStageBumpData[foundIndex]
   	endif

    if FoundDatum && auiItemID == 0
    	CompanionAffinityEventQuestScript.GetScript().SendAffinityBumpEvent(self, FoundDatum.EventID)
    endif
EndEvent