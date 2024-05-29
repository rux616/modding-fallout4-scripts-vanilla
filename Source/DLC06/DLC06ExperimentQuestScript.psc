Scriptname DLC06:DLC06ExperimentQuestScript extends Quest conditional
{use for quests need to handle a workshop object being built}

ReferenceAlias Property Alias_Workshop Auto Const mandatory

WorkshopParentScript Property WorkshopParent Auto Const mandatory

Keyword Property ExperimentObjectKeyword auto const mandatory
{ keyword that's on the experimental object }

ReferenceAlias Property Alias_ExperimentObject Auto Const
{ alias to put object in when built, if empty }

ReferenceAlias Property Alias_ExperimentActor Auto Const
{ alias for experimental subject - i.e. Clem }

group objectiveData 
	int property objectiveBuiltStage = -1 auto const
	{ stage to set when experimental object is built }
	int property objectiveBuiltIndex = -1 auto const
	{ objective to complete/display when object is built/destroyed }

	bool property bRequiresPower = true auto const 
	{ if TRUE, objectiveBuiltIndex will be rolled back when object has no power }

	bool property bRequiresCanProduce = true auto const 
	{ if TRUE, objective requires CanProduceForWorkshop = true to complete }
endGroup 

bool bExperimentObjectReady = false conditional ; will be TRUE when experimental object is ready for use

function RegisterForWorkshopEvents(bool bRegister = true)
	debug.trace(self + " RegisterForWorkshopEvents=" + bRegister)
	; register for build events from workshop
	if bRegister
		RegisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopObjectPlaced")
		RegisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopObjectDestroyed")
	else
		UnregisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopObjectPlaced")
		UnregisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopObjectDestroyed")
		; if we still have an object, clear power events
		ObjectReference experimentalObject = Alias_ExperimentObject.GetRef()
		if experimentalObject	
			UnregisterForRemoteEvent(experimentalObject, "OnPowerOn")
			UnregisterForRemoteEvent(experimentalObject, "OnPowerOff")
		endif
	endif
endFunction

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSource, ObjectReference akActionRef)
	debug.trace(self + " OnWorkshopObjectDestroyed received")
	HandleObjectBuilt(akSource as WorkshopScript, akActionRef, false)
EndEvent

Event ObjectReference.OnWorkshopObjectPlaced(ObjectReference akSource, ObjectReference akActionRef)
	debug.trace(self + " OnWorkshopObjectPlaced received")
	HandleObjectBuilt(akSource as WorkshopScript, akActionRef, true)
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSource, ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn received")
	HandleObjectPowerChange(akSource, true)
EndEvent

Event ObjectReference.OnPowerOff(ObjectReference akSource)
	debug.trace(self + " OnPowerOff received")
	HandleObjectPowerChange(akSource, false)
EndEvent

function HandleObjectPowerChange(ObjectReference akObject, bool bPowerOn)
	if akObject == Alias_ExperimentObject.GetRef()
		if bPowerOn
			CompleteExperiment(true)
		else 
			; rollback objective
			CompleteExperiment(false)
		endif 
	endif
endFunction 

function HandleObjectBuilt(WorkshopScript workshopRef, ObjectReference akObject, bool bObjectBuilt)
	if workshopRef == Alias_Workshop.GetRef() && akObject.HasKeyword(ExperimentObjectKeyword)
		debug.trace(self + " HandleObjectBuilt " + workshopRef + " " + akObject + " current Alias_ExperimentObject=" + Alias_ExperimentObject.GetRef())
		; wait for recalc to finish
		workshopRef.WaitForWorkshopResourceRecalc()

		WorkshopObjectScript newObject = akObject as WorkshopObjectScript
		; check for current resource value
		if bObjectBuilt
			if Alias_ExperimentObject && Alias_ExperimentObject.GetRef() == NONE 
				AssignExperimentalObject(newObject)
			endif
			if bRequiresCanProduce == false || newObject.CanProduceForWorkshop() 
				CompleteExperiment(true)
			endif
		elseif Alias_ExperimentObject.GetRef() == akObject 
			; this was our experiment object - need to find another one or clear alias
			debug.trace(self + "    experimental object destroyed - try to find replacement")

			; find any other matching objects
			ObjectReference[] otherObjects = akObject.FindAllReferencesWithKeyword(ExperimentObjectKeyword, 99999.0)
			debug.trace(self + "    other objects found: " + otherObjects)

			bool bFound = false
			int i = 0
			while i < otherObjects.Length && bFound == false
				ObjectReference theObject = otherObjects[i]
				if theObject.IsDeleted() == false && theObject.IsDisabled() == false && theObject.GetLinkedRef(WorkshopParent.WorkshopItemKeyword)
					debug.trace(self + "    found new experimental object " + theObject)
					; use this
					bFound = true 
					AssignExperimentalObject(theObject as WorkshopObjectScript)
					if theObject.CanProduceForWorkshop() == false 
						; rollback objective since new object can't produce
						CompleteExperiment(false)
					endif
				endif
				i += 1
			endWhile
			if bFound == false
				Alias_ExperimentObject.Clear()
				; rollback objective since we didn't find a replacement object
				CompleteExperiment(false)
			endif
		endif
	endif
endFunction

function AssignExperimentalObject(WorkshopObjectScript experimentalObject)
	debug.trace(self + " AssignExperimentalObject " + experimentalObject)
	if experimentalObject
		if bRequiresPower
			ObjectReference oldObject = Alias_ExperimentObject.GetRef()
			if oldObject
				UnregisterForRemoteEvent(experimentalObject, "OnPowerOn")
				UnregisterForRemoteEvent(experimentalObject, "OnPowerOff")
			endif 
		endif 

		Alias_ExperimentObject.ForceRefTo(experimentalObject)
		if bRequiresPower
			RegisterForRemoteEvent(experimentalObject, "OnPowerOn")
			RegisterForRemoteEvent(experimentalObject, "OnPowerOff")
		endif

		WorkshopNPCScript experimentActor = Alias_ExperimentActor.GetRef() as WorkshopNPCScript
		if experimentalObject && experimentalObject.RequiresActor() && experimentActor
			debug.trace(self + "    assigning " + experimentActor + " to " + experimentalObject)
			; assign actor to the object
			WorkshopParent.AssignActorToObjectPUBLIC(experimentActor, experimentalObject)		
		endif
	endif
endFunction

function CompleteExperiment(bool bComplete = true)
	bExperimentObjectReady = bComplete
	if bComplete 
		if objectiveBuiltStage > 0
			SetStage(objectiveBuiltStage)
		endif
		SetObjectiveDisplayed(objectiveBuiltIndex)
		SetObjectiveCompleted(objectiveBuiltIndex)
	else
		SetObjectiveCompleted(objectiveBuiltIndex, false)
		if IsObjectiveDisplayed(objectiveBuiltIndex) == false 
			SetObjectiveDisplayed(objectiveBuiltIndex, true, true)
		endif
	endif
endFunction 

