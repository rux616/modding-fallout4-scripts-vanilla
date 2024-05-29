Scriptname MinRadiantOwnedBuildResourceScript extends MinRecruitQuestScript conditional
; Used for quests that require the player to build something at a workshop location

int property ResourceIndex = -1 auto conditional
{ the resource index we are looking for - set in StartupCustom }

int property ObjectiveIndex = 0 auto
{ which objective we are going to use - depends on which resource }

float property StartingResourceValue auto
{ starting resource value - so we know if we've gone up }

float property NeededResourceValue auto
{ amount that is needed (above starting value) }

int property StartStageFood = 110 auto const
int property StartStageWater = 120 auto const
{ stages that are called when starting build objective for each resource }

; called by parent Startup function
function StartupCustom()
	debug.trace(self + " StartupCustom")
	; figure out what resource is needed
	float waterNeeded =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingMissingWater)
	float foodNeeded =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingMissingFood)

	if waterNeeded > foodNeeded
		; pick water
		TroubleName.ForceRefTo(MarkerNameWater)
		ResourceIndex = WorkshopParent.WorkshopRatingWater
		NeededResourceValue = waterNeeded
		ObjectiveIndex = 1
	else
		; pick food
		TroubleName.ForceRefTo(MarkerNameFood)
		ResourceIndex = WorkshopParent.WorkshopRatingFood
		NeededResourceValue = foodNeeded
		ObjectiveIndex = 0
	endif
	StartingResourceValue =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, ResourceIndex)
	debug.trace(self + " Needed value=" + NeededResourceValue)
	debug.trace(self + " Starting resource value=" + StartingResourceValue)
	; set starting globals
	WorkshopObjectives[ObjectiveIndex].currentCount.SetValue(StartingResourceValue)
	WorkshopObjectives[ObjectiveIndex].maxCount.SetValue(StartingResourceValue + NeededResourceValue)
	WorkshopObjectives[ObjectiveIndex].percentComplete.SetValue(0)

	RegisterForWorkshopEvents()
endFunction

function DailyUpdateCustom()
endFunction

function RegisterForWorkshopEvents(bool bRegister = true)
	; register for build events from workshop
	WorkshopParent.RegisterForWorkshopEvents(self, bRegister)
endFunction

Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectBuilt")
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectRepaired(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestructionStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectMoved(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.tracefunction()
	if (akArgs.Length > 0)
		bool bPlayerOwned = akArgs[0] as bool
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if workshopRef == (Workshop.GetRef() as WorkshopScript)
			HandleWorkshopPlayerOwnershipChanged(bPlayerOwned)
		endif
	endif
EndEvent

function HandleWorkshopPlayerOwnershipChanged(bool bPlayerOwned)
	if bPlayerOwned == false
		setStage(300) ; failure state
	endif
endFunction

; call when starting objective to initialize objective globals (in case they changed prior to getting objective)
function InitializeObjective()
	float currentValue = WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, ResourceIndex)
	float diff = currentValue - WorkshopObjectives[ObjectiveIndex].currentCount.GetValue()
	debug.trace(self + "InitializeObjective: diff = " + diff)
	if diff > 0
		ModObjectiveGlobal(diff, WorkshopObjectives[ObjectiveIndex].percentComplete)
		ModObjectiveGlobal(currentValue, WorkshopObjectives[ObjectiveIndex].currentCount, WorkshopObjectives[ObjectiveIndex].index, WorkshopObjectives[ObjectiveIndex].maxCount.GetValue())		
	endif
	if ResourceIndex == WorkshopParent.WorkshopRatingWater
		SetStage(StartStageWater)
	else
		SetStage(StartStageFood)
	endif
endFunction

function TestShowGlobals()
	debug.trace(self + " " + WorkshopObjectives[ObjectiveIndex].currentCount + "=" + WorkshopObjectives[ObjectiveIndex].currentCount.GetValue())
	debug.trace(self + " " + WorkshopObjectives[ObjectiveIndex].maxCount + "=" + WorkshopObjectives[ObjectiveIndex].maxCount.GetValue())
	debug.trace(self + " " + WorkshopObjectives[ObjectiveIndex].percentComplete + "=" + WorkshopObjectives[ObjectiveIndex].percentComplete.GetValue())
endFunction


WorkshopParentScript:WorkshopObjective[] Property WorkshopObjectives const auto
{ array of objective data }

LocationAlias Property ActualLocation Auto Const
ReferenceAlias Property TroubleName Auto Const
ObjectReference Property MarkerNameWater Auto Const
ObjectReference Property MarkerNameFood Auto Const
