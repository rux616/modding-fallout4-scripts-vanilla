Scriptname WorkshopRE01Script extends MinRecruitQuestScript Conditional

int stealIntervalDays = 7

int Property stealAmount = 10 const auto

function DailyUpdateCustom()
	if dailyUpdateCount >= stealIntervalDays
		; reset counter
		dailyUpdateCount = 0
		WorkshopScript workshopRef = Workshop.GetRef() as WorkshopScript
		ObjectReference containerRef = workshopRef.GetContainer()
		if containerRef
			containerRef.RemoveItem(WorkshopParent.WorkshopConsumeFood, stealAmount)
			containerRef.RemoveItem(WorkshopParent.WorkshopConsumeWater, stealAmount)
		endif
	endif
endFunction