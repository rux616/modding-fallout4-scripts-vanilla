Scriptname TwoStateWithGlobalActivator extends ObjectReference Conditional Default
{Use for when you have a two state activator that you need to retain it's open/closed state even after a cell reset
	You will need to create your own global to point the property to, this tracks the open/closed state}

import debug
import utility

Group Required_Properties
	string property openAnim = "open" auto const
	{Animation to play when opening}

	string property closeAnim = "close" auto const
	{Animation to play when closing}

	string property openEvent = "opening" auto const
	{Open event name - waits for this event before considering itself "open"}

	string property closeEvent = "closing" auto const
	{Close event name - waits for this event before considering itself "closed"}

	globalVariable property myGlobal auto const
	{check this global and use it for toggling}
EndGroup

Group Optional_Properties
	bool property isOpen = false auto conditional
	{Set to TRUE ot start open.}

	bool property doOnce = false auto
	{Set to TRUE to open/close on first activation only.}

	string property startOpenAnim = "opened" auto const
	{OnLoad calls this if the object starts in the open state}

	bool property AllowInterrupt = FALSE auto const
	{Allow interrupts while animation? Default: FALSE}

	bool property InvertCollision = FALSE auto const
	{Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be 
	Enabled onOpen, and Disabled on Close.  If you want that functionality inverted set this to TRUE}
EndGroup


Group Autofill_Properties
	keyword property TwoStateCollisionKeyword auto const
	{Keword to link to the collision you want to enable/disable based on this activators opened/closed state.}
EndGroup


bool property isAnimating = false auto Hidden conditional
{Is the activator currently animating from one state to another?}

bool property shouldOpenNext = true auto Hidden conditional
{Used for SetOpenNoWait. Should we open when the timer fires?}

int property myState = 1 auto hidden Conditional
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
	if (myGlobal.getValueInt() == 1)
		myState = 0 ; open/ing
		playAnimationandWait(startOpenAnim, openEvent)

		if (InvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif
		isOpen = True
		;myGlobal.SetValue(0)
	Else
		myState = 1 ; close/ing
		playAnimationandWait(closeAnim, closeEvent)
		
		if (InvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif
		isOpen = false
		;myGlobal.SetValue(1)
	EndIf
EndFunction

; waiting to be activated
auto STATE waiting	

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
		myState = 0 ; open/ing
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

		myGlobal.SetValue(1)
		isOpen = True
		gotoState("waiting")
	elseif !abOpen && isOpen
		gotoState ("busy")
		trace(self + " Closing " + closeAnim)
		myState = 1 ; close/ing
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
		myGlobal.SetValue(0)
		gotoState("waiting")
	endif
	isAnimating = false
endFunction