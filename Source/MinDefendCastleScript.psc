Scriptname MinDefendCastleScript extends MinRecruitQuestScript Conditional

int attackTimerID = 1

float startingDamageRating

;ReferenceAlias Property Workshop const auto

function Startup()
	Debug.Trace(self + " MinDefendCastleScript Startup")
	; register for update events
	RegisterForCustomEvent(WorkshopParent, "WorkshopDailyUpdate")
	; register for follower events
	RegisterForCustomEvent(FollowersScript.GetScript(), "CompanionChange")
	;;;;;;;;;;;;;;;
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

	; clear globals
	MinCastleSafetyCount.SetValue(0)
	MinCastleSafetyPercent.SetValue(0)
	MinCastleAttackersDeadPercent.SetValue(0)
	UpdateCurrentInstanceGlobal(MinCastleSafetyCount)
	UpdateCurrentInstanceGlobal(MinCastleSafetyPercent)
	UpdateCurrentInstanceGlobal(MinCastleAttackersDeadPercent)

	; store current damage rating
	startingDamageRating =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingDamageCurrent)
	; check if current location is target (when this quest starts from a location change event)
	CheckLocation(Game.GetPlayer().GetCurrentLocation())

	; if Ronnie Shaw is alive, make her the spokesman
	Actor ronnie = RonnieShaw.GetActorRef()
	if ronnie && ronnie.IsDead() == false
		MinutemanSpokesman.ForceRefTo(ronnie)
	endif
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
		; shutdown quest when player leaves Castle
		if akOldLoc == ActualLocation.GetLocation() && GetStageDone(480)
			SetStage(500)
		endif
	endif
EndEvent

; if we've entered the target location, set stage
function CheckLocation(Location akNewLoc)
	if !GetStageDone(70) && akNewLoc == ActualLocation.GetLocation()
    	; player has arrived in settlement location - start attack timer
    	debug.trace(self + " start attack timer")
   		SetStage(70)
   		; tell the Attacker script to start the timer for when they attack 
   		;		whether you are ready or not
   		((self as Quest) as MinDefendCastleAttackScript).startTimeOutAttack()
		; if Preston isn't already here, move him to attack marker
		actor preston = PrestonGarvey.GetActorRef()
		if preston.Is3DLoaded() == false
			preston.MoveTo(MinDefendCastlePrestonMoveMarker)
		endif
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

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent

; call when starting objective to check for starting safety rating
function InitializeObjective()
	float safety =  WorkshopParent.GetRating(Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingSafety)
	debug.trace(self + "InitializeObjective: safety = " + safety)
	WorkshopParent.UpdateWorkshopObjectivesSpecific(self, workshopObjectives, Workshop.GetRef() as WorkshopScript)		
endFunction

GlobalVariable Property MinCastleSafetyCount Auto Const
GlobalVariable Property MinCastleSafetyPercent Auto Const
GlobalVariable Property MinCastleAttackersDeadPercent Auto Const

LocationAlias Property ActualLocation Auto Const

ReferenceAlias Property RonnieShaw auto const
ReferenceAlias Property MinutemanSpokesman auto const
ReferenceAlias Property MinutemanBackupSpokesman auto const

ObjectReference Property MinDefendCastlePrestonMoveMarker auto const

WorkshopParentScript:WorkshopObjective[] Property WorkshopObjectives const auto
{ array of objective data }

function FinishQuest(bool bSuccess, bool bGiveReward = true)
	; clear forced attacker if any
	MinDefendCastleAttackScript attackScript = (self as Quest) as MinDefendCastleAttackScript
	attackScript.MinCastleAttacker.setValue(-1)
endFunction