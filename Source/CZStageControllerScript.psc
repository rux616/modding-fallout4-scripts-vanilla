Scriptname CZStageControllerScript extends ObjectReference Conditional
{This is the main controlling script for the lights in the Combat Zone}

Group QuestProperties CollapsedOnRef
	ReferenceAlias Property Ringmaster Auto Const
	ReferenceAlias Property Combatant1 Auto Const
	ReferenceAlias Property Combatant2 Auto Const
	ReferenceAlias Property Cait Auto Const
	ReferenceAlias Property CaitsCombatant Auto Const
	ReferenceAlias Property Tommy Auto Const
	Quest Property CZ_Arena auto Const
	GlobalVariable Property CZ_CaitIntroDone Auto Const
EndGroup

Group MainSpotlights CollapsedOnRef
	;ObjectReference Property CZSpotLightRef001 Auto Const
	;ObjectReference Property CZSpotLightRef002 Auto Const
	;ObjectReference Property CZSpotLightRef003 Auto Const
	;ObjectReference Property CZSpotLightRef004 Auto Const

	CZSpotlightScript Property Spotlight1 Auto Const
	CZSpotlightScript Property Spotlight2 Auto Const
	CZSpotlightScript Property Spotlight3 Auto Const
	CZSpotlightScript Property Spotlight4 Auto Const
EndGroup

Group OtherLights CollapsedOnRef
	;ObjectReference[] Property StageLightsList Auto Const
	;ObjectReference[] Property UpperLightsList Auto Const

	CZSpotlightScript[] Property StageLights Auto Const
	CZSpotlightScript[] Property UpperLights Auto Const
EndGroup
	
	;Internal Vars
;CZSpotlightScript Spotlight1
;CZSpotlightScript Spotlight2
;CZSpotlightScript Spotlight3
;CZSpotlightScript Spotlight4
;CZSpotlightScript[] StageLights
;CZSpotlightScript[] UpperLights
bool initialized = false
bool runningSequence = false
bool CellIsLoaded = false
bool isFightRunning = false

;==================================================
;
;		This script acts as the main controller for the stage lights in the Combat zone
;	It may be extended further in the future if we have need of it
;	There are four Spot lights used to shine on the fights, announcer and player
;	There are two sets of animated light that change colors and play animations to move around
;
;	All of these are controlled by sequences defined in the properties.
;	These sequences are each an array of sequence actions that define one movement &/or color change
;			Main Timer Block - holds the most important parts of the script
;	When the cell is loaded, an external script tells this one to start up the lights
;
;==================================================


;==================================================
;
;		External Functions
;
;	These are the functions that will be called by the Arena Script or other things
;
;==================================================

Function SpotlightRingmaster(Bool ShouldSpotlight = true)
	if ShouldSpotlight
		Spotlight1.StartDirectAt(Ringmaster.getReference())
		Spotlight1.TurnOnSpotlight()
	else
		Spotlight1.ShutOffSpotlight()
		Spotlight1.StopDirectAt()
	Endif
EndFunction

Function SpotlightCombatant1(Bool ShouldSpotlight = true)
	if ShouldSpotlight
		Spotlight2.StartDirectAt(Combatant1.getReference())
		Spotlight2.TurnOnSpotlight()
	else
		Spotlight2.ShutOffSpotlight()
		Spotlight2.StopDirectAt()
	Endif
EndFunction

Function SpotlightCombatant2(Bool ShouldSpotlight = true)
	if ShouldSpotlight
		Spotlight3.StartDirectAt(Combatant2.getReference())
		Spotlight3.TurnOnSpotlight()
	else
		Spotlight3.ShutOffSpotlight()
		Spotlight3.StopDirectAt()
	Endif
EndFunction

Function SpotlightOther(ObjectReference refToLight, Bool ShouldSpotlight = true)
	if ShouldSpotlight
		Spotlight4.TurnOnSpotlight()
		Spotlight4.StartDirectAt(refToLight)
	else
		Spotlight4.ShutOffSpotlight()
		Spotlight4.StopDirectAt()
	Endif
EndFunction

;;;;;;;;;

