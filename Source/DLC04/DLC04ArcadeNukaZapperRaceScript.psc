scriptName DLC04:DLC04ArcadeNukaZapperRaceScript extends DLC04:DLC04ArcadeController
{NukaZapper Race, most of the guts are in the DLC04ArcadeController}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Game functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function LocalScoringFunction(objectReference triggerObj, int ScoringEventNumber)
	MyBottles[ScoringEventNumber].ModAnimVar(speedIncreasePerHit)
EndFunction


Function LocalGameStart()
	int i = 0
	MyBottleCount = MyBottles.length
	RacersFinished = 0
	while i < MyBottleCount
		MyBottles[i].SetRaceTargetNumber(i)
		StartTimer(SpeedCheckTimer, i)
		i += 1
	EndWhile
	i = 0
	;Breaking this out of the previous loop to try to start all bottles together
	while i < MyBottleCount
		MyBottles[i].StartRace()
		RacerPositions[i] = 1
		i += 1
	Endwhile
	MyTargets[CurrentPlayerPosition].SetGameRunning(true)
	MyTargets[CurrentPlayerPosition].SetCanBeScored()
endFunction

bool WaitingForRocketReturn
Function LocalGameEnd()
	WaitingForRocketReturn = true
	;Cancel the game end override timer
	CancelTimer(9999)
	;Cancel all of the bottle speed change timers
	int i
	while i < MyBottleCount
		CancelTimer(i)
		;Start timers to multithread rocket return
		StartTimer(0.1, (i + 10))
		i += 1
	EndWhile
	While WaitingForRocketReturn && is3dLoaded()
		utility.Wait(1.0)
	EndWhile
endFunction

int MyBottleCount
Function LocalOnTimer(int aiTimerID)
	if aiTimerID >= 0 && aiTimerID <= MyBottleCount && !WaitingForRocketReturn
		;If this IS the player's bottle
		if gameRunning
			if aiTimerID == CurrentPlayerPosition
				MyBottles[aiTimerID].ModAnimVar(SpeedDecrement)
			else
				MyBottles[aiTimerID].ModAnimVar(utility.RandomFloat(EnemyRacerSpeedDifMin, EnemyRacerSpeedDifMax))
			endif
			StartTimer(SpeedCheckTimer, aiTimerID)
		endif
	;Rocket Return timers, done this way to multithread their return
	elseif aiTimerID >= 10 && aiTimerID <= (MyBottleCount + 10)
		int BottleNumber = aiTimerID - 10
		MyBottles[BottleNumber].ReturnToStartPosition()
	Endif

EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Properties & Vars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AttachedRef[] Property Targets Auto Const
AttachedRef[] Property Bottles Auto Const

DLC04:DLC04ArcadeScoringObject[] MyTargets
DLC04:DLC04ArcadeNukaZapperRaceRocket[] MyBottles
int[] RacerPositions
Function LocalAttachMyObjects()
	int i = 0
	int count

	;Place and link TokenSlots
	count = Targets.length
	MyTargets = new DLC04:DLC04ArcadeScoringObject[0]
	RacerPositions = new int[count]
	while i < count
		objectReference currentObject
		currentObject = PlaceAtNode(Targets[i].NodeName, Targets[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
		currentObject.SetLinkedRef(self)
		(currentObject as DLC04:DLC04ArcadeScoringObject).SetScoreNumber(i)
		MyTargets.Add(currentObject as DLC04:DLC04ArcadeScoringObject)
		currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
		currentObject.RegisterForRemoteEvent(self, "OnReset")
		i += 1
	EndWhile

	i = 0
	count = Bottles.length
	MyBottles = new DLC04:DLC04ArcadeNukaZapperRaceRocket[0]
	while i < count
		objectReference currentObject
		currentObject = PlaceAtNode(Bottles[i].NodeName, Bottles[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
		currentObject.SetLinkedRef(self)
		(currentObject as DLC04:DLC04ArcadeNukaZapperRaceRocket).SetRaceTargetNumber(i)
		MyBottles.Add(currentObject as DLC04:DLC04ArcadeNukaZapperRaceRocket)
		currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
		currentObject.RegisterForRemoteEvent(self, "OnReset")
		i += 1
	EndWhile

EndFunction

int RacersFinished
Sound[] Property FinishingSounds Auto Const
Function FinishedRace(int RacerNumber)
	CancelTimer(RacerNumber)
	if RacerNumber == CurrentPlayerPosition
		MyTargets[CurrentPlayerPosition].SetGameRunning(false)
		if RacersFinished == 0 	;If the player is the first finisher
			ScoreEvent(10, self)
		endif
		if FinishingSounds[RacersFinished]
			FinishingSounds[RacersFinished].Play(self)
		Endif
	endif
	RacersFinished += 1

	RacerPositions[RacerNumber] = 2

	;if we reached here, all racers are done, so end the game
	if RacersFinished >= 6
		timeLimiterExpired = true
	endif
EndFunction

;Fix whatever gets messed up from being detached while the game is running
Function DoLocalDetachedCleanup()
EndFunction

Function FinishedReset(int RacerNumber)
	RacerPositions[RacerNumber] = 0
	int i = 0
	bool RacerResetIsDone
	while i < MyBottleCount && RacerResetIsDone
		;Check if all racers are resetting
		if RacerPositions[i] == 0
			RacerResetIsDone = true
		else
			;if a racer is not done, droo out of the check
			RacerResetIsDone = false
			return
		Endif
		i += 1
	EndWhile
	;if all are done reseting, we are fully reset
	WaitingForRocketReturn = false
EndFunction


Group LocalProperties
	float Property speedIncreasePerHit = 0.05 auto const
	float property SpeedDecrement = -0.05 Auto const
	float property SpeedCheckTimer = 0.5 auto const

	float property EnemyRacerSpeedDifMin = -0.1 auto const
	float property EnemyRacerSpeedDifMax = 0.1 auto const
EndGroup