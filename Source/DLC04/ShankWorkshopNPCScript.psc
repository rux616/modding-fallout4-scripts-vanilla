Scriptname DLC04:ShankWorkshopNPCScript extends workshopnpcscript
{override assignment to allow no auto assignment}

group DLC04Properties 
	bool property bAllowAutoAssign = false auto const 
	{ pass in to AddActor functions to allow/prevent auto assignment to resources }
endGroup 

Event OnWorkshopNPCTransfer(Location akNewWorkshopLocation, Keyword akActionKW)
	;debug.trace(self + " OnWorkshopNPCTransfer " + akNewWorkshopLocation + " keyword=" + akActionKW)
	;WorkshopParent.wsTrace(self + " has been directed to transfer to the workshop at " + akNewWorkshopLocation + " with the " + akActionKW + " action")
	; what kind of transfer?
	if akActionKW == WorkshopParent.WorkshopAssignCaravan
		WorkshopParent.AssignCaravanActorPUBLIC(self, akNewWorkshopLocation)
	else
		WorkshopScript newWorkshop = WorkshopParent.GetWorkshopFromLocation(akNewWorkshopLocation)
		if newWorkshop
			if akActionKW == WorkshopParent.WorkshopAssignHome
				WorkshopParent.AddActorToWorkshopPUBLIC(self, newWorkshop)
			elseif akActionKW == WorkshopParent.WorkshopAssignHomePermanentActor
				WorkshopParent.AddPermanentActorToWorkshopPUBLIC(self, newWorkshop.GetWorkshopID(), bAllowAutoAssign)
			endif
		endif
	endif
EndEvent

