Scriptname MinRadiantOwned04Script extends MinRecruitQuestScript conditional

int attackTimerID = 1
float attackTimerGameHours = 0.5

float startingDamageRating

; called by parent Startup function
function StartupCustom()
	debug.trace(self + " StartupCustom")
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	; store current damage rating
	startingDamageRating =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingDamageCurrent)
	; check if current location is target (when this quest starts from a location change event)
	CheckLocation(Game.GetPlayer().GetCurrentLocation())
endFunction

function DailyUpdateCustom()
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
   		((self as Quest) as WorkshopAttackScript).StartTimerGameTime(attackTimerGameHours)
	endif
endFunction


Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	CheckForQuestFailure()
EndEvent

Event WorkshopParentScript.WorkshopObjectMoved(WorkshopParentScript akSender, Var[] akArgs)
	CheckForQuestFailure()
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	CheckForQuestFailure()
EndEvent

Event WorkshopParentScript.WorkshopObjectRepaired(WorkshopParentScript akSender, Var[] akArgs)
	CheckForQuestFailure()
EndEvent

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	CheckForQuestFailure()
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	CheckForQuestFailure()
EndEvent

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
	CheckForQuestFailure()
EndEvent

Event WorkshopParentScript.WorkshopObjectDestructionStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WorkshopObjectDestructionStageChanged")
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript

		; check for current damage level - if it exceeds threshold, quest has failed
		if workshopRef == Workshop.GetRef()
			CheckForQuestFailure()
		endif
	endif
EndEvent

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	CheckForQuestFailure()
EndEvent

function CheckForQuestFailure()
	WorkshopScript workshopRef = Workshop.GetRef() as WorkshopScript

	; wait for recalc to finish
	workshopRef.WaitForWorkshopResourceRecalc()
	
	; check for current artillery rating - if 0, quest has failed
	; OR if player doesn't own this settlement any more
	if getStageDone(310) == 0 && getStageDone(200) == 0 && getStageDone(130)
		float currentRating =  WorkshopParent.GetRating(workshopRef, WorkshopParent.WorkshopRatingArtillery)
		debug.trace(self + " CheckForQuestFailure: artillery rating" + currentRating)
		if currentRating <= 0.0 || workshopRef.OwnedByPlayer == false
			setStage(310)
		endif
	endif
endFunction


LocationAlias Property ActualLocation Auto Const

WorkshopParentScript:WorkshopObjective[] Property WorkshopObjectives const auto
{ array of objective data }

GlobalVariable Property MinRadiantOwned01SafetyCount Auto Const
GlobalVariable Property MinRadiantOwned01SafetyTotal Auto Const
GlobalVariable Property MinRadiantOwned01SafetyPercent Auto Const

