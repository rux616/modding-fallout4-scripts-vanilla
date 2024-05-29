Scriptname RIDStartTriggerScript extends ObjectReference Conditional

Quest Property RadioInstituteDynamic Auto Const


Event OnTriggerEnter(ObjectReference TriggerRef)

	if TriggerRef == Game.GetPlayer()
		RadioInstituteDynamicQuestSCript QuestScript = RadioInstituteDynamic as RadioInstituteDynamicQuestScript
		QuestScript.MasterStart = 1
	
	endif

endEvent