ScriptName DLC04:DLC04ArcadeNukaZapperRaceRocket Extends ObjectReference
{Controller for the Bottle Rockets}

int RacerNumber = 0
float mySpeedAnimVar
Group LocalProperties
	String Property MoveAnim = "Play01" auto Const
	String Property MoveDoneEvent = "Done" Auto Const
	String Property ResetAnim = "Play02" Auto Const
	String Property ResetDoneEvent = "Done" Auto Const
	String Property ForceResetAnim = "Reset" Auto Const
	String Property SpeedVar = "fSpeed01" Auto Const
	float Property StartingSpeed = 1.0 auto Const
EndGroup

Function SetRaceTargetNumber(int num)
	RacerNumber = num
endFunction

bool currentlyRacing
Function StartRace()
	currentlyRacing = true
	mySpeedAnimVar = StartingSpeed
	SetAnimationVariableFloat(SpeedVar, mySpeedAnimVar)
	RegisterForAnimationEvent(self, MoveDoneEvent)
	PlayAnimation(MoveAnim)
EndFunction

;bool forceReset
Function ReturnToStartPosition()
	currentlyRacing = false
	SetAnimationVariableFloat(SpeedVar, 1.0)
	if Is3dLoaded()
		PlayAnimationAndWait(ResetAnim, ResetDoneEvent)
	endif
		;forceReset = true
	;endif
	(GetLinkedRef() as DLC04:DLC04ArcadeNukaZapperRaceScript).FinishedReset(RacerNumber)
EndFunction

Function ModAnimVar(Float fVarChange)
	mySpeedAnimVar += fVarChange
	if mySpeedAnimVar < StartingSpeed
		mySpeedAnimVar = StartingSpeed
	endif
	SetAnimationVariableFloat(SpeedVar, mySpeedAnimVar)
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == MoveDoneEvent && currentlyRacing
		;Self.DisableNoWait()
		(GetLinkedRef() as DLC04:DLC04ArcadeNukaZapperRaceScript ).FinishedRace(RacerNumber)
		;Self.Delete()
	Endif
EndEvent



Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(self + ": Has Received OnWorkshopObjectDestroyed !!!!!")
	Delete()
EndEvent

Event ObjectReference.OnReset(ObjectReference akSender)
	Debug.Trace(self + ": Has Received OnReset !!!!!")
	Delete()
EndEvent

Event OnCellAttach()
	;if forceReset
		PlayAnimation(ForceResetAnim)
		;forceReset = false
	;Endif
endEvent