Function StartAmbientLights()
	Debug.Trace(Self + ": StartingAmbientLights")
	
	ClearSequenceQueue()
	;Pick initial sequences to fill the array with out of the Valid Ambient Sequences
	AddSequenceToQueue(RandomElement(ValidAmbientSequences))
	AddSequenceToQueue(RandomElement(ValidAmbientSequences))
	AddSequenceToQueue(RandomElement(ValidAmbientSequences))
	AddSequenceToQueue(RandomElement(ValidAmbientSequences))
	AddSequenceToQueue(RandomElement(ValidAmbientSequences))
	AddSequenceToQueue(RandomElement(ValidAmbientSequences))
	AddSequenceToQueue(RandomElement(ValidAmbientSequences))
	AddSequenceToQueue(RandomElement(ValidAmbientSequences))


	StartSequenceQueue()
EndFunction

Function StopAmbientLights()
	Debug.Trace(Self + ": StopAmbientLights")

EndFunction

Function AllLightsOff()
	Debug.Trace(Self + ": AllLightsOff")
	ClearSequenceQueue()

	Spotlight1.ShutOffSpotlight()
	Spotlight2.ShutOffSpotlight()
	Spotlight3.ShutOffSpotlight()
	Spotlight4.ShutOffSpotlight()
	int i = 0
	while (i < StageLights.length)
		StageLights[i].ShutOffSpotlight()
		i += 1
	endwhile
	i = 0
	while (i < UpperLights.length)
		UpperLights[i].ShutOffSpotlight()
		i += 1
	endwhile
EndFunction

;This should tell the script to switch to the more 'action-y' set of sequences
Function StartFight()
	isFightRunning = true
	Debug.Trace(Self + ": StartFight")
	ClearSequenceQueue()
	;Pick initial sequences to fill the array with out of the Valid Ambient Sequences
	AddSequenceToQueue(RandomElement(ValidFightSequences))
	AddSequenceToQueue(RandomElement(ValidFightSequences))
	AddSequenceToQueue(RandomElement(ValidFightSequences))
	AddSequenceToQueue(RandomElement(ValidFightSequences))
	AddSequenceToQueue(RandomElement(ValidFightSequences))
	AddSequenceToQueue(RandomElement(ValidFightSequences))
	AddSequenceToQueue(RandomElement(ValidFightSequences))
	AddSequenceToQueue(RandomElement(ValidFightSequences))

	StartSequenceQueue()
EndFunction


;A fight has stopped, this should send it into more passive sequences
Function StopFight()
	Debug.Trace(Self + ": StartFight")
	isFightRunning = false

	StartAmbientLights()
EndFunction

;/			These were an ideas that got scrapped
;Placeholder for if we want to do something for a big hit
Function BigHit()
	Debug.Trace(Self + ": BigHit")

EndFunction

;Placeholder for if we want to do something when a fighter is killed
Function FighterKilled()
	Debug.Trace(Self + ": FighterKilled")

EndFunction
/;

Function StartCaitIntro()
	Debug.Trace(Self + ": StartCaitIntro")
	Spotlight4.ShutOffSpotlight()
	Spotlight1.SetLightColor(1)
	Spotlight2.SetLightColor(0.1)
	Spotlight3.SetLightColor(0.6)
	Spotlight1.StartDirectAt(Tommy.getReference())
	Spotlight2.StartDirectAt(Cait.getReference())
	Spotlight3.StartDirectAt(CaitsCombatant.getReference())
EndFunction

Function EndCaitIntro()
	CZ_CaitIntroDone.SetValue(1)
	SpotlightRingmaster(false)
	SpotlightCombatant1(false)
	SpotlightCombatant2(false)
	Spotlight4.ShutOffSpotlight()
	SpotlightOther(none, false)
EndFunction

;==================================================
;
;		Initializing and Cleanup
;
;==================================================


Event OnCellAttach()
	TotalSequencesRunSinceLoad = 0
	CellIsLoaded = true
	Debug.Trace(Self + ": OnLoad")
	Init()
	
	if CZ_CaitIntroDone.GetValue() == 0
		StartCaitIntro()
		StartFight()
	else
		StartAmbientLights()
	EndIf

EndEvent

Event OnCellDetach()
	CellIsLoaded = false
	;ClearSequenceQueue()
	AllLightsOff()
EndEvent

