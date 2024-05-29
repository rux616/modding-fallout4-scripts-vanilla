Scriptname DLC04:WorkshopRaiderPickMeUpScript extends workshopobjectscript

float chemsResetHarvestDays = 1.0

; override parent function
function HandleWorkshopReset()
	; since workshop locations don't reset, do it manually
	float harvestTime = GetValue(WorkshopParent.WorkshopFloraHarvestTime)
	if IsPowered() && utility.GetCurrentGameTime() > (harvestTime + chemsResetHarvestDays)
		SetHarvested(false)
	endif
endFunction
