Scriptname DLC03:WorkshopRadiantOwnedDefendScript extends DLC03:WorkshopRadiantOwnedScript
{ based on MinRadiantOwned01Script - variant for DLC03 settlement defense quests }

float startingDamageRating

float property AttackDelayGameHours = 1.0 auto const

function StartupCustom()
	debug.trace(self + " StartupCustom")
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	; store current damage rating
	startingDamageRating =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingDamageCurrent)
	; check if current location is target (when this quest starts from a location change event)
	CheckLocation(Game.GetPlayer().GetCurrentLocation())

	; clear globals
	if SafetyCount
		SafetyCount.SetValue(0.0)
		UpdateCurrentInstanceGlobal(SafetyCount)
	endif
	if SafetyPercent
		SafetyPercent.SetValue(0.0)
		UpdateCurrentInstanceGlobal(SafetyPercent)
	endif
endFunction

function RegisterForWorkshopEvents(bool bRegister = true)
	; register for build events from workshop
	WorkshopParent.RegisterForWorkshopEvents(self, bRegister)
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)
	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		CheckLocation(akNewLoc)
	endif
EndEvent

; if we've entered the target location, set stage
function CheckLocation(Location akNewLoc)
	if !GetStageDone(70) && akNewLoc == ActualLocation.GetLocation()
    	; player has arrived in settlement location - start attack timer
    	debug.trace(self + " start attack timer")
   		SetStage(70)
   		((self as Quest) as WorkshopAttackScript).StartTimerGameTime(AttackDelayGameHours)
	endif
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
	debug.trace(self + "WorkshopObjectDestructionStageChanged")
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript

		; check for current damage level - if it exceeds threshold, quest has failed
		if workshopRef == Workshop.GetRef() && getStageDone(310) == 0 && getStageDone(200) == 0 && getStageDone(130)

			float currentDamageRating =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingDamageCurrent)
			debug.trace(self + " destruction event: currentDamageRating" + currentDamageRating)
			if currentDamageRating >= 99.0 || currentDamageRating >= (startingDamageRating + FailureDamageIncrease)
				setStage(310)
			endif
		endif
	endif
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
		setStage(310) ; failure state
	endif
endFunction

Event WorkshopParentScript.WorkshopEnterMenu(WorkshopParentScript akSender, Var[] akArgs)
	; to avoid error on registering
EndEvent

; call when starting objective to check for starting safety rating
function InitializeObjective()
	; clear globals - failsafe
	SafetyCount.SetValue(0.0)
	SafetyPercent.SetValue(0.0)
	UpdateCurrentInstanceGlobal(SafetyCount)
	UpdateCurrentInstanceGlobal(SafetyPercent)

	float safety =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingSafety)
	debug.trace(self + "InitializeObjective: safety = " + safety)
	if safety > 0
		WorkshopParent.UpdateWorkshopObjectivesSpecific(self, workshopObjectives, Workshop.GetRef() as WorkshopScript)		
	endif
endFunction


WorkshopParentScript:WorkshopObjective[] Property WorkshopObjectives const auto
{ array of objective data }

GlobalVariable Property SafetyCount Auto Const
GlobalVariable Property SafetyTotal Auto Const
GlobalVariable Property SafetyPercent Auto Const

LocationAlias Property ActualLocation Auto Const

float Property FailureDamageIncrease = 40.0 Auto Const
{ if damage % goes up by this much (or hits 100%), quest is considered failed }