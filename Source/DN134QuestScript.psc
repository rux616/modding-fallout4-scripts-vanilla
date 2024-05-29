Scriptname DN134QuestScript extends Quest Conditional


;==================================================
;				Vars & Properties
;==================================================

Quest Property CZ Auto
CustomEvent CZLiftStateChanged

Bool AllIntrosComplete = false

;SimpleElevatorMasterScript
ObjectReference Property CZLiftController01 Auto Const
ObjectReference Property CZLiftController02 Auto Const
GlobalVariable Property CZLift1Active Auto Const
GlobalVariable Property CZLift2Active Auto Const
ObjectReference Property CZLiftController01Activator Auto Const
ObjectReference Property CZLiftController02Activator Auto Const

Quest Property DialogueDrinkingBuddy Auto Const

;==================================================
;		SetStage Triggers for repeat entry
;			These are mostly for triggering the drinking buddy quest	
;==================================================

;We will use this to start Scenes for drinking buddy
Function CombatZoneInteriorHasLoaded()
	Debug.Trace(Self + ": INTERIOR HAS LOADED")
	if CZ.IsStageDone(300) && !AllIntrosComplete && !IsStageDone(15) && !GetStageDone(100) && !DialogueDrinkingBuddy.GetStageDone(20)&& !GetStageDone(40) && !GetStageDone(50)
;		if !IsStageDone(3)
;			SetStage(3)
;		elseif !IsStageDone(5)
;			SetStage(5)
;		Endif
	Endif
EndFunction


;==================================================
;				Lift Controls
;==================================================

;The lift Buttons will send this if they are activated and allowed to activate
;whether activation is allowed on a set of buttons is controlled through the globals CZLift#Active
Function ActivateLift(bool IsLiftOne = true)
	if IsLiftOne
		CZLiftController01Activator.Activate(CZLiftController01)
	else
		CZLiftController02Activator.Activate(CZLiftController02)
	endif
EndFunction

;Set the lift to either raised or lowered
Function SetLiftState(bool IsLiftOne = true, bool ShouldRaise = true)
	SimpleElevatorMasterScript myLiftScript
	ObjectReference myLift
	;Set which lift we are using
	if IsLiftOne
		myLift = CZLiftController01
	else
		myLift = CZLiftController02
	EndIf
	myLiftScript = myLift as SimpleElevatorMasterScript

	;We use the lift upside down so that it always starts "raised" when you enter the cell
	;so the checks for GetIsRaised are inverted
	;The function should wait till it is not "busy" to tell us what state it is in
	if ShouldRaise && myLiftScript.GetIsRaised();should raise and lift is down
		myLift.Activate(myLift)
	elseif !ShouldRaise && !myLiftScript.GetIsRaised();should lower and lift is up
		myLift.Activate(myLift)
	endif
EndFunction

;This will change the global the buttons check to see if they are active
Function SetLiftButtonActive(bool IsLiftOne = true, bool shouldBeActive = true)
	GlobalVariable myLiftGlobal
	;Set which lift we are using
	if IsLiftOne
		myLiftGlobal = CZLift1Active
	else
		myLiftGlobal = CZLift2Active
	EndIf

	;Convert the bool to an int to set the global variable
	int iShouldBeActive = 0
	if shouldBeActive
		iShouldBeActive = 1
	endif

	myLiftGlobal.SetValue(iShouldBeActive)
	SendCustomEvent("CZLiftStateChanged")
EndFunction

Function LockLiftButtons(bool ShouldBeLocked = true)
	SetLiftButtonActive(true, !ShouldBeLocked)
	SetLiftButtonActive(false, !ShouldBeLocked)
EndFunction

;This is where we get Activation from Lift Buttons
Function LiftButtonPress(bool IsLiftOne = true)
	if IsLiftOne && CZLift1Active.GetValue() == 1
		ActivateLift(IsLiftOne = true)
	elseif !IsLiftOne && CZLift2Active.GetValue() == 1
		ActivateLift(IsLiftOne = false)
	else
		Debug.Trace(Self + ": Recieved Activate from a lift, but that was not supposed to be active!")
	Endif
EndFunction