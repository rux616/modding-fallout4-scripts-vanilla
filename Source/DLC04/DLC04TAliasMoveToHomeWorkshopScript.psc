Scriptname DLC04:DLC04TAliasMoveToHomeWorkshopScript extends ReferenceAlias Const

WorkshopParentScript Property WorkshopParent auto const
{Workshop parent quest, used to check Shank's current workshop info}

float Property fShankTeleportTimerCheck = 10.0 auto const
{Length of time between checks to try and get Shank to his outpost}

;Local Vars
int iShankTeleportTimeID = 1 const

Event OnTimer(int aiTimerID)
	;If the timer's expired, try and send this NPC home again
	if iShankTeleportTimeID == aiTimerID
		Actor actRef = self.GetActorRef()
		TryToSendHome(ActRef)

		WorkshopNPCScript workshopNPC = actRef as WorkshopNPCScript
		int workshopID = workshopNPC.GetWorkshopID()
		workshopScript workshopRef = workshopNPC.WorkshopParent.GetWorkshop(workshopID)

		;Wait a couple seconds and see if the NPCs in the right spot. If not, start the timer again.
		Utility.Wait(5.0)
		if workshopRef.myLocation != actRef.GetCurrentLocation()
			StartTimer(fShankTeleportTimerCheck, iShankTeleportTimeID)
		endif
	endif
EndEvent

Event OnUnload()
	Actor actRef = self.GetActorRef()

	WorkshopNPCScript workshopNPC = actRef as WorkshopNPCScript
	int workshopID = workshopNPC.GetWorkshopID()

	debug.trace(self + "DLC04 Shank Teleport Script: Checking our man's current workshop ID: " + workshopID)
	if workshopID > -1
		workshopScript workshopRef = workshopNPC.WorkshopParent.GetWorkshop(workshopID)
		debug.trace(self + "DLC04 Shank Teleport Script: Workshop ID assigned. Checking his home shop: " + workshopRef)

		;If the NPCs not at the location he needs to be, start the timer to try and get him there
		if workshopRef.myLocation != actRef.GetCurrentLocation()
			if workshopRef.myLocation.IsLoaded() == false && workshopNPC.Is3DLoaded() == false
            	TryToSendHome(self.GetActorRef())
            else
				StartTimer(fShankTeleportTimerCheck, iShankTeleportTimeID)
            endif
		endif
	endif
EndEvent


function TryToSendHome(actor theActor)
    WorkshopNPCScript workshopNPC = theActor as WorkshopNPCScript
    if workshopNPC
        int workshopID = workshopNPC.GetWorkshopID()
        if workshopID > -1
            workshopScript workshopRef = workshopNPC.WorkshopParent.GetWorkshop(workshopID)
            if workshopRef
                debug.trace(self + " try to move " + workshopNPC + " home to " + workshopRef + ". Workshop ref location is loaded: " + workshopRef.myLocation.IsLoaded() + ". WorkshopNPC is3DLoaded: " + workshopNPC.Is3DLoaded())
                ; move home immediately if both me and my home are unloaded
                if workshopRef.myLocation.IsLoaded() == false && workshopNPC.Is3DLoaded() == false
                    workshopNPC.MoveTo(workshopRef.GetLinkedRef(WorkshopParent.WorkshopLinkCenter))
                    debug.trace(self + " Moved " + workshopNPC + " to " + workshopRef.GetLinkedRef(WorkshopParent.WorkshopLinkCenter) + " at location: " + WorkshopNPC.GetCurrentLocation())
                endif
            endif
        endif
    endif
endFunction