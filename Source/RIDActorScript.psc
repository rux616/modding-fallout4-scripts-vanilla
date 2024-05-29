Scriptname RIDActorScript extends ReferenceAlias Conditional

Quest Property RadioInstituteDynamic Auto Const


Event OnCombatStateChanged(Actor Target, Int aeCombatState)

RadioInstituteDynamicQuestScript QuestScript = RadioInstituteDynamic as RadioInstituteDynamicQuestScript

;update quest variables to trigger alert/combat scenes

	if aeCombatState == 0
		QuestScript.GroupAlerted=0
		QuestScript.PlayerDetected=0
	elseif aeCombatState == 2
		QuestScript.GroupAlerted=ZoneNumber
		QuestScript.PlayerDetected=1
		QuestScript.MasterAlert=1
	


	elseif aeCombatState == 1
		QuestScript.InCombat=1
		QuestScript.GroupInCombat=ZoneNumber
		QuestScript.LastPlayerZone=1
		QuestScript.MasterAlert=1
		QuestScript.PlayerDetected=1
	

	endif

EndEvent
Int Property ZoneNumber Auto Conditional


Event OnDeath(Actor Killer)

RadioInstituteDynamicQuestScript QuestScript = RadioInstituteDynamic as RadioInstituteDynamicQuestScript

;on actor death, reduce Zone Count by one
;if actor is last to die, reset combat variables
	if ZoneNumber == 1
		QuestScript.ZoneOneCount -= 1
		if QuestScript.ZoneOneCount == 0
			QuestScript.InCombat = 0
			QuestScript.GroupInCombat = 0
			QuestScript.PlayerDetected = 0
		endif
	
	elseif ZoneNumber == 2
		QuestScript.ZoneTwoCount -= 1
		if QuestScript.ZoneTwoCount == 0
			QuestScript.InCombat = 0
			QuestScript.GroupInCombat = 0
			QuestScript.PlayerDetected = 0
		endif

	endif

EndEvent