scriptName DLC04:DLC04ArcadeController extends objectReference


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			 Global Game Loop functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function Gameloop()
	LocalGameStart()
	
	while eventsScored < gameLimiterScoringEvents && !timeLimiterExpired && gameRunning
		utility.wait(3)
		Debug.Trace(self + ": Game while Loop")
	endWhile
	EndGame()
endFunction


Function EndGame()
	LocalGameEnd()
	CancelTimer(GameExpireTimerID)
	CancelTimer(GameCloseToEndTimerID)
	if EndingGameSound
		EndingGameSound.Play(self)
	Endif

	if GameLoopSound01 && GameLoopSound01ID > 0
		sound.StopInstance(GameLoopSound01ID)
		GameLoopSound01ID = 0
	Endif
	if GameLoopSound02 && GameLoopSound02ID > 0
		sound.StopInstance(GameLoopSound02ID)
		GameLoopSound02ID = 0
	Endif

	;debug.Notification("Game Over")
	utility.wait(1)
	;debug.Notification("Final Score -- " + currentScore)
	if currentScore > (HighScoreGlobal.GetValue() as int)
		if NewHighScoreSound
			NewHighScoreSound.Play(self)
		endif
		HighScoreGlobal.SetValue(currentScore)
		SetHighScore()
	Endif
	

	PayoutTickets()
	gameRunning = false
	int i = 0
	int Count = MyTokenSlots.Length
	while i < count
		MyTokenSlots[i].SetTokenSlotActive(true)
		i += 1
	EndWhile
	RemoveKeyword(BlockWorkshopInteractionKeyword)
	;Enable Activation on the coin insert
	;getLinkedRef(LinkCustom01).setDestroyed(false)


endFunction



Function AttemptToStartGame(int TokenNumber)
	;Sent by the Token Slot if the player inserted a token
	debug.Notification("Starting " + gameName + "!")
	;Disable Activation on the coin insert
	;getLinkedRef(LinkCustom01).setDestroyed(true)

	;clear all the internal vars
	gameRunning = true
	ScoringBusy = false
	AddKeyword(BlockWorkshopInteractionKeyword)
	currentScore = 0
	SetScore(currentScore)
	ticketAmount = 0
	timeLimiterExpired = false
	eventsScored = 0
	LastScoredRef = none
	CurrentPlayerPosition = TokenNumber
	int i = 0
	int Count = MyTokenSlots.Length
	while i < count
		MyTokenSlots[i].SetTokenSlotActive(false)
		i += 1
	EndWhile

	if NeedsToTeachThrowing && !DLC04MQ04TutorialQuest.GetStageDone(80)
		DLC04MQ04TutorialQuest.SetStage(80)
	Endif
	if FastGameLoopSound01 || FastGameLoopSound02
		startTimer((gameLimiterTime - 10.0), GameCloseToEndTimerID)
	Endif
	startTimer(gameLimiterTime, GameExpireTimerID)
	if StartingGameSound
		StartingGameSound.Play(self)
	Endif
	if GameLoopSound01
		GameLoopSound01ID = GameLoopSound01.Play(self)
	endif
	if GameLoopSound02
		GameLoopSound02ID = GameLoopSound02.Play(self)
	endif
	Gameloop()
endFunction

int GameExpireTimerID = 9999
int GameCloseToEndTimerID = 8888
event OnTimer(int aiTimerID)
	Debug.Trace(self + ": aiTimerID = " + aiTimerID)
	if aiTimerID == GameExpireTimerID
		Debug.Trace(self + ": Trigger Game end because timer expired")
		timeLimiterExpired = true
	elseif aiTimerID == GameCloseToEndTimerID

		if FastLoopTransition
			FastLoopTransition.Play(self)
		endif

		if FastGameLoopSound01 && GameLoopSound01ID != 0
			Sound.StopInstance(GameLoopSound01ID)
			GameLoopSound01ID = FastGameLoopSound01.Play(self)
		endif
		
		if FastGameLoopSound02 && GameLoopSound02ID != 0
			Sound.StopInstance(GameLoopSound02ID)
			GameLoopSound02ID = FastGameLoopSound02.Play(self)
		endif


	elseif ClearLastScoredRefID
		LastScoredRef = NONE
	endif
	LocalOnTimer(aiTimerID)
endEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Game functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;These are defined on the Child Script

