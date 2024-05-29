scriptName DLC04:DLC04ArcadeAtomicRollers extends DLC04:DLC04ArcadeController
{ball rolling type game, most of the guts are in the DLC04ArcadeController}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Game functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool Function DispenseBall()

	;/if hasInternalResource && internalResourceCount > 0
		placeAtNode("BallReturn01", internalResource)
		internalResourceCount -= 1
	endif/;
	int count = StoredBalls.length
	if count > 0
		objectReference Ball = StoredBalls[0]
		Debug.Trace(self + " Dispensing Ball > " + Ball)
		Ball.MoveToNode(self, "BallReturn01")
		StoredBalls.Remove(0)
		Ball.Enable()
		LocalHavokImpulse(Ball)
		ballsDispensed +=1
		return true
	else
		return false
	Endif
endFunction

bool StoreBallIsBusy
Function StoreBall(objectReference triggerObj)
	if StoreBallIsBusy
		while StoreBallIsBusy
			utility.Wait(0.2)
		EndWhile
	Endif
	StoreBallIsBusy = true

	debug.Trace(self + " StoreBall >> " + triggerObj)
	triggerObj.DisableNoWait()
	if StoredBalls
	Else
		debug.Trace(self + " Setting StoredBalls")
		StoredBalls = new objectReference[0]
	endif
	if StoredBalls.Find(triggerObj) < 0
		StoredBalls.add(triggerObj)
		ballsDispensed -= 1
		if ballsDispensed < 0
			ballsDispensed = 0
		endif
	Endif
	StoreBallIsBusy = false
EndFunction

Function LocalScoringFunction(objectReference triggerObj, int ScoringEventNumber)
	StoreBall(triggerObj)

	if (gameLimiterScoringEvents - 2) > eventsScored
		DispenseBall()
	endif
	debug.Notification((gameLimiterScoringEvents - eventsScored) + " balls remaining")
EndFunction

int ballsDispensed
Function LocalGameStart()
	SetTriggersActive(true)
	
	bool CantDispenseBall
	;Dispense a ball
	if DispenseBall()
	else
		CantDispenseBall = true
	endif
	;debug.Notification((gameLimiterScoringEvents - eventsScored) + " balls remaining")

	;dispense any remaing balls
	while ballsDispensed < BallsInitiallyDispensed && !CantDispenseBall
		utility.wait(1)
		if DispenseBall()
			
		else
			CantDispenseBall = true
		Endif
	endWhile
endFunction

Function LocalGameEnd()
	SetTriggersActive(false)
endFunction

Function SetTriggersActive(bool gameIsActive)
	int i = 0
	int count = myTriggers.length
	while i < count
		myTriggers[i].SetGameRunning(gameIsActive)
		i += 1
	endwhile
EndFunction

Group LocalProperties
	int property BallsInitiallyDispensed = 2 auto
	int property BallsInitiallyStored = 0 auto Const
	MiscObject Property DLC04_Nukacade_AtomicRollersBall01 Auto Const mandatory

	AttachedRef[] Property Triggers Auto Const

	;Keyword Property WorkshopItemKeyword Auto Const Mandatory
EndGroup

objectReference[] StoredBalls
DLC04:DLC04ArcadeAtomicRollersTrigger[] myTriggers

Function LocalAttachMyObjects()
	int i = 0
	int count

	;Place and link TokenSlots
	count = Triggers.length
	myTriggers = new DLC04:DLC04ArcadeAtomicRollersTrigger[0]
	while i < count
		objectReference currentObject
		currentObject = PlaceAtNode(Triggers[i].NodeName, Triggers[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
		currentObject.SetLinkedRef(self)
		(currentObject as DLC04:DLC04ArcadeAtomicRollersTrigger).SetScoreNumber(i)
		(currentObject as DLC04:DLC04ArcadeAtomicRollersTrigger).CheckStartUp()
		myTriggers.Add(currentObject as DLC04:DLC04ArcadeAtomicRollersTrigger)
		currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
		currentObject.RegisterForRemoteEvent(self, "OnReset")
		i += 1
	EndWhile

	debug.Trace(self + ": BallsInitiallyStored = " + BallsInitiallyStored)
	if BallsInitiallyStored > 0
		i = 0
		While i < BallsInitiallyStored
			debug.Trace(self + ": Adding a ball")
			StoreBall(PlaceAtMe(DLC04_Nukacade_AtomicRollersBall01, abInitiallyDisabled = true, abDeleteWhenable = false))
			i += 1
		EndWhile
	endif
EndFunction

;/
Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	Debug.Trace(self + ": OnWorkshopObjectDestroyed")
	;LocalWorkshopObjectDestroyed()
	int i = 0
	int count  = StoredBalls.length
	while i < count
		myWorkshop.AddItem(StoredBalls[i])
		i += 1
	EndWHile
	myTriggers.Clear()

	DoCleanup()
	
EndEvent
/;

Function LocalWorkshopObjectDestroyed()
	Debug.Trace(self + ": OnWorkshopObjectDestroyed")
	myTriggers.Clear()
	;Store the balls? yeah totally
	int i = 0
	int count  = StoredBalls.length
	while i < count
		;myWorkshop.AddItem(StoredBalls[i])
		StoredBalls[i].EnableNoWait()
		i += 1
	EndWHile
EndFunction


Function LocalHavokImpulse(objectReference impulseRef)
	float AngleY = getAngleZ()
	;0 should equal -1 afY
	;180 should equal 1 afy
	float afX = 0 - math.sin(AngleY)
	float afY = 0 - math.cos(AngleY)
	debug.trace(Self + ": afX == " + afX)
	debug.trace(Self + ": afY == " + afY)

	impulseRef.ApplyHavokImpulse( afX, afY, afZ = 0.0, afMagnitude = 100.0)
EndFunction
