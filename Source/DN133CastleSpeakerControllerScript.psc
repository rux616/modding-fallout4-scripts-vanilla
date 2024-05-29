ScriptName DN133CastleSpeakerControllerScript Extends ObjectReference
{}


import debug
import utility

CustomEvent DN133SpeakerSet

Group Required_Properties
	string property openAnim = "open" auto
	{Animation to play when opening}

	string property closeAnim = "close" auto
	{Animation to play when closing}

	string property openEvent = "opening" auto
	{Open event name - waits for this event before considering itself "open"}

	string property closeEvent = "closing" auto
	{Close event name - waits for this event before considering itself "closed"}

	globalVariable property DN133CastleRadioSpeakersAreOn auto
	{check this global and use it for toggling}
EndGroup

Group Optional_Properties
	bool property isOpen = false	auto conditional
	{Set to TRUE ot start open.}

	bool property doOnce = false auto
	{Set to TRUE to open/close on first activation only.}

	string property startOpenAnim = "opened" auto
	{OnLoad calls this if the object starts in the open state}

	bool property AllowInterrupt = FALSE auto
	{Allow interrupts while animation? Default: FALSE}

EndGroup



bool property isAnimating = false auto Hidden conditional
{Is the activator currently animating from one state to another?}

bool property shouldOpenNext = true auto Hidden conditional
{Used for SetOpenNoWait. Should we open when the timer fires?}

int property myState = 1 auto hidden
{true when static or animating
 0 == open or opening
 1 == closed or closing}

EVENT OnLoad()
	SetDefaultState()
endEVENT

Event OnReset()
	SetDefaultState()
EndEvent

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Function SetDefaultState()
	if (DN133CastleRadioSpeakersAreOn.getValueInt() == 1)
		playAnimation(startOpenAnim)
		isOpen = true
		;DN133CastleRadioSpeakersAreOn.SetValue(0)
	Else
		playAnimation(closeAnim)
		isOpen = false
		;DN133CastleRadioSpeakersAreOn.SetValue(1)
	EndIf
EndFunction

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
; 		Debug.Trace("d2SA RESETS: " + Self + " " + isOpen)
		; switch open state when activated
		int localOpen = DN133CastleRadioSpeakersAreOn.GetValueInt()
		if localOpen == 1
			SetOpen(false)
		else
			SetOpen(true)
		endif
		if (doOnce)
			gotostate("done")
		endif
	endEVENT
endState

Function SetOn(bool shouldBeOn = true)
	if shouldBeOn
		SetOpen(true)
	else
		SetOpen(false)
	endif
EndFunction

STATE busy
	; This is the state when I'm busy animating
	;/
		EVENT onActivate (objectReference triggerRef)
			if AllowInterrupt == TRUE
				; send the activation\
				SetOpen(!isOpen)
			else
				; block activation
				trace (self + " Busy")
			endif
		endEVENT
		/;
endSTATE

STATE done
	EVENT onActivate (objectReference triggerRef)
		;Do nothing
	endEVENT
endSTATE

function SetOpenNoWait(bool abOpen = true)
     shouldOpenNext = abOpen
     StartTimer(0)
endFunction

event OnTimer(int timerID)
     SetOpen(shouldOpenNext)
endEvent

function SetOpen(bool abOpen = true)
	; if busy, wait to finish
	while getState() == "busy"
		wait(1)
	endWhile
	; open/close if necessary
	isAnimating = true
	if abOpen && !isOpen
		gotoState ("busy")
		debug.trace(self + " Opening " + openAnim)
		if AllowInterrupt == TRUE || !Is3DLoaded()
			PlayAnimation("Powered")
			playAnimation(openAnim) ; Animate Open
		else
			PlayAnimation("Powered")
			playAnimationandWait(openAnim, openEvent) ; Animate Open
		endif
		debug.trace(self + " Opened")

		DN133CastleRadioSpeakersAreOn.SetValue(1)
		isOpen = true
		gotoState("waiting")
	elseif !abOpen && isOpen
		gotoState ("busy")
		trace(self + " Closing " + closeAnim)
		if AllowInterrupt == TRUE || !Is3DLoaded()
			PlayAnimation("Powered")
			playAnimation(closeAnim)
		else
			PlayAnimation("Powered")
			playAnimationandWait(closeAnim, closeEvent) ; Animate Closed
		endif
		trace(self + " Closed")
		
		isOpen = false
		DN133CastleRadioSpeakersAreOn.SetValue(0)
		gotoState("waiting")
	endif
	SendCustomEvent("DN133SpeakerSet")
	GetLinkedRef().Activate(GetLinkedRef())
	debug.Trace(self + ": has set DN133CastleRadioSpeakersAreOn to " + abOpen)
	debug.Trace(self + ": DN133CastleRadioSpeakersAreOn == " + DN133CastleRadioSpeakersAreOn.GetValue())
	isAnimating = false
endFunction


Event OnCellAttach()
	PlayAnimation("Powered")
EndEvent