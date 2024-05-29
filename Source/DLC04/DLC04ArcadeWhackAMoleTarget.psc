scriptName DLC04:DLC04ArcadeWhackAMoleTarget extends DLC04:DLC04ArcadeScoringObject
{Whack a mole target, this controls what it does when it is active and not active}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Group LocalProperties
	String Property HitAnim = "Shake01" Auto Const 
	String Property MoveAnim1 = "Play01" Auto Const 
	String Property MoveAnim2 = "Play02" Auto Const 
	String Property MoveDoneEvent = "Done" Auto Const 

	Sound Property FailureSound Auto Const

	string Property AnimSpeedVar = "fSpeed" Auto Const
	float Property StartingSpeedVar = 0.7 Auto Const
	{0.5 is half speed, 2 is double, etc}
	float Property IncreasePerPop = 0.01 Auto Const
EndGroup

Function LocalScoreReaction()
	Debug.Trace(self + ": LocalScoreReaction")
	PlayAnimation(HitAnim)
EndFunction

Function DoLocalScoredByHitStart()
	Debug.Trace(self + ": DoLocalScoredByHitStart")
	RegisterForAnimationEvent(self, MoveDoneEvent)
	if 1 == utility.RandomInt(0, 1)
		PlayAnimation(MoveAnim1)
	else
		PlayAnimation(MoveAnim2)
	endif
EndFunction


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == MoveDoneEvent
		if GetState() != "Busy"
			if FailureSound
				FailureSound.Play(self)
			endif
			(GetLinkedRef() as DLC04:DLC04ArcadeWhackAMole).MoleGotAway()
			IncreaseSpeedVar(IncreasePerPop)
		endif
		GoToState("Busy")
	Endif	
EndEvent

float currentSpeedVar
Function SetStartingSpeedVar()
	currentSpeedVar = StartingSpeedVar
	SetAnimationVariableFloat(AnimSpeedVar, StartingSpeedVar)
EndFunction

Function IncreaseSpeedVar(float increaseToSpeed)
	currentSpeedVar += increaseToSpeed
	SetAnimationVariableFloat(AnimSpeedVar, currentSpeedVar)
EndFunction