Function Init()
	if !initialized
		initialized = true

		;Check the spotlight sequences to make sure none of them are empty, clear out that element if so
		ValidAmbientSequences = CheckSequences(ValidAmbientSequences)
		ValidFightSequences = CheckSequences(ValidFightSequences)
		Spotlight4.ShutOffSpotlight()
	endif
EndFunction

;This fills the scripted object array from the objectRef array
;	We do this so we don't have to continually cast the objectReference as the script
CZSpotlightScript[] Function FillLightArray(objectReference[] LightArray)
	int i = 0
	int lengthOfList = LightArray.length
	CZSpotlightScript[] ScriptArray = new CZSpotlightScript[lengthOfList]
	;fill the array of scripted lights
	while i < lengthOfList
		ScriptArray[i] = LightArray[i] as CZSpotlightScript
		i += 1
	endWhile
	;Now send it back to fill the Var
	Return ScriptArray
EndFunction

;==================================================
;
;		Main Timer Block
;
;	This is what actually makes the sequence calls to the lights / backgrounds
;		so everything can run in parallel
;
;==================================================

;TimerIDs
int SequenceActionCompleteID = 1
int SequenceActionCompleteIDBackup = 2
int SequenceTimerCompleteID = 5
int StageLightsStarterID = 10
int UpperLightsStarterID = 15
int StageLightsTimerID = 100
int UpperLightsTimerID = 200
int MainLightsTimerID = 300
;Sequence Tracking Vars
int currentSequenceAction = 0
int[] SequenceQueue
int currentSequenceQueue = 0
SequenceAction[] currentSequence
int SAsent = 0
int SAtotal

Event OnTimer(int aiTimerID)
	;Debug.Trace(Self + ": has received timer event == " + aiTimerID)
	;All our Sequence action done events have been completed
    if aiTimerID == SequenceActionCompleteID
    	;Debug.Trace(Self + "::: SequenceAction Complete")
    	waitingForSequenceDone = false
    	CancelTimer(SequenceActionCompleteIDBackup);Cancel our backup timer
    	RunNextSequenceAction()
    ;Something broke and we fell through to the backup timer, but keep going
    elseif aiTimerID == SequenceActionCompleteIDBackup
		Debug.Trace(Self + "::: SequenceAction Failed, a light is broken")
    	waitingForSequenceDone = false
    	RunNextSequenceAction()
    ;The sequence timer has finished
    elseif aiTimerID == SequenceTimerCompleteID
    	;Debug.Trace(Self + "::: SequenceTimer Complete")
    	RunNextSequenceAction()

    ;Start Stage Lights
    elseif aiTimerID == StageLightsStarterID
    	int sCount = 0
    	while (scount < StageLights.length)
			StartTimer(0.1, (StageLightsTimerID + scount))
			scount += 1
			utility.wait(0.05)
		endwhile

    ;Start Upper Lights
    elseif aiTimerID == UpperLightsStarterID
    	int iCount = 0
		while (icount < UpperLights.length)
			StartTimer(0.1, (UpperLightsTimerID + icount))
			icount += 1
			utility.wait(0.05)
		endwhile

    ;These are where we make the RunSequenceAction Calls so we can do so in series	
    ;/
    bool Function RunSequence(int SequenceNumber = -1, float SequenceSpeed = 150.0, \
	bool hasLightSequence, int LightState, float LightTarget, float lightChangeSpee = 0.3, \
	bool overrideOrders)
