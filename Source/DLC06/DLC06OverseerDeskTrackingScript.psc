Scriptname DLC06:DLC06OverseerDeskTrackingScript extends Quest
{use for quests need to react to the Overseer's Desk being built or not}

ReferenceAlias Property Alias_Workshop Auto Const mandatory

DLC06:DLC06WorkshopParent Property DLC06WorkshopParent Auto Const mandatory

GlobalVariable Property DLC06OverseerDeskBuilt Auto Const Mandatory

group objectiveData 
	int property objectiveStage = -1 auto const
	int property objectiveIndex = -1 auto const
endGroup 

function RegisterForWorkshopEvents(bool bRegister = true)
	debug.trace(self + " RegisterForWorkshopEvents=" + bRegister)
	CheckForOverseerDesk()

	WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript

	; register for build events from workshop
	if bRegister
		RegisterForCustomEvent(DLC06WorkshopParent, "DLC06OverseerDeskEvent")
	else
		UnregisterForCustomEvent(DLC06WorkshopParent, "DLC06OverseerDeskEvent")
	endif
endFunction

Event DLC06:DLC06WorkshopParent.DLC06OverseerDeskEvent(DLC06:DLC06WorkshopParent akSender, Var[] akArgs)
	debug.trace(self + " DLC06OverseerDeskEvent")
	CheckForOverseerDesk()
endEvent

function CheckForOverseerDesk()
	debug.trace(self + "CheckForOverseerDesk")
	; check if desk is currently built or not
	if DLC06OverseerDeskBuilt.GetValue() > 0
		if objectiveStage > 0
			SetStage(objectiveStage)
		endif
		if IsObjectiveDisplayed(objectiveIndex) 
			SetObjectiveCompleted(objectiveIndex)
		endif
	else 
		; rollback objective
		SetObjectiveCompleted(objectiveIndex, false)
		if IsObjectiveDisplayed(objectiveIndex) == false 
			SetObjectiveDisplayed(objectiveIndex, true, true)
		endif
	endif
endFunction