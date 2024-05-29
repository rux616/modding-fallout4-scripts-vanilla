Scriptname DLC01:WorkshopRobotScript extends workshopnpcscript
{version of WorkshopNPCScript for created robots}

LocationRefType property SettlementRobot auto const mandatory

;For removing them from the "ActiveCompanions" alias in followers quest which was keeping them persistent forever
RefCollectionAlias Property ActiveCompanions const auto Mandatory

; returns true if successfully added to workshop
bool Function CreatedByWorkbench()
	; get workshop from workbench
	WorkshopScript workshopRef

	; didn't get it from workbench - try to get it from my current location
	Location myLocation = GetEditorLocation()
	if myLocation
		workshopRef = WorkshopParent.GetWorkshopFromLocation(myLocation)
	endif

	; flag me to not be able to be renamed (can be removed if workbench code handles this)
	SetValue(WorkshopParent.WorkshopProhibitRename, 1)
	
	; if we have a workshop, add me to it
	if workshopRef
		WorkshopParent.AddActorToWorkshopPUBLIC(self, workshopRef)
		return true
	else
		return false
	endif
endfunction

Function SetLocRefType(Location akLoc, LocationRefType akRefType)
	if akRefType == WorkshopParent.Boss
		; always make this SettlementRobot loc type instead of Boss
		parent.SetLocRefType(akLoc, SettlementRobot)
	else
		parent.SetLocRefType(akLoc, akRefType)
	endif
endfunction

Event OnDeath(Actor akKiller)
	ActiveCompanions.RemoveRef(self)
EndEvent