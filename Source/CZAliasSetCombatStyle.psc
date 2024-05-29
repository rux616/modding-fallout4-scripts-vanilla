Scriptname CZAliasSetCombatStyle extends ReferenceAlias

Group ScriptData
Combatstyle Property CombatstyleToSet const auto
int Property QuestStageToSetCombatStyle const auto
int Property QuestStageToClearCombatStyle const auto
EndGroup

Event OnInit()
	RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet") 

EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	debug.trace(self + "OnStageSet:" + auiStageID)

	if auiStageID == QuestStageToSetCombatStyle
		GetActorReference().setCombatStyle(CombatstyleToSet)

	elseif auiStageID == QuestStageToClearCombatStyle
		GetActorReference().setCombatStyle(None)
		
	endif


EndEvent

