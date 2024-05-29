Scriptname Min01Script extends WorkshopEventsQuestScript Conditional

bool initialized = false

bool bAllObjectivesComplete = false Conditional
;WorkshopEventsQuestScript myWorkshopEvents

; called once by startup stage
function InitializeQuest()
	if initialized
		return
	endif

	;myWorkshopEvents = (self as Quest) as WorkshopEventsQuestScript
	
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(Alias_Preston.GetActorRef(), "OnLocationChange")
endFunction

function SetNewTravelStage(int newStage)
	if GetStageDone(100) == false
		Min01TravelProgress.SetValue(newStage)
		; timestamp 
		Min01TravelPlayerLastTimestamp.SetValue(utility.GetCurrentGameTime() + 0.5)
		debug.trace(self + " SetNewTravelStage: current time=" + utility.GetCurrentGameTime() + ", timestamp=" + Min01TravelPlayerLastTimestamp.GetValue())
	endif
endFunction


Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)
	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		if GetStageDone(100) && !GetStageDone(200) && akNewLoc == SanctuaryHillsLocation
	    	; player has arrived in Sanctuary after Preston
	    	debug.trace(self + " setstage 200")
	   		SetStage(200)
		endif
	elseif akSender == Alias_Preston.GetActorRef()
		if GetStageDone(100) == false && akNewLoc == SanctuaryHillsLocation
			setStage(100)
		endif
	endif
EndEvent

; call when starting beds objective to check for beds already made
function InitializeBedsObjective()
	float beds = GetBedsRating()
	debug.trace(self + " InitializeBedsObjective: starting beds=" + beds)
	if beds > 0
		WorkshopParent.UpdateWorkshopObjectivesSpecific(self, WorkshopObjectives, Alias_Workshop.GetRef() as WorkshopScript)
		; check if everything is complete already
		HandleWorkshopEvent()
	endif
endFunction

; call when starting water objective to check for water already made
function InitializeWaterObjective()
	float water = GetWaterRating()
	debug.trace(self + " InitializeWaterObjective: starting water=" + water)
	if water > 0
		WorkshopParent.UpdateWorkshopObjectivesSpecific(self, WorkshopObjectives, Alias_Workshop.GetRef() as WorkshopScript)
		; check if everything is complete already
		HandleWorkshopEvent()
	endif
endFunction

; call when starting food objective to check for food already made
function InitializeFoodObjective()
	float food = GetFoodRating()
	debug.trace(self + " InitializeFoodObjective: starting food=" + food)
	if food > 0
		WorkshopParent.UpdateWorkshopObjectivesSpecific(self, WorkshopObjectives, Alias_Workshop.GetRef() as WorkshopScript)
		; check if everything is complete already
		HandleWorkshopEvent()
	endif
endFunction

; call when starting food objective to check for food already made
function InitializeSafetyObjective()
	float safety = GetSafetyRating()
	debug.trace(self + " InitializeSafetyObjective: starting safety=" + safety)
	if safety > 0
		WorkshopParent.UpdateWorkshopObjectivesSpecific(self, WorkshopObjectives, Alias_Workshop.GetRef() as WorkshopScript)
		; check if everything is complete already
		HandleWorkshopEvent()
	endif
endFunction

function HandleWorkshopEvent()
	WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
	
	; wait for recalc to finish
	workshopRef.WaitForWorkshopResourceRecalc()

	; if all objectives are complete, then set completion variable
	bool allComplete = true

	int i = 0
	while (i < WorkshopObjectives.Length) && allComplete
		WorkshopParentScript:WorkshopObjective theObjective = WorkshopObjectives[i]
		if IsObjectiveCompleted(theObjective.index) == false
			allComplete = false
		endif
		i += 1
	endWhile
	bAllObjectivesComplete = allComplete
endFunction


float function GetBedsRating()
	return WorkshopParent.GetRating(Alias_Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingBeds)
endFunction

float function GetPowerRating()
	return WorkshopParent.GetRating(Alias_Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingPower)
endFunction

float function GetWaterRating()
	return WorkshopParent.GetRating(Alias_Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingWater)
endFunction

float function GetFoodRating()
	return WorkshopParent.GetRating(Alias_Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingFood)
endFunction

float function GetSafetyRating()
	return WorkshopParent.GetRating(Alias_Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingSafety)
endFunction

ReferenceAlias Property Alias_Preston Auto Const

;ReferenceAlias Property Alias_Workshop Auto Const

Location Property SanctuaryHillsLocation Auto Const

;WorkshopParentScript Property WorkshopParent Auto Const

GlobalVariable Property Min01BedCount Auto Const
GlobalVariable Property Min01BedTotal Auto Const
GlobalVariable Property Min01BedPercent Auto Const

GlobalVariable Property Min01WaterCount Auto Const
GlobalVariable Property Min01WaterTotal Auto Const
GlobalVariable Property Min01WaterPercent Auto Const

GlobalVariable Property Min01FoodCount Auto Const
GlobalVariable Property Min01FoodTotal Auto Const
GlobalVariable Property Min01FoodPercent Auto Const

GlobalVariable Property Min01TravelProgress Auto Const
{ tracks Preston's progress to advance travel scene from Concord to Sanctuary }

GlobalVariable Property Min01TravelPlayerLastTimestamp Auto Const
{ timestamp from last time player was nearby when NPC hit a travel trigger - how long has it been since player was "nearby"}