/;
	elseif aiTimerID >= StageLightsTimerID && aiTimerID < (MainLightsTimerID + 5)
		int i = currentSequenceAction
		int LightID = aiTimerID
		bool AddSequenceQueueTotal
		SequenceAction[] mySeq = currentSequence
		SASent += 1 	;Tell us that you've sent a sequence action so we can count them
		;These is the stage light event range
	    if aiTimerID >= StageLightsTimerID && aiTimerID < UpperLightsTimerID
	    	;debug.Trace(Self + "::: Starting a Stage Lights Sequence Action >> " + aiTimerID)
	    	;Subtract StageLightsTimerID and use the LightID as the index in the Array
	    	;	This is just an orgainization trick
	    	LightID -= StageLightsTimerID
	    	AddSequenceQueueTotal = StageLights[LightID].RunSequence(mySeq[i].DownAction, mySeq[i].DownSpeed, \
	    		mySeq[i].DownhasLightSequence, mySeq[i].DownLightState, mySeq[i].DownLightTarget, mySeq[i].DownLightRamp, \
	    		mySeq[i].OverrideOrders)		;These is the upper light event range
	    	if AddSequenceQueueTotal
    			SequenceCountDoneTotal += 1
    		endif
		elseif aiTimerID >= UpperLightsTimerID && aiTimerID < MainLightsTimerID
	    	;debug.Trace(Self + "::: Starting a Upper Lights Sequence Action >> " + aiTimerID)
	    	;Subtract UpperLightsTimerID and use the LightID as the index in the Array
	    	;	This is just an orgainization trick
	    	LightID -= UpperLightsTimerID
	    	AddSequenceQueueTotal = UpperLights[LightID].RunSequence(mySeq[i].UpAction, mySeq[i].UpSpeed, \
	    		mySeq[i].UphasLightSequence, mySeq[i].UpLightState, mySeq[i].UpLightTarget, mySeq[i].UpLightRamp, \
	    		mySeq[i].OverrideOrders)
	    	if AddSequenceQueueTotal
    			SequenceCountDoneTotal += 1
    		endif
	    ;These is the main light event range
	    elseif aiTimerID >= MainLightsTimerID && aiTimerID < (MainLightsTimerID + 5)
	    	;debug.Trace(Self + "::: Starting a Main Lights Sequence Action >> " + aiTimerID)
	    	;Subtract MainLightsTimerID and use the LightID
	    	;	This is just an orgainization trick
	    	LightID -= MainLightsTimerID
	    	;Debug.Trace(Self + "::::: LightID = " + LightID)
	    	
	    	if LightID == 1
	    		AddSequenceQueueTotal = Spotlight1.RunSequence(mySeq[i].Main1Action, mySeq[i].MainSpeed, \
	    			mySeq[i].Main1hasLightSequence, mySeq[i].Main1LightState, mySeq[i].Main1LightTarget, mySeq[i].Main1LightRamp, \
	    			mySeq[i].OverrideOrders)
	    		if AddSequenceQueueTotal
	    			SequenceCountDoneTotal += 1
	    		endif
	    	elseif LightID == 2
	    		AddSequenceQueueTotal = Spotlight2.RunSequence(mySeq[i].Main2Action, mySeq[i].MainSpeed, \
	    			mySeq[i].Main1hasLightSequence, mySeq[i].Main2LightState, mySeq[i].Main2LightTarget, mySeq[i].Main2LightRamp, \
	    			mySeq[i].OverrideOrders)
	    		if AddSequenceQueueTotal
	    			SequenceCountDoneTotal += 1
	    		endif
	    	elseif LightID == 3
	    		AddSequenceQueueTotal = Spotlight3.RunSequence(mySeq[i].Main3Action, mySeq[i].MainSpeed, \
	    			mySeq[i].Main3hasLightSequence, mySeq[i].Main3LightState, mySeq[i].Main3LightTarget, mySeq[i].Main3LightRamp, \
	    			mySeq[i].OverrideOrders)
	    		if AddSequenceQueueTotal
	    			SequenceCountDoneTotal += 1
	    		endif
	    	;elseif LightID == 4
	    	;	Spotlight4.RunSequence(mySeq[i].Main4Action, mySeq[i].MainSpeed, \
	    	;		mySeq[i].Main4hasLightSequence, mySeq[i].Main4LightState, mySeq[i].Main4LightTarget, mySeq[i].Main4LightRamp, \
	    	;		mySeq[i].OverrideOrders)
	    	else
	    		debug.Trace(self + "::: MainLight failure >> " + LightID)
	    	endif
	    endif
	else
		Debug.Trace(Self + "::: ERROR WHAT TIMER IS THIS?? >> " + aiTimerID)
	endif
EndEvent

;==================================================
;
;		Sequence Queue Functions
;
;==================================================

