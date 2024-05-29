Scriptname BoS301Script extends WorkshopEventsQuestScript conditional

bool Property bAllObjectivesComplete = false Auto Conditional

; override parent events 
Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	debug.tracefunction()
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		UpdateObjective(1, newObject)
	endif	
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	debug.tracefunction()
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		UpdateObjective(-1, newObject)		
	endif
EndEvent

function UpdateObjective(int modValue, WorkshopObjectScript newObject)
	debug.trace("UpdateObjective " + modvalue + " " + newObject)
	if newObject && newObject.HasKeyword(BoS301ActuatorKeyword)
		; track actuators in ref collection alias
		if modValue < 0
			BoS301Actuators.RemoveRef(newObject)
		else
			BoS301Actuators.AddRef(newObject)
		endif

		setStage(110) ; at least one built
		;if theQuest.ModObjectiveGlobal(diff, theObjective.currentCount, theObjective.index, theObjective.maxCount.GetValue())
		if ModObjectiveGlobal(afModValue = modValue, aModGlobal = BoS301ActuatorsBuilt, aiObjectiveID = 100, afTargetValue = BoS301ActuatorsTotal.Value, abAllowRollbackObjective = true)
		  SetStage(120)
		endif
		; use instead of quest stage in dialogue conditions
		bAllObjectivesComplete = isObjectiveCompleted(100)
		; display/hide objective to Ingram based on if 100 is complete or not
		SetObjectiveDisplayed(120, bAllObjectivesComplete)
	endif
endFunction

function DisableActuators()
	int i = BoS301Actuators.GetCount() - 1
	while i >= 0
		; remove ref and delete
		ObjectReference theActuator = BoS301Actuators.GetAt(i)
		BoS301Actuators.RemoveRef(theActuator)
		theActuator.Disable()
		theActuator.Delete()
		i += -1
	endWhile

endFunction


GlobalVariable Property BoS301ActuatorsBuilt Auto Const

GlobalVariable Property BoS301ActuatorsTotal Auto Const

Keyword property BoS301ActuatorKeyword Auto Const

refcollectionAlias property BoS301Actuators auto const mandatory
