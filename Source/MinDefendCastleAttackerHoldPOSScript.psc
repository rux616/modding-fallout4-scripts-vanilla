Scriptname MinDefendCastleAttackerHoldPOSScript extends ObjectReference
{MinDefendCast}

ActorValue Property MinDefendCastleAttackerPhase Auto Const
Float Property TimerMin = 7.0 Auto Const
Float Property TimerMax = 15.0 Auto Const

int TriggerActorNumber

Struct ActorTimer
	int IDNumber
	ObjectReference myRef
EndStruct

ActorTimer[] Property ActorTimers Auto Hidden

Event OnTriggerEnter(ObjectReference AkTriggerRef)
	if ActorTimers == NONE
		Debug.Trace(Self + ": Trigger was entered and ActorTimers was NONE")
		ActorTimers = new ActorTimer[0]
	endif

	Debug.Trace(self + ": OnTriggerEnter by >> " + AkTriggerRef)

	AkTriggerRef.SetValue(MinDefendCastleAttackerPhase, 1)

	;Create a new ActorTimer, this will get added
	ActorTimer myTimer = new ActorTimer
	myTimer.IDNumber = TriggerActorNumber
	TriggerActorNumber += 1 				;Increment TriggerActor Number
	myTimer.myRef = AkTriggerRef
	;Add the actor timer to the array
	ActorTimers.Add(myTimer)
	;Start a timer with the timerID we have given it
	StartTimer(utility.RandomFloat(TimerMin, TimerMax), myTimer.IDNumber)
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					On Timer Section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnTimer(int aiTimerID)
	Debug.Trace(self + ": onTimer by >> " + aiTimerID)
	;Check the array for a timer with the ID number that we started
	int myIndex = ActorTimers.FindStruct("IDNumber", aiTimerID)

	;Get the stored actor at this actor timer, then change the attackerphase Actor Value
	ObjectReference myActor = ActorTimers[myIndex].myRef
	Debug.Trace(self + ": Actor to modify is >> " + myActor)
	if myActor.GetValue(MinDefendCastleAttackerPhase) < 2
		myActor.SetValue(MinDefendCastleAttackerPhase, 2)
	Endif

	;Remove this index since we are now done with it
	ActorTimers.Remove(myIndex)
EndEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					Reset
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function ResetAttackerNumber()
	Debug.Trace(self + ": ResetAttackerNumber")
	TriggerActorNumber = 0
	ActorTimers = new ActorTimer[0]
EndFunction