Function LocalScoringFunction(objectReference triggerObj, int ScoringEventNumber)
endFunction

Function LocalGameStart()
endFunction

Function LocalGameEnd()
endFunction

Function LocalOnTimer(int aiTimerID)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			I/O Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int ClearLastScoredRefID = 88
bool ScoringBusy
Function ScoreEvent(int eventNumber, objectReference triggerObj)
	Debug.Trace(self + ": SCORE EVENT >> eventNumber = " + eventNumber + " :: triggerObj = " + TriggerObj)
	debug.Trace(self + ": LastScoredRef = " + LastScoredRef)
	if gameRunning
		While ScoringBusy
			utility.wait(0.2)
		EndWhile
		ScoringBusy = true
		if IgnoreMultiScore || LastScoredRef != triggerObj
			;If we care about not scoring the same ref twice in a row ()
			if !IgnoreMultiScore
				StartTimer(1.0, ClearLastScoredRefID)
				LastScoredRef = triggerObj
				debug.Trace(self + ": LastScoredRef = " + LastScoredRef)
			endif	
			;Do any local scoring event stuff
			LocalScoringFunction(triggerObj, eventNumber)

			;If there is a score event sound for this, play it
			;Some may have the sounds hooked up on the scoring objects rather than here
			if ScoreEvents[eventNumber].ScoreEventSound != NONE
				ScoreEvents[eventNumber].ScoreEventSound.Play(Self)
			Endif

			int scoreBonus = ScoreEvents[eventNumber].PointValue
			debug.Trace(self + ": scoreBonus = " + scoreBonus)
			currentScore += scoreBonus
			SetScore(currentScore)
			
			eventsScored += 1
			debug.Trace(self + ": eventsScored = " + eventsScored)
		endif
		ScoringBusy = false
	endif
endFunction


;This function talks to the Ticket Dispenser
Function PayoutTickets()
	;For now this is a flat division of your score
			;;;OLD FLAT VALUE
	;TicketAmount = (currentScore/ScorePerTicket)
	
			;;;NEW CURVE
	TicketAmount = math.Floor(((currentScore/100) * math.sqrt(currentScore/100))) as int

	MyTicketSlots[CurrentPlayerPosition].PayoutTickets(TicketAmount)

endFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Attached Objects
;	Ticket slot, token slot, score display, etc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Struct AttachedRef
	form formToPlace
	string NodeName
EndStruct

Group AttachedObjectsBaseGroup
	AttachedRef[] Property TokenSlots Auto Const
	AttachedRef[] Property TicketSlots Auto Const
	AttachedRef[] Property ScoreBoard Auto Const
	AttachedRef[] Property HighScoreBoard Auto Const
	AttachedRef[] Property Lights Auto Const
EndGroup

Struct ScoreDisplay
	DLC04:DLC04ArcadeScoreNumber num
	int currentNum = 0
EndStruct

ScoreDisplay[] Score
ScoreDisplay[] HighScore

Keyword Property WorkshopItemKeyword Auto Const Mandatory
objectReference property myWorkshop auto hidden
int Property CurrentPlayerPosition Auto Hidden
DLC04:DLC04ArcadeTicketDispenser[] MyTicketSlots
DLC04:DLC04ArcadeTokenSlot[] MyTokenSlots
ObjectReference[] MyLights

