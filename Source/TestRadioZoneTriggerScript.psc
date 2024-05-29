Scriptname TestRadioZoneTriggerScript extends ObjectReference Conditional

Int Property ZoneNumber Auto Conditional Const


Event OnTriggerEnter(ObjectReference ActionRef)



	if ActionRef == Game.GetPlayer()
		(RadioInstituteDynamic as RadioInstituteDynamicQuestScript).LastPlayerZone = (RadioInstituteDynamic as RadioInstituteDynamicQuestScript).PlayerZone
		(RadioInstituteDynamic as RadioInstituteDynamicQuestScript).PlayerZone = ZoneNumber
	endif

EndEvent
Quest Property RadioInstituteDynamic Auto Conditional Const
