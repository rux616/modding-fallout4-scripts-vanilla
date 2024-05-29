scriptname DLC04:DLC04ArcadeScoringObject extends objectReference
;
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Scoring States
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;This is the state for objects that are scored on hit
State ScoredByHit
	Event OnBeginState(string asOldState)
		Debug.Trace(self + ": OnBeginState ScoredByHit")
		isCurrentlyActive = true
		if (Is3DLoaded())
			RegisterForHitEvent(self) ; get a single hit event, no filter
		endIf
		DoLocalScoredByHitStart()
	endEvent

	event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		Debug.Trace(self + ": OnHit")
		if isGameRunning
			GoToState("Busy")
			debug.Trace(self + ": received onHit:: akAggressor = " + akAggressor)
			debug.Trace(self + ": received onHit:: akSource = " + akSource)
			debug.Trace(self + ": received onHit:: akProjectile = " + akProjectile)
			ScoreEvent(akAggressor)
		endif
	endEvent

EndState

State ScoredByEnter
	Event OnBeginState(string asOldState)
		isCurrentlyActive = true
	endEvent

	event OnTriggerEnter(objectReference triggerRef)
		if IgnoreZ || triggerRef.GetPositionZ() > self.GetPositionZ()
			GoToState("Busy")
			ScoreEvent(triggerRef)
		Endif
	endEvent
Endstate

State OfflineEnter
	Event OnBeginState(string asOldState)
		isCurrentlyActive = false
	endEvent

	event OnTriggerEnter(objectReference triggerRef)
		DoOfflineOnEnter(triggerRef)
	endEvent
EndState

State Busy
	Event OnBeginState(string asOldState)
		isCurrentlyActive = false
	endEvent
endState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Startup and Scoring
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Auto State StartUpState
EndState

Function CheckStartUp()
	Debug.Trace(self + ": OnCellAttach")
	Debug.Trace(self + "::: GetState == " + GetState())
	;if GetState() == "StartUpState"
		;Debug.Trace(self + ": StartUpState")
		if HandleOffStateEnterEvents
			GoToState("OfflineEnter")
		elseif ImmediateStartUp
			GoToState("ScoredByHit")
		endif
	;endif
EndFunction


Function SetScoreNumber(int newScoreNumber)
	ScoreNumber = newScoreNumber
EndFunction

bool Function getIsCurrentlyActive()
	return isCurrentlyActive
EndFunction

Function SetGameRunning(bool ShouldGameBeRunning)
	Debug.Trace(self + ": ShouldGameBeRunning >> " + ShouldGameBeRunning)
	isGameRunning = ShouldGameBeRunning
	if ScoresOnEnter && !SingleScoringObject
		if isGameRunning
			GoToState("ScoredByEnter")
		else
			GoToState("OfflineEnter")
		endif
	Endif
EndFunction

Function SetCanBeScored()
	Debug.Trace(self + ": SetCanBeScored")
	if isGameRunning
		if ScoresOnEnter
			Debug.Trace(self + ": GoToState >> ScoredByEnter")
			GoToState("ScoredByEnter")
		else
			Debug.Trace(self + ": GoToState >> ScoredByHit")
			GoToState("ScoredByHit")
		endif
	else
		Debug.Trace(self + ": isGameRunning == " + isGameRunning)
	endif
EndFunction

Event onUnload()
	UnregisterForAllHitEvents()
endEvent
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Scoring Event - Talks to the game controller
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function ScoreEvent(ObjectReference akScoringRef)

	LocalScoreReaction()
	if ScoredSound
		ScoredSound.play(self)
	endif
	(getLinkedRef() as DLC04:DLC04ArcadeController).ScoreEvent(ScoreNumber, akScoringRef)
	if isGameRunning && ReturnToHitStateAfterHit
		GoToState("ScoredByHit")
	endif
	if isGameRunning && ReturnToEnterStateAfterEnter
		GoToState("ScoredByEnter")
	endif
endFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Function LocalScoreReaction()
EndFunction

Function DoLocalScoredByHitStart()
EndFunction

Function DoOfflineOnEnter(ObjectReference triggerRef)
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Properties & Vars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Group GeneralBehaviorProperties
	bool Property HandleOffStateEnterEvents = false Auto Const
	bool property ImmediateStartUp = false Auto Const
	bool Property ReturnToHitStateAfterHit = false Auto Const
	bool Property ReturnToEnterStateAfterEnter = false auto const
	bool Property SingleScoringObject = false Auto Const 
	bool Property ScoresOnEnter = false auto const 
	bool Property isGameRunning auto Hidden
	bool property IgnoreZ = true auto const
	{Whether to check for Z of the triggerRef being higher than that of the trigger}
EndGroup

int property ScoreNumber = 0 auto
{This may be set on the base object, or it may be set by the game when placed}

bool isCurrentlyActive = false


Group Sounds CollapsedOnRef
	sound Property ScoredSound auto Const
EndGroup



Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(self + ": Has Received OnWorkshopObjectDestroyed !!!!!")
	Delete()
EndEvent

Event ObjectReference.OnReset(ObjectReference akSender)
	Debug.Trace(self + ": Has Received OnReset !!!!!")
	Delete()
EndEvent

Event OnCellDetach()
	isCurrentlyActive = false
EndEvent