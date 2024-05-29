Scriptname WorkshopChildScript extends Actor const

ActorValue Property WorkshopActorFlee auto const

Event OnLoad()
	if IsDisabled() == false
		CheckForCleared()
	endif
EndEvent

Event OnUnload()
	; if fleeing, disable
	if GetValue(WorkshopActorFlee) > 0
		Disable()
	endif
EndEvent

Event Location.OnLocationCleared(Location akSender)
	CheckForCleared()
endEvent

function CheckForCleared()
	debug.trace(self + " CheckForCleared")
	; get my workshop
	WorkshopNPCScript workshopNPC = (self as Actor) as WorkshopNPCScript
	if workshopNPC
		WorkshopScript myWorkshop = GetLinkedRef(workshopNPC.WorkshopParent.WorkshopItemKeyword) as WorkshopScript
		if myWorkshop
			Location myWorkshopLocation = myWorkshop.GetEditorLocation()
			if myWorkshopLocation
				if myWorkshopLocation.IsCleared()
					; remove me from workshop and put me in flee mode
					UnregisterForRemoteEvent(myWorkshopLocation, "OnLocationCleared")
					workshopNPC.WorkshopParent.UnassignActor(workshopNPC, true)
					; cleared, make sure I'm in flee mode
					SetValue(WorkshopActorFlee, 1.0)
					EvaluatePackage()
				else
					RegisterForRemoteEvent(myWorkshopLocation, "OnLocationCleared")
				endif
			endif
		endif
	endif
endFunction