bool objectsAttached
int localHighScore
Function AttachMyObjects()
	if !ObjectsAttached
		objectsAttached = true
		int i = 0
		int count
		objectReference currentObject

		;Place and link TokenSlots
		;Store to the object Array
		count = TokenSlots.length
		MyTokenSlots = new DLC04:DLC04ArcadeTokenSlot[0]
		while i < count
			currentObject = PlaceAtNode(TokenSlots[i].NodeName, TokenSlots[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
			currentObject.SetLinkedRef(self)
			currentObject.OnCellAttach()
			(currentObject as DLC04:DLC04ArcadeTokenSlot).SlotNumber = i
			MyTokenSlots.Add(currentObject as DLC04:DLC04ArcadeTokenSlot)
			currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
			currentObject.RegisterForRemoteEvent(self, "OnReset")
			i += 1
		EndWhile

		;Place and link TicketSlots
		i = 0
		MyTicketSlots = new DLC04:DLC04ArcadeTicketDispenser[0]
		count = TicketSlots.length
		while i < count
			currentObject = PlaceAtNode(TicketSlots[i].NodeName, TicketSlots[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
			currentObject.SetLinkedRef(self)
			currentObject.OnCellAttach()
			MyTicketSlots.Add(currentObject as DLC04:DLC04ArcadeTicketDispenser)
			currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
			currentObject.RegisterForRemoteEvent(self, "OnReset")
			i += 1
		EndWhile

		;Place and link Scoreboard
		i = 0
		count = ScoreBoard.length
		currentObject = none
		Score = new ScoreDisplay[0]
		;ScoreDisplay newScoreDisplay = new ScoreDisplay
		while i < count
			ScoreDisplay newScoreDisplay = new ScoreDisplay
			currentObject = PlaceAtNode(ScoreBoard[i].NodeName, ScoreBoard[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
			
			newScoreDisplay.num = (currentObject as DLC04:DLC04ArcadeScoreNumber)
			Score.add(newScoreDisplay)
			currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
			currentObject.RegisterForRemoteEvent(self, "OnReset")
			i += 1
		EndWhile

		;Place and link HighScoreboard
		i = 0
		count = HighScoreBoard.length

		currentObject = none
		HighScore = new ScoreDisplay[0]
		while i < count
			ScoreDisplay newScoreDisplay = new ScoreDisplay
			currentObject = PlaceAtNode(HighScoreBoard[i].NodeName, HighScoreBoard[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
			newScoreDisplay.num = (currentObject as DLC04:DLC04ArcadeScoreNumber)
			HighScore.add(newScoreDisplay)
			currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
			currentObject.RegisterForRemoteEvent(self, "OnReset")
			i += 1
		EndWhile

		i = 0
		count = Lights.length

		currentObject = none
		MyLights = new ObjectReference[0]
		while i < count
			currentObject = PlaceAtNode(Lights[i].NodeName, Lights[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
			MyLights.add(currentObject)
			i += 1
		EndWhile

		localHighScore = (100 * utility.RandomInt(10, 40))
		
		;This is defined on extended scripts
		LocalAttachMyObjects()
	else
		Debug.Trace(self + ": Tried to attach objects, but they are already attached")
	endif
	;Now set the high score to be displayed
		SetHighScore()
EndFunction

Function LocalAttachMyObjects()
EndFunction

Event OnCellAttach()
	Debug.Trace(Self + ": OnCellAttach")
	WaitFor3DLoad()
	AttachMyObjects()
	if DetachedWhileRunning
		DoLocalDetachedCleanup()
		DetachedWhileRunning = false
	endif
EndEvent

bool DetachedWhileRunning
Event OnCellDetach()
	Debug.Trace(Self + ": OnCellDetach")
	if gameRunning
		DetachedWhileRunning = true
		timeLimiterExpired = true
	endif
	;Flag for onloaded cleanup
EndEvent

;Fix whatever gets messed up from being detached while the game is running
Function DoLocalDetachedCleanup()
EndFunction

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	Debug.Trace(Self + ": OnWorkshopObjectPlaced")
	myWorkshop = getLinkedRef(WorkshopItemKeyword)
	WaitFor3DLoad()
	AttachMyObjects()
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	Debug.Trace(Self + ": OnWorkshopObjectDestroyed")
	DoCleanup()
	LocalWorkshopObjectDestroyed()
EndEvent

Event OnReset()
	Debug.Trace(Self + ": OnReset")
	DoCleanup()
EndEvent

Function DoCleanup()
	;Clear my arrays to avoid old bad pointers, these will get set again when built
	;All Attached refs are responsible for deleting themselves when
	;	they get the Event from this object being destroyed
	timeLimiterExpired = true
	MyTicketSlots.Clear()
	MyTokenSlots.Clear()
	Score.Clear()
	HighScore.Clear()
	int i = 0
	int count = MyLights.Length
	while i < count
		MyLights[i].Delete()
		i += 1
	EndWhile
	
EndFunction

;Extend on Child, Have it clear it's arrays
Function LocalWorkshopObjectDestroyed()
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Attached Objects
;	Ticket slot, token slot, score display, etc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetScore(int newScore)
	SetScoreDisplay(Score, newScore)
EndFunction

Function SetHighScore()
	int PlayerHighScore = (HighScoreGlobal.GetValue() as int)
	if PlayerHighScore >= localHighScore
		SetScoreDisplay(HighScore, PlayerHighScore)
	else
		SetScoreDisplay(HighScore, localHighScore)
	endif
EndFunction

Function SetScoreDisplay(ScoreDisplay[] ScoreToSet, int ScoreToDisplay)
	Debug.Trace(Self + ": SetScoreDisplay >> " + ScoreToDisplay)
	if ScoreToDisplay > 99999999
		ScoreToDisplay = 99999999
	elseif ScoreToDisplay < 0
		ScoreToDisplay = 0
	endif
	int[] ParsedScore = new int[0]
	ParsedScore = ParseScore(ScoreToDisplay)
	;Debug.Trace(self + ": ScoreToDisplay Parsed = " + ParsedScore)
	;Debug.Trace(self + ": ScoreToSet = " + ScoreToSet)
	int i = 0
	while i < 8
		;If this digit does not already equal the number it should tell it to
		;	display that number and store it to the array for future checks
		if ScoreToSet[i].currentNum != ParsedScore[i]
			ScoreToSet[i].currentNum = ParsedScore[i]
			ScoreToSet[i].num.DisplayNumber(ScoreToSet[i].currentNum)
		else
			;Debug.Trace(self + ": ScoreToSet[i].currentNum == ParsedScore[i]")
			;Debug.Trace(self + ": " + ScoreToSet[i].currentNum + " == " + ParsedScore[i])
		endif
		i += 1
	EndWhile
EndFunction

;This parses the number into an array of individual digits to be passed to the digit
int[] Function ParseScore(int ScoreToParse)
	Debug.Trace(Self + ": ParseScore >> " + ScoreToParse)
	int[] ReturnedIntArray = new int[0]
	int i = 0
	int remainder = ScoreToParse
	int digit
	While i < 8
		digit = remainder % 10
		remainder /= 10
		Debug.Trace(self + ": Digit # " + i + " == " + digit)
		ReturnedIntArray.add(digit)
		i += 1
	EndWhile
	;Debug.Trace(self + ": Finished return = " + ReturnedIntArray)
	return ReturnedIntArray
EndFunction

;/    For Reference
Struct ScoreDisplay
	DLC04:DLC04ArcadeScoreNumber num
	int currentNum = 0
EndStruct

ScoreDisplay[] Score
/;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Properties & Vars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



Group GameProperties
	{These are properties related to the game loop}
	float property gameLimiterTime = 300.0 auto
	int property gameLimiterScoringEvents = 10 auto
	;miscObject property internalResource auto
	string property gameName = "Game" auto

	Bool Property NeedsToTeachThrowing = False Auto Const
	Bool Property IgnoreMultiScore = true auto Const
	{if FALSE, there is a timer delay of 1 second before 
		the trigger object is allowed to score again}
	Quest Property DLC04MQ04TutorialQuest Auto Const Mandatory
EndGroup

Struct ScoreEvent
	int PointValue
	sound ScoreEventSound
EndStruct

Group ScoreProperties CollapsedOnRef
	{These are properties related to scoring and tickets}
	ScoreEvent[] property ScoreEvents auto
	GlobalVariable Property HighScoreGlobal Auto Const Mandatory
	int property ScorePerTicket = 50 auto
	Sound Property NewHighScoreSound auto const

	DLC04:DLC04_NukaCadeQuestScript Property DLC04NukaCade Auto Const Mandatory
EndGroup

;All the properties below have to be properties
;	so that the child scripts can access them
Group NoTouchy CollapsedOnRef
	int Property currentScore = 0 Auto hidden
	int Property ticketAmount = 0 Auto hidden

	;bool Property hasInternalResource = true Auto hidden
	;int Property internalResourceCount = 0 Auto

	bool Property gameRunning = false Auto hidden

	int Property eventsScored = 0 Auto hidden
	bool Property timeLimiterExpired = false Auto hidden

	objectReference Property LastScoredRef Auto hidden

	Keyword Property BlockWorkshopInteractionKeyword Auto Const Mandatory
EndGroup


int GameLoopSound01ID
int GameLoopSound02ID
Group SoundProperties
	Sound Property StartingGameSound const auto
	Sound Property GameLoopSound01 const auto
	Sound Property GameLoopSound02 const auto
	Sound Property FastGameLoopSound01 Const Auto
	Sound Property FastGameLoopSound02 Const Auto
	Sound Property EndingGameSound const auto
	Sound Property FastLoopTransition auto const
EndGroup