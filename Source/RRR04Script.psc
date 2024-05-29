Scriptname RRR04Script extends WorkshopEventsQuestScript conditional

int attackTimerID = 1

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
   		; The player arrives at the workshop location 
   		SetStage(70)
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

function HandleWorkshopPlayerOwnershipChanged(bool bPlayerOwned)
	; If the player owns the workshop, then advance the quest
	if ( bPlayerOwned )
		SetStage(200)
	endif
endFunction

; call when starting objective to check for starting safety rating
function InitializeObjective()
	float safety =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingSafety)
	debug.trace(self + "InitializeObjective: safety = " + safety)
	if safety > 0
		ModObjectiveGlobal(safety, pRRR04SafetyPercent)
		ModObjectiveGlobal(safety, pRRR04SafetyCount, 200, pRRR04SafetyTotal.GetValue())		
	endif
endFunction

ReferenceAlias Property Workshop const auto
;WorkshopParentScript:WorkshopObjective[] Property WorkshopObjectives const auto
{ array of objective data }

GlobalVariable Property pRRR04SafetyCount Auto Const
GlobalVariable Property pRRR04SafetyTotal Auto Const
GlobalVariable Property pRRR04SafetyPercent Auto Const

LocationAlias Property ActualLocation Auto Const
;WorkshopParentScript Property WorkshopParent const auto

MQ00Script property MQ00 auto const
bool initialized = false

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	Debug.Trace("RRR04Script Intialized")

	initialized = true
endFunction

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)

	Debug.Trace("Received kickout event: " + kickoutFactionNumber)

	if ( kickoutFactionNumber == 3 )     ; 3 is the Railroad
		SetStage(9000)                   ; Fail the quest
	endif

EndEvent