;
Function AddSequenceToQueue(int SequenceNumber)
	Debug.Trace(Self + ": is adding SequenceNumber " + SequenceNumber + " to Sequence Queue")
	;Debug.Trace(self + ": SequenceQueue length = " + SequenceQueue.length)
	;Debug.Trace(self + ": last entry = " + SequenceQueue[SequenceQueue.length - 1])

	;NEW SIMPLIFIED
	if SequenceQueue == none
		SequenceQueue = new int[0]
	endif
	SequenceQueue.Add(SequenceNumber)

	;/
	i = 0
	while (i < newQueueHolder.length)
		SequenceQueue[i] = newQueueHolder[i]
		i += 1
	endwhile
	/;
EndFunction

;
Function ClearSequenceQueue()
	SequenceQueue = none
EndFunction


Function StartSequenceQueue()
	debug.Trace(self + ": Starting Sequence")
	runningSequence = true
	currentSequence = GetSequence(SequenceQueue[0])
	debug.Trace(self + ": currentSequence = " + currentSequence)
	RunSequenceAction(currentSequence)
EndFunction

;This function moves each item up in the sequence queue array
bool Function IncrementSequenceQueue()
	Debug.Trace(Self + ": IncrementSequenceQueue")



	if SequenceQueue.Length > 0
		sequenceQueue.Remove(0)
		Debug.Trace(Self + "::: Sequence Queue Incremented >>> returning true")
		return true
	else 	;Queue is empty, set to NONE
		SequenceQueue = none
		Debug.Trace(Self + "::: Sequence Queue Empty >>> returning false")
		return false
	endif

EndFunction

int SequenceCountDoneTotal = 0
int CurrentSequencesComplete = 0
bool waitingForSequenceDone = false
;This is called from the Light if it has an anim with a done event
Function CountSequenceDone()
	;Debug.Trace(self + ": Has recieved CountSequenceDone")
	;Debug.Trace(self + ":::: CurrentSequencesComplete = " + CurrentSequencesComplete)
	;Debug.Trace(self + ":::: SequenceCountDoneTotal = " + SequenceCountDoneTotal)
	;Debug.Trace(self + ":::: SASent = " + SASent + " :: SATotal = " + SATotal)
	if waitingForSequenceDone
		CurrentSequencesComplete += 1
		;Debug.Trace(self + ":::: New CurrentSequencesComplete = " + CurrentSequencesComplete)
		if CurrentSequencesComplete >= SequenceCountDoneTotal && SASent >= SAtotal
			;Debug.Trace(self + ":::: CurrentSequencesComplete >= SequenceCountDoneTotal >> " + SequenceActionCompleteID)
			startTimer(0.2, SequenceActionCompleteID)
		endif
	endif
EndFunction

;==================================================
;
;		Sequence Structure
;
;	Each sequence is an array of sequence action structs that define the movement of the lights
;	When we call a sequence it passes the instructions to each light
;
;
;		bool Function RunSequence(int SequenceNumber = -1, float SequenceSpeed = 150.0, \
;			bool hasLightSequence, int LightState, float LightTarget, float lightChangeSpeed = 0.3, \
;			bool overrideOrders)
;==================================================
Struct SequenceAction
	bool Definition
	{Actions are sweeps of lights
		-1 "NoOrders" = No Orders, stay doing whatever you are
	    0 "Up" = translate to Up
	    1 "Down"
	    2 "Left"
	    3 "Right"
	    4 "LeftRight"
	    5 "RightLeft"
	    6 "UpDown"
	    7 "DownUp"
	    8 "CircleCW"
	    9 "CircleCCW"
	    10 "Figure8"}

	bool OverrideOrders
	bool iiiiiiiiiiiiiiMAINiiiiiiiiiiiiii
	int Main1Action = -1
	bool Main1hasLightSequence = false
	int Main1LightState = -1
	float Main1LightTarget = 0.0
	float Main1LightRamp = 0.3
	int Main2Action = -1
	bool Main2hasLightSequence = false
	int Main2LightState = -1
	float Main2LightTarget = 0.0
	float Main2LightRamp = 0.3
	int Main3Action = -1
	bool Main3hasLightSequence = false
	int Main3LightState = -1
	float Main3LightTarget = 0.0
	float Main3LightRamp = 0.3
	;int Main4Action = -1
	;bool Main4hasLightSequence = false
	;int Main4LightState = -1
	;float Main4LightTarget = 0.0
	;float Main4LightRamp = 0.3
	float MainSpeed = 2.0
	bool iiiiiiiiiiiiiiUPiiiiiiiiiiiiii
	int UpAction = -1
	float UpSpeed = 2.0
	int upLightState = -1
	bool UphasLightSequence = true
	float upLightTarget = 0.0
	float upLightRamp = 0.3
	bool iiiiiiiiiiiiiiDOWNiiiiiiiiiiiiii
	int DownAction = -1
	float DownSpeed = 2.0
	int DownLightState = -1
	bool DownhasLightSequence = true
	float DownLightTarget = 0.0
	Float DownLightRamp = 0.3
	float SequenceTimer = -1.0
