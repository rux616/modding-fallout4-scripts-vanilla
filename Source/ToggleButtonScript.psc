Scriptname ToggleButtonScript extends ObjectReference
{Script for a button with active and inactive states.}

Group Required_Properties
	Message property ToggleButtonInactiveMessage auto
	{Failure message to display if the player presses the button while it's in its inactive state. Can be changed via script if desired.}

	String property animationName = "Press" auto const
	{Animation to play when the button is activated.}
EndGroup

Group Optional_Properties
	bool property startsActive = False auto const
	{Should the button start in the Active state? Default: False}

	bool property playerActivationOnly = False auto const
	{Should we block follower activation of this button? Default: False}

	bool property shouldAutoReset = False auto const
	{Should the button automatically return to the Inactive state after being pressed while in the active state? Assuming no other scripting, this effectively makes the button single-use. Default: False}

	Keyword property LinkedRefToActivate auto const
	{Keyword of a linked ref to activate when the button is successfully pressed. If None, don't activate anything.}

	String property inactiveStateAnimation = "TurnOff01" auto const
	{Name for the animation event called when the button enters the Inactive state. Default="Red"}

	String property activeStateAnimation = "TurnOn01" auto const
	{Name for the animation event called when the button enters the Active state. Default="Green"}
EndGroup

bool animationStateInactive = True		;Is the button currently in the 'Inactive' animation state? Used to minimize warning spam.
bool shouldBeActiveNext = False		;Used for SetActiveNoWait, the whether the button should be active once the timer returns.

Event OnLoad()
	;Block follower activation if desired.
	Self.SetNoFavorAllowed(playerActivationOnly)
	;Set initial state.
	SetActive(startsActive)
EndEvent

Function SetActive(bool shouldBeActive)
	Self.WaitFor3DLoad()
	if (shouldBeActive)
		if (GetState() != "Active")
			if (animationStateInactive)
				Self.PlayAnimationAndWait(ActiveStateAnimation, "End")
				animationStateInactive = False
			EndIf
			Self.BlockActivation(False)
			GoToState("Active")
		EndIf
	Else
		if (GetState() != "Inactive")
			if (!animationStateInactive)
				Self.PlayAnimationAndWait(InactiveStateAnimation, "End")
				animationStateInactive = True
			EndIf
			Self.BlockActivation(True)
			GoToState("Inactive")
		EndIf
	EndIf
EndFunction

Function SetActiveNoWait(bool shouldBeActive)
	shouldBeActiveNext = shouldBeActive
	StartTimer(0)
EndFunction

Event OnTimer(int timerID)
	SetActive(shouldBeActiveNext)
EndEvent


Function SetBusy(bool shouldBeBusy, bool returnToActive = True)
	Self.WaitFor3DLoad()
	if (shouldBeBusy)
		if (GetState() != "Busy")
			Self.BlockActivation(True)
			GoToState("Busy")
		EndIf
	Else
		SetActive(returnToActive)
	EndIf
EndFunction


State Inactive
	Event OnActivate(ObjectReference akActionRef)
		SetBusy(True)
		PlayAnimationAndWait(animationName, "End")
		ToggleButtonInactiveMessage.Show()
		SetBusy(False, False)
	EndEvent
EndState

State Active
	Event OnActivate(ObjectReference akActionRef)
		SetBusy(True)
		PlayAnimationAndWait(animationName, "End")
		if ((LinkedRefToActivate != None) && (Self.GetLinkedRef(LinkedRefToActivate) != None))
			Self.GetLinkedRef(LinkedRefToActivate).Activate(akActionRef)
		EndIf
		if (shouldAutoReset)
			SetBusy(False, False)
		Else
			SetBusy(False, True)
		EndIf
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActionRef)
		;Do nothing.
	EndEvent
EndState