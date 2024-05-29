ScriptName CZSpotlightScript extends ObjectReference
{Master Script for the spotlights. SpotlightTriggerScript talks to this script}

import debug



Group LightTargets CollapsedOnRef
	string[] Property AnimNames Auto
	ObjectReference property RefToWatch Auto hidden
	ObjectReference property CZStageControllerRef Auto
	CZStageControllerScript property StageController auto hidden
	float property LightOnIntensity = 0.4 auto
EndGroup

;vars
bool directAtActor = false ;true if directAt is active on an actor
bool busy = false
bool turnedOn = false conditional
bool initialized = false
;ObjectReference mySpotlightLight
string lastAnim
int LightIndex = -1
;Light Color Vars
int LightTimerID = 100
float myLightTarget
float myLightChangeSpeed

;/	Light controls
fToggleBlend = 0 (starts at white and goes through the rainbow at increments of 0.1)
fDampRate = 0.3 (bigger is faster)
/;
;/
;********Functions Below****************************
Actions are sweeps of lights

		New String Sequences
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
	    10 "Figure8"

		
;************************************
	bool overrideOrders
	bool HasLightSequence
	int LightState
	   -1 = stay as you are
		0 = Turn off
		1 = turn on

	Light Colors
	 1 = white
	 0.1 = red
	 0.2 = 
	 0.3 = 
	 0.4 = 
	 0.5 = 
	 0.6 = 
	 0.7 = 
	 0.8 = 
	 0.9 = 
/;


;return True if we should wait for a callback from this
bool Function RunSequence(int SequenceNumber, float SequenceSpeed, \
	bool hasLightSequence, int LightState, float LightTarget, float lightChangeSpeed, \
	bool overrideOrders)

	bool WaitForEndEvent = false
	;debug.trace(self + ": RunSequence >> " + SequenceNumber)

	;light sequence to play
	if hasLightSequence
		myLightTarget = LightTarget
		myLightChangeSpeed = lightChangeSpeed
		StartTimer(0.1, LightTimerID)
	endif

	;Control turning the lights on/off
	if LightState >= 0
		if turnedOn && LightState == 0
			ShutOffSpotlight()
		elseif !turnedOn && LightState == 1
			TurnOnSpotlight()
		endif
	endif


	if directAtActor && !overrideOrders 
		;We have an actor target, so ignore this unless there are override orders
		if lastAnim != "Direct01"
			SetDirectAtTarget(RefToWatch)
			PlayAnimation("Direct01")
			lastAnim = "Direct01"
		endif
	else			;We do not have a target, so play the sequence
			if SequenceNumber > -1
				CleanUp()
				string newAnim
				newAnim = GetAnim(SequenceNumber)
				lastAnim = newAnim
				SetAnimationVariableFloat("fspeed", SequenceSpeed)
				PlayAnimation(newAnim)
				if SequenceNumber < 4
					RegisterForAnimationEvent(Self, "Done")
					WaitForEndEvent = true
				endif
			endif
	endif
	return WaitForEndEvent
endFunction

Function SetLightColor(float LightTarget, float lightChangeSpeed = 0.3)
	myLightTarget = LightTarget
	myLightChangeSpeed = lightChangeSpeed
	StartTimer(0.1, LightTimerID)
EndFunction

Function TestSeq(int sequenceNumber)
	string newAnim
	newAnim = GetAnim(SequenceNumber)
	PlayAnimation(newAnim)
EndFunction

string Function GetAnim(int SequenceNumberToGet)
	;Debug.Trace(Self + ": GetAnim")
	string passBackAnim
	if AnimNames[SequenceNumberToGet]
		passBackAnim = AnimNames[SequenceNumberToGet]
		;Debug.Trace(Self + "::: GetAnim has Returned >> " + passBackAnim)
	else
		passBackAnim = "RightLeft"
		;Debug.Trace(Self + "::: GetAnim has FAILED AnimNames[ " + SequenceNumberToGet + " ] does not exist")
	endif
	return passBackAnim
EndFunction

;************************************

;************************************

Function CleanUp()
	UnregisterForAnimationEvent(self, "Done")
endFunction

;--------------- Turn on/off ---------------

Function TurnOnSpotlight()
	;debug.trace("Spotlight: Switching On!")
	turnedOn = true
	;mySpotlightLight.enableNoWait()
	SetAnimationVariableFloat("flightintensity", LightOnIntensity)
	playAnimation("TurnOn")

endFunction


Function ShutOffSpotlight()
	;debug.trace("Spotlight: Shutting down!")
	turnedOn = false
	;playAnimationAndWait("TurnOff", "Done")
	playAnimation("TurnOff")
	busy =false
	;mySpotlightLight.disableNoWait()
	SetAnimationVariableFloat("flightintensity", 0.0)
	CallSequenceComplete()
endFunction

;************************************

Function StopDirectAt()
	directAtActor = false
	SetDirectAtTarget(None)
	ShutOffSpotlight()
endFunction

Function StartDirectAt(ObjectReference akActionRef)
	Debug.Trace(self + ": StartDirectAt " + akActionRef)
	PlayAnimation("Direct01")
	RefToWatch = akActionRef
	SetDirectAtTarget(RefToWatch)
	directAtActor = true
endFunction
;************************************
;

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == "Done"
		CleanUp()
		CallSequenceComplete()
	endif
EndEvent


Function CallSequenceComplete()
	StageController.CountSequenceDone()
endFunction

;*************States Below***********************


Event onCellLoad()
	if !initialized
		Init()
	endif
endEvent



Event OnUnload()
	CleanUp()
EndEvent


Event OnTimer(int aiTimerID)	
	if aiTimerID == LightTimerID
		StartLightSequence(myLightTarget, myLightChangeSpeed)
	endif
EndEvent

Function StartLightSequence(float localLightTarget, float localLightChangeSpeed)
	SetAnimationVariableFloat("fLightColor",localLightTarget)
	SetAnimationVariableFloat("fDampRate",localLightChangeSpeed)

EndFunction


;************************************

STATE Done
	;do nothing
endSTATE

;************************************

Function Init()
	initialized = true
	;mySpotlightLight = getlinkedRef()
	StageController = CZStageControllerRef as CZStageControllerScript
	SetAnimationVariableFloat("flightintensity", LightOnIntensity)
endFunction