EndStruct

;These are the valid sequences for each type
; Cannot be const since I am adding a check to make sure the sequences listed are not NONE
Group ValidSequences
	int[] Property ValidAmbientSequences Auto
	int[] Property ValidFightSequences Auto
EndGroup

;More sequences than we plan to actually use
;Each of these are an array of sequential sequence actions that give directions to the lights
Group Sequences CollapsedOnRef
	SequenceAction[] property Sequence1 auto const
	SequenceAction[] property Sequence2 auto const
	SequenceAction[] property Sequence3 auto const
	SequenceAction[] property Sequence4 auto const
	SequenceAction[] property Sequence5 auto const
	SequenceAction[] property Sequence6 auto const
	SequenceAction[] property Sequence7 auto const
	SequenceAction[] property Sequence8 auto const
	SequenceAction[] property Sequence9 auto const
	SequenceAction[] property Sequence10 auto const
	SequenceAction[] property Sequence11 auto const
	SequenceAction[] property Sequence12 auto const
	SequenceAction[] property Sequence13 auto const
	SequenceAction[] property Sequence14 auto const
	SequenceAction[] property Sequence15 auto const
	SequenceAction[] property Sequence16 auto const
	SequenceAction[] property Sequence17 auto const
	SequenceAction[] property Sequence18 auto const
	SequenceAction[] property Sequence19 auto const
	SequenceAction[] property Sequence20 auto const
EndGroup

Function TestSeq(int SequenceNumber)
	ClearSequenceQueue()
	AddSequenceToQueue(SequenceNumber)
EndFunction
;==================================================
;
;		Sequence Functions
;
;==================================================

int TotalSequencesRunSinceLoad = 0
Function RunNextSequenceAction()
	Debug.Trace(Self + ": RunNextSequenceAction")
	currentSequenceAction += 1
	Debug.Trace(Self + "::: new currentSequenceAction " + currentSequenceAction)
	bool HasNewSequence = true
	if SequenceQueue && CellIsLoaded		;IF WE HAVE A SEQUENCE QUEUE
		if currentSequenceAction >= currentSequence.length
			Debug.Trace(Self + "::: currentSequenceAction >= currentSequence.length ")
			Debug.Trace(Self + "::: reset to 0 and increment sequence queue")
			;Current sequence has ended, bump next
			CurrentSequenceAction = 0

;;##################			This may be where I place a sequence refiller
			if 	CellIsLoaded
				if isFightRunning
					AddSequenceToQueue(RandomElement(ValidFightSequences))
				else
					AddSequenceToQueue(RandomElement(ValidAmbientSequences))
				endif
			endif

			if IncrementSequenceQueue()
				Debug.Trace(Self + "::::: Increment the Sequence Queue successful")
				currentSequence = GetSequence(SequenceQueue[0])
			else
				Debug.Trace(Self + "::::: Increment the Sequence Queue FAILED")
				Debug.Trace(Self + "::::: Sequence Queue is clear")
				HasNewSequence = false
			endif
		endif
		if HasNewSequence
			Debug.Trace(Self + "::: HAS NEW SEQUENCE")
			TotalSequencesRunSinceLoad += 1
			Debug.Trace(Self + "::::: TOTAL SEQUENCES RUN SINCE LOAD == " + TotalSequencesRunSinceLoad)
			RunSequenceAction(currentSequence)
		EndIf
	else
		;If we don't have a sequenceQueue it is probably because we left the cell, so stop
	endif
EndFunction

