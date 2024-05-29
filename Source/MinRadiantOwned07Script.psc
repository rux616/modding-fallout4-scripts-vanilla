Scriptname MinRadiantOwned07Script extends MinRecruitQuestScript conditional

int property ResourceIndex = -1 auto conditional
{ the resource index we are looking for - set in StartupCustom }

float property StartingResourceValue auto
{ starting resource value - so we know if we've gone up }

float property NeededResourceValue auto
{ amount that is needed (above starting value) }

bool property FoundDungeon auto conditional
{ set to true if the Dungeon alias is filled }

LocationAlias property Dungeon auto const

ReferenceAlias property Generator auto const
{ one generator that we will specifically destroy }

RefCollectionAlias Property AllGenerators auto const
{ all other generators in the workshop - stop them from auto-repairing during this quest }

Component property RequiredComponent auto const
{ the component that is missing from the workshop }

int property RequiredComponentCount = 2 auto
{ for generator, this is 2 gears }

FormList Property MinRadiantOwned07ComponentList auto const
{ form list for inventory event filter }

int property DungeonObjectiveStage = 150 auto const
{ stage to give dungeon objective }

int property DungeonObjectiveStageComplete = 160 auto const
{ for completing dungeon objective }

; called by parent Startup function
function StartupCustom()
	debug.trace(self + " StartupCustom")
	
	WorkshopScript workshopRef = Workshop.GetRef() as WorkshopScript

	; set resource: power
	ResourceIndex = WorkshopParent.WorkshopRatingPower
	StartingResourceValue =  WorkshopParent.GetRating(workshopRef, ResourceIndex)
	debug.trace(self + " starting: PowerGenerated=" + StartingResourceValue)

	; get the generator
	WorkshopObjectScript generatorRef = Generator.GetRef() as WorkshopObjectScript
	; what's the generator's rating?
	NeededResourceValue =  workshopRef.GetBaseValue(WorkshopParent.WorkshopRatingValues[ResourceIndex])
	; now damage it
	generatorRef.ModifyResourceDamage(WorkshopParent.WorkshopRatingValues[ResourceIndex], 99)
	; flag the generator not to auto repair
	generatorRef.bAllowAutoRepair = false
	SetGeneratorsAutoRepair(false)
	
	; recalc to update resource values
	bool didRecalc = workshopRef.RecalculateWorkshopResources()
	StartingResourceValue =  WorkshopParent.GetRating(workshopRef, ResourceIndex)
	debug.trace(self + " after damage and recalculate (" + didRecalc + "): PowerGenerated=" + StartingResourceValue)

	; set starting globals
	WorkshopObjectives[0].currentCount.SetValue(StartingResourceValue)
	WorkshopObjectives[0].maxCount.SetValue(StartingResourceValue + NeededResourceValue)
	WorkshopObjectives[0].percentComplete.SetValue(0)
	; there's always only 1 objective here:
	WorkshopObjectives[0].ratingIndex = ResourceIndex

	; did we find a dungeon?
	FoundDungeon = (Dungeon.GetLocation() != NONE)

	RegisterForWorkshopEvents()
endFunction

; helper function to set flag on all generators
function SetGeneratorsAutoRepair(bool bAllowAutoRepair)
	WorkshopObjectScript generatorRef = Generator.GetRef() as WorkshopObjectScript
	; flag the generator not to auto repair
	generatorRef.bAllowAutoRepair = false

	; all other generators:
	int i = 0
	while i < AllGenerators.GetCount()
		WorkshopObjectScript theGenerator = AllGenerators.GetAt(i) as WorkshopObjectScript
		if theGenerator
			theGenerator.bAllowAutoRepair = bAllowAutoRepair
		endif
		i += 1
	endWhile

endFunction

function DailyUpdateCustom()
	debug.trace(self + " DailyUpdateCustom")
endFunction

; called when main build objective is set - decide if to give dungeon objective or not
function CheckForDungeonObjective()
	; first, does the player or workshop already have the required component?
	if CheckForRequiredComponent() == false && FoundDungeon == true
		; give dungeon objective
		SetStage(150)
		; register for events for player/workshop
		; add inventory event filter and register for events
		AddInventoryEventFilter(MinRadiantOwned07ComponentList) ; see if this works...
		RegisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
		RegisterForRemoteEvent(Workshop.GetRef(), "OnItemAdded")
	endif
endFunction

; helper function - returns true if player or workshop has required component count
bool function CheckForRequiredComponent()
	int currentCount = Game.GetPlayer().GetComponentCount(RequiredComponent) + Workshop.GetRef().GetComponentCount(RequiredComponent)
	debug.trace(self + " CheckForRequiredComponent: currentCount=" + currentCount)
	return (currentCount >= RequiredComponentCount)
endFunction

; receive item added events from player
Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akSender == Game.GetPlayer() || akSender == Workshop.GetRef()
		debug.trace(self + " OnItemAdded to " + akSender + ": " + akBaseItem)
		; complete objective if currently displayed
		if GetStageDone(DungeonObjectiveStage) && GetStageDone(DungeonObjectiveStageComplete) == false && CheckForRequiredComponent()
			setStage(DungeonObjectiveStageComplete)
			; unregister for inventory events
			UnregisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
			UnregisterForRemoteEvent(Workshop.GetRef(), "OnItemAdded")
		EndIf
	endif
EndEvent

function RegisterForWorkshopEvents(bool bRegister = true)
	; register for build events from workshop
	WorkshopParent.RegisterForWorkshopEvents(self, bRegister)
endFunction

Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectBuilt")
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectDestroyed")
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectRepaired(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectRepaired")
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestructionStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectDestructionStageChanged")
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectPowerStageChanged")
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopObjectMoved(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectMoved")
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopPlayerOwnershipChanged")
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
	float diff = currentValue - WorkshopObjectives[0].currentCount.GetValue()
	debug.trace(self + "InitializeObjective: diff = " + diff)
	if diff > 0
		ModObjectiveGlobal(diff, WorkshopObjectives[0].percentComplete)
		ModObjectiveGlobal(currentValue, WorkshopObjectives[0].currentCount, WorkshopObjectives[0].index, WorkshopObjectives[0].maxCount.GetValue())		
	endif
	CheckForDungeonObjective()
endFunction


WorkshopParentScript:WorkshopObjective[] Property WorkshopObjectives const auto
{ array of objective data }
