Scriptname DLC06:PipboyCrateScript extends workshopobjectscript

float resetHarvestDays = 1.0

; override parent function
function HandleWorkshopReset()
	; since workshop locations don't reset, do it manually
	float harvestTime = GetValue(WorkshopParent.WorkshopFloraHarvestTime)
	if CanProduceForWorkshop() && utility.GetCurrentGameTime() > (harvestTime + resetHarvestDays)
		SetHarvested(false)
	endif
endFunction

function HandleCreation(bool bNewlyBuilt = true)
	Parent.HandleCreation(bNewlyBuilt)
	if bNewlyBuilt
		SetHarvested(false)
	endif
endFunction