;RunSequence(int SequenceNumber, float SequenceSpeed = 150.0, bool loop = false, bool reverse = false)
Function RunSequenceAction(SequenceAction[] mySeq)
	int i = currentSequenceAction
	debug.Trace(Self + ": RunSequenceAction >> " + currentSequenceAction)
	debug.Trace(Self + "::: mySeq >> " + mySeq[i])
	;Start Timers to control main lights in series
	;debug.Trace(Self + "::: Starting MainLightsTimers >> " + MainLightsTimerID)
	SAtotal = 0
	SASent = 0

;If this uses a timer - start the timer
	if mySeq[i].SequenceTimer > 0
		debug.Trace(Self + "::: Waiting for sequenceTimer")
		startTimer(mySeq[i].SequenceTimer, SequenceTimerCompleteID)

	;if this counts sequences completed - set that and start counting
	else
		debug.Trace(Self + "::: Waiting for waitingForSequenceDone")
		waitingForSequenceDone = true
		CurrentSequencesComplete = 0
		SequenceCountDoneTotal = 0
		SAtotal = UpperLights.length + StageLights.length + 3
		StartTimer(7.0, SequenceActionCompleteIDBackup)
	endif
	;Start Timers so things can happen in parallel
	StartTimer(0.1, (MainLightsTimerID + 1))
	StartTimer(0.1, (MainLightsTimerID + 2))
	StartTimer(0.1, (MainLightsTimerID + 3))
	;These run while loops so both sets of lights can be going at the same time
	startTimer(0.1, StageLightsStarterID)
	startTimer(0.1, UpperLightsStarterID)
EndFunction





;Breaking out the parsing for cleaner script
; unfortunately we can't do this with an array, since we aren't allowing arrays within arrays
; Leaving more than we probably need, sequences will be selected with a valid sequence array that says which are usable
SequenceAction[] Function GetSequence(int SequenceNumber)
	if SequenceNumber == 1
		return Sequence1
	elseif SequenceNumber == 2
		return Sequence2
	elseif SequenceNumber == 3
		return Sequence3
	elseif SequenceNumber == 4
		return Sequence4
	elseif SequenceNumber == 5
		return Sequence5
	elseif SequenceNumber == 6
		return Sequence6
	elseif SequenceNumber == 7
		return Sequence7
	elseif SequenceNumber == 8
		return Sequence8
	elseif SequenceNumber == 9
		return Sequence9
	elseif SequenceNumber == 10
		return Sequence10
	elseif SequenceNumber == 11
		return Sequence11
	elseif SequenceNumber == 12
		return Sequence12
	elseif SequenceNumber == 13
		return Sequence13
	elseif SequenceNumber == 14
		return Sequence14
	elseif SequenceNumber == 15
		return Sequence15
	elseif SequenceNumber == 16
		return Sequence16
	elseif SequenceNumber == 17
		return Sequence17
	elseif SequenceNumber == 18
		return Sequence18
	elseif SequenceNumber == 19
		return Sequence19
	elseif SequenceNumber == 20
		return Sequence20	
	else
		debug.trace(self + ": GET SEQUENCE CALLED WITH INVALID SEQUENCE #")
		debug.trace(self + ":: Returning Sequence1 #Dealwithit")
		return Sequence1
	endif
EndFunction


int[] Function CheckSequences(int[] PotentiallyValidSequences)
	int i = 0
	int count = PotentiallyValidSequences.Length
	int[] ActualValidSequences = new int[0]
	while i < count
		Debug.Trace(self + ": GetSequence got >> " + GetSequence(PotentiallyValidSequences[i]))
		if GetSequence(PotentiallyValidSequences[i]) != NONE
			ActualValidSequences.Add(PotentiallyValidSequences[i])
		endif
		i += 1
	EndWhile
	Return ActualValidSequences
EndFunction

int Function RandomElement(int[] iArray)
	Debug.Trace(self + ":::RandomElement")
	if iArray
		int Rand = utility.RandomInt(0, iArray.Length -1)
		Debug.Trace(self + "::::: Rand = " + Rand)
		int element = iArray[Rand]
		Debug.Trace(self + "::::: element = " + element)
		return element
	else
		Debug.Trace(Self + ": Something very bad happened to the array we are trying to access")
		return 1
	endif
endFunction