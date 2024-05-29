Scriptname StimObjectScript extends ObjectReference conditional
{Script to handle Stim Object functionality}

;****OBSOLETE... see AttractionObjectScript****


Bool Property RequiresLOS = true const auto
{Default = true;
NOTE: THIS WILL BECOME OBJECT DATA NOT SCRIPT DATA
It's only prototyped as script data}

bool Property IShouldActivate = false const auto
{Default = false; 
True = when DoMyThing(), Activate me}

bool Property IShouldEnable = false const auto
{Default = false; 
True = when DoMyThing(), Enable me}

bool Property IShouldDisable = false const auto
{Default = false; 
True = when DoMyThing(), Disable me}

bool Property IShouldUnlock = false const auto
{Default = false; 
True = when DoMyThing(), Unlock me}

bool Property IShouldLock = false const auto
{Default = false; 
True = when DoMyThing(), Lock me}

bool Property IShouldSendRecieveEvent = false const auto
{Default = false; 
True = when DoMyThing(), sends animation string StringEventSend to me, and I listen for the StringEventRecieve}


keyword Property LinkActivate const auto
{Autofill, or specify particular keyword for LinkRef to activate
LEAVE EMPTY if undesired
}

keyword Property LinkEnable const auto
{Autofill, or specify particular keyword for LinkRef to enable
LEAVE EMPTY if undesired
}

keyword Property LinkDisable const auto
{Autofill, or specify particular keyword for LinkRef to disable
LEAVE EMPTY if undesired
}

keyword Property LinkUnlock const auto
{Autofill, or specify particular keyword for LinkRef to unlock
LEAVE EMPTY if undesired
}

keyword Property LinkLock const auto
{Autofill, or specify particular keyword for LinkRef to unlock
LEAVE EMPTY if undesired
}

keyword Property LinkSendRecieveEvent const auto
{Autofill, or specify particular keyword for LinkRef to send animation event to
LEAVE EMPTY if undesired
}

String Property StringEventSend = "StimObjectSendEvent" const auto
{Default = StimObjectSendEvent; Specify the string to send to the LinkedRef with LinkSendRecieveEvent keyword}

String Property StringEventRecieve = "StimObjectRecieveEvent" const auto
{Default = StimObjectRecieveEvent; Specify the string to send to the LinkedRef with LinkSendRecieveEvent keyword
NOTE: Ignored unless ShouldWaitToRecieveEvent == true}

bool Property ShouldWaitToRecieveEvent = false const auto
{Default = False;
False == ignore StringEventRecieve
True == DoMyThing() will call PlayAnimationAndWait(StringEventSend, StringEventRecieve) waiting for BEFORE doing all the other things.}

bool property ShouldFadeInOnEnable = true const auto
{default = true}

bool property ShouldFadeOutOnDisable = true const auto
{default = true}

bool Property ShouldOnlyDoMyThingOnce = true const auto
{Default = true}

bool Property ShouldPlayerActivationDoMyThing = false const auto
{Default = false; If player activates me, should that trigger DoMyThing()}

bool Property ShouldNonPlayerActorActivationDoMyThing = false const auto
{Default = false; If someone other than the player activates me, should that trigger DoMyThing()}

bool Property ShouldNonActorActivationDoMyThing = false const auto
{Default = false; If something that isn't an actor activates me, should that trigger DoMyThing()}

bool Property ShouldBlockActivationOnLoad = false const auto
{Default = false; Should the OnLoad event block normal activation of this object}

int Property DidMyThing auto hidden conditional
{is an int to clarify condition functions}


Event OnLoad()
    if ShouldBlockActivationOnLoad
    	BlockActivation()
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer() && ShouldPlayerActivationDoMyThing
    	DoMyThing()
    elseif ShouldNonPlayerActorActivationDoMyThing && akActionRef as actor
    	DoMyThing()
    elseif ShouldNonActorActivationDoMyThing && (akActionRef as actor) == false && akActionRef != self ;because DoMyThing() might activate itself, we need to make sure we don't recur endlessly
    	DoMyThing()
    endif

EndEvent


int Function DoMyThing()
	debug.trace(self + "DoMyThing()")

	if ShouldOnlyDoMyThingOnce && DidMyThing
		debug.trace(self + "NOT DOING ANYTHING: ShouldOnlyDoMyThingOnce && DidMyThing")
		RETURN 0 ;returning a value for possible extendability needs
	endif	

	if ShouldWaitToRecieveEvent
		if IShouldSendRecieveEvent
			PlayAnimationAndWait(StringEventSend, StringEventRecieve)
		endif

		if LinkSendRecieveEvent
			GetLinkedRef(LinkSendRecieveEvent).PlayAnimationAndWait(StringEventSend, StringEventRecieve)
		endif

	else ;Should NOT WaitToRecieveEvent
		if LinkSendRecieveEvent
			PlayAnimation(StringEventSend)
		endif

		if LinkSendRecieveEvent
			GetLinkedRef(LinkSendRecieveEvent).PlayAnimation(StringEventSend)
		endif

	endif

	if IShouldUnlock
		Lock(False)
	endif

	if IShouldLock
		Lock(true)
	endif

	if IShouldDisable
		Disable(ShouldFadeOutOnDisable)
	endif

	if IShouldEnable
		Enable(ShouldFadeInOnEnable)
	endif

	if IShouldActivate
		Enable(self)
	endif

	if LinkUnlock
		GetLinkedRef(LinkUnlock).Lock(False)
	endif

	if LinkLock
		GetLinkedRef(LinkLock).Lock(true)
	endif

	if LinkDisable
		GetLinkedRef(LinkDisable).Disable(ShouldFadeOutOnDisable)
	endif

	if LinkEnable
		GetLinkedRef(LinkEnable).Enable(ShouldFadeInOnEnable)
	endif

	if LinkActivate
		GetLinkedRef(LinkActivate).Activate(self)
	endif

	DidMyThing = 1

	debug.trace(self + "DidMyThing == " + DidMyThing)


	RETURN 1 ;returning a value for possible extendability needs
EndFunction