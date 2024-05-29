Scriptname Default2StateActivator extends ObjectReference Conditional Default
{For any activator with standard open/close states.}

import debug
import utility

Group Required_Properties
	string property openAnim = "open" auto
	{Animation to play when opening}

	string property closeAnim = "close" auto
	{Animation to play when closing}

	string property openEvent = "opening" auto
	{Open event name - waits for this event before considering itself "open"}

	string property closeEvent = "closing" auto
	{Close event name - waits for this event before considering itself "closed"}
EndGroup

Group Optional_Properties
	bool property isOpen = FALSE auto conditional
	{Set to TRUE ot start open.}

	bool property doOnce = FALSE auto
	{Set to TRUE to open/close on first activation only.}

	bool property shouldSetDefaultState = TRUE auto const
	{Should this activator use SetDefaultState? Set to False only for Activators with identical open/close events.}

	string property startOpenAnim = "opened" auto
	{OnLoad calls this if the object starts in the open state}

	bool property AllowInterrupt = FALSE auto
	{Allow interrupts while animation? Default: FALSE}

	bool property InvertCollision = FALSE auto
	{Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be 
	Disabled onOpen, and Enabled on Close.  If you want that functionality inverted set this to TRUE}
EndGroup


Group Autofill_Properties
	keyword property TwoStateCollisionKeyword auto
	{Keword to link to the collision you want to enable/disable based on this activators opened/closed state.}
EndGroup


bool property isAnimating = false auto Hidden conditional
{Is the activator currently animating from one state to another?}

bool property shouldOpenNext = true auto Hidden conditional
{Used for SetOpenNoWait. Should we open when the timer fires?}

int property myState = 1 auto hidden conditional
{true when static or animating
 0 == open or opening
 1 == closed or closing}

EVENT OnLoad()
	if (shouldSetDefaultState)
		SetDefaultState()
	EndIf
endEVENT

Event OnReset()
	if (shouldSetDefaultState)
		SetDefaultState()
	EndIf
EndEvent

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Function SetDefaultState()
	if (isOpen)
		playAnimationandWait(startOpenAnim, openEvent)

		if (InvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 0
	Else
		playAnimationandWait(closeAnim, closeEvent)
		
		if (InvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 1
	EndIf
EndFunction

auto STATE waiting	; waiting to be activated
	EVENT onActivate (objectReference triggerRef)
; 		Debug.Trace("d2SA RESETS: " + Self + " " + isOpen)
		; switch open state when activated
		SetOpen(!isOpen)
		if (doOnce)
			gotostate("done")
		endif
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			if AllowInterrupt == TRUE
				; send the activation\
				SetOpen(!isOpen)
			else
				; block activation
				trace (self + " Busy")
			endif
		endEVENT
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
		trace(self + " Opening " + openAnim)
		if AllowInterrupt == TRUE || !Is3DLoaded()
			playAnimation(openAnim) ; Animate Open
		else
			playAnimationandWait(openAnim, openEvent) ; Animate Open
		endif
		trace(self + " Opened")

		if (InvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif

		isOpen = true
		gotoState("waiting")
	elseif !abOpen && isOpen
		gotoState ("busy")
		trace(self + " Closing " + closeAnim)
		if AllowInterrupt == TRUE || !Is3DLoaded()
			playAnimation(closeAnim)
		else
			playAnimationandWait(closeAnim, closeEvent) ; Animate Closed
		endif
		trace(self + " Closed")
		
		if (InvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif

		isOpen = false
		gotoState("waiting")
	endif
	isAnimating = false
endFunction