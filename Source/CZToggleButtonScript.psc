Scriptname CZToggleButtonScript extends ObjectReference
{Script for a button with active and inactive states.}

Group Required_Properties
	Bool Property IsLiftOne = True Auto Const

	Message property ToggleButtonInactiveMessage auto
	{Failure message to display if the player presses the button while it's in its inactive state. Can be changed via script if desired.}

	String property animationName = "Press" auto const
	{Animation to play when the button is activated.}

	DN134QuestScript Property DN134 Auto Const

	GlobalVariable Property CZLift1Active Auto Const
	GlobalVariable Property CZLift2Active Auto Const
EndGroup


Group Optional_Properties
	bool property playerActivationOnly = true auto const
	{Should we block follower activation of this button? Default: False}

	bool property shouldAutoReset = False auto const
	{Should the button automatically return to the Inactive state after being pressed while in the active state? Assuming no other scripting, this effectively makes the button single-use. Default: False}

	String property inactiveStateAnimation = "TurnOff01" auto const
	{Name for the animation event called when the button enters the Inactive state. Default="Red"}

	String property activeStateAnimation = "TurnOn01" auto const
	{Name for the animation event called when the button enters the Active state. Default="Green"}
EndGroup

;gamebryo
;IdleOff
;PressOff
;TurnOn
;IdleOn
;PressOn
;TurnOff

;End
;OpenFull
;Press
;StartOn
;TurnOff01
;TurnOn01

Event OnLoad()
	;Block follower activation if desired.
	Self.SetNoFavorAllowed(playerActivationOnly)
	;Set initial state.
	CheckIfShouldBeActive()
	RegisterForCustomEvent(DN134, "CZLiftStateChanged")
EndEvent

Event OnUnload()
	UnRegisterForCustomEvent(DN134, "CZLiftStateChanged")
EndEvent


;Custom Event Sent from the quest, tells us when to check the globals
Event DN134QuestScript.CZLiftStateChanged(DN134QuestScript akSender, Var[] args)
	Debug.Trace(Self + ": Has Received Custom Event for Lift State Change")
	CheckIfShouldBeActive()
EndEvent

;==================================================
;				Functions
;==================================================
;
Function CheckIfShouldBeActive()
	if IsLiftOne
		if CZLift1Active.GetValue() == 1
			GoToState("Active")
		Else
			GoToState("Inactive")
		endif
	Else 	;Is Lift 2
		if CZLift2Active.GetValue() == 1
			GoToState("Active")
		Else
			GoToState("Inactive")
		endif
	endif
EndFunction

Function SetBusy(bool shouldBeBusy, bool returnToActive = True)
	if (shouldBeBusy)
		GoToState("Busy")
	ElseIf (returnToActive)
		GoToState("Active")
	Else
		GoToState("Inactive")
	EndIf
EndFunction	

;==================================================
;				States
;==================================================

State Inactive
	Event OnLoad()
		OnBeginState("")
	EndEvent

	Event OnBeginState(String asOldState)
		Self.WaitFor3DLoad()
		Self.PlayAnimation(InactiveStateAnimation)
		Self.BlockActivation(True)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		PlayAnimation(animationName)
		ToggleButtonInactiveMessage.Show()
	EndEvent
EndState

State Active
	Event OnLoad()
		OnBeginState("")
	EndEvent

	Event OnBeginState(String asOldState)
		Self.WaitFor3DLoad()
		Self.PlayAnimation(ActiveStateAnimation)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		PlayAnimation(animationName)
		DN134.LiftButtonPress(IsLiftOne)
	EndEvent
EndState

State Busy
	;Empty busy state that other scripts can force the button into temporarily.

	Event OnBeginState(String asOldState)
		Self.BlockActivation(False)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		;Do nothing.
	EndEvent
EndState