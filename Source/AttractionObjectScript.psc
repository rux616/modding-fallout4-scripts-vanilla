Scriptname AttractionObjectScript extends ObjectReference conditional
{Script to attach to objects used by the AttractionObject system

Based on keywords on this object and on actors, an actor might "decide" to interact with this object.
That will send a story manager event to start a quest.

The quest that fires up for the Actor interacting with this object will call:
DoMyThing()

The properties on this script define what DoMyThing() does.

If you need more functionality than this script provides, contact jduvall.
Do no copy and paste this script, extend it if you need additional functionality that can't be added to the core script.

}

Group Me

bool Property EnableMeOnLoad = true const auto
{Default = True; enable me on load}

bool Property ActivateMe = false const auto
{Default = false; 
True = when DoMyThing(), Activate me}

bool Property EnableMe = false const auto
{Default = false; 
True = when DoMyThing(), Enable me}

bool Property DisableMe = false const auto
{Default = false; 
True = when DoMyThing(), Disable me}

bool Property DeleteMe = false const auto
{Default = false; 
True = when DoMyThing(), Delete me}

bool Property UnlockMe = false const auto
{Default = false; 
True = when DoMyThing(), Unlock me}

bool Property LockMe = false const auto
{Default = false; 
True = when DoMyThing(), Lock me}

bool Property ISendRecieveEvent = false const auto
{Default = false; 
True = when DoMyThing(), sends animation string StringEventSend to me, and I listen for the StringEventRecieve}

bool Property DeleteAfterCleared = false Const Auto
{Default = false; If true this will be deleted when it is reloaded, if the location has ever been cleared
	This is primarily for locations that become workshops after they are cleared}

EndGroup

Group ActorDialogue
{Used by AO_Comment quest.
Actor will walk toward the Attraction Object for a few seconds, then say a line.
If the Attraction Obejct has a LinkedRef it will walk to that instead.
Then it will say the custom dialogue topic with the subtype of the specified keyword.
}

Keyword Property CustomTopicKeyword const auto
{Attracted Actor says this when SayMyThing()
FILTER FOR: "AO_Topic"
Topics live in AO_Comment_Dialogue Quest
}

bool Property FaceMarker = true auto conditional const
{Default: True;
True = Face the AO marker or it's linkedRef
False = Don't face (though if SayImmediately is also false, it will still orient toward it as it walks toward it)
}

bool Property FinishWalking = false auto conditional const
{Default: false;
True = Finish walking up to the object before saying the line
False = Walk toward the object for a few seconds, before saying the line and bailing out of the behavior.
}

bool Property SayImmediately = false auto conditional const
{Default: false;
True = for AO_Comment quest, skip the initial walk toward Marker/LinkedRef
False = walk toward the AO marker for a few seconds, or walk AO marker's LinkedRef before speaking)
}

EndGroup


Group LinkedRefs

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

EndGroup

Group Rules
{Note: AO Quest will  call DoMyThing() when the interaction is done. These are other rules.}


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

bool Property ShouldPlayerActivationClearBusy = false const auto
{Default = false; If player activates me, should that clear the Busy flag?}



EndGroup



int Property DidMyThing auto hidden conditional
{is an int to clarify condition functions}


bool Property Busy auto hidden conditional
{quests can mark this as busy so that other quests ignore it}


Event OnLoad()

	;DL - Added this to clear the object out if the location has ever been cleared
		;This way, once you've cleared it, left and come back, this will get deleted and not be said again
		;Primarily this is for locations that become workshops after they are cleared.
	if DeleteAfterCleared
		Location myLocation = GetCurrentLocation()

		if myLocation.HasEverBeenCleared()
			delete()
		endif
	endif


	if EnableMeOnLoad
		enable()
	endif

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

    if akActionRef == Game.GetPlayer() && ShouldPlayerActivationClearBusy
		busy = false
	endif
EndEvent


Function SetBusy(bool IsBusy = true)
	Busy = IsBusy
EndFunction

int Function SayMyThing(Actor myActor = None)
	if CustomTopicKeyword && myActor
		debug.trace(self + "Actor will say Topic Subtype " + CustomTopicKeyword)
		myActor.SayCustom(CustomTopicKeyword)
	endif
	
	RETURN 1 ;returning a value for possible extendability needs
EndFunction


int Function DoMyThing(Actor myActor = None)
	debug.trace(self + "DoMyThing() myActor =" + myActor)

	if ShouldOnlyDoMyThingOnce && DidMyThing
		debug.trace(self + "NOT DOING ANYTHING: ShouldOnlyDoMyThingOnce && DidMyThing")
		RETURN 0 ;returning a value for possible extendability needs
	endif	

	if ShouldWaitToRecieveEvent
		if ISendRecieveEvent
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

	if UnlockMe
		Lock(False)
	endif

	if LockMe
		Lock(true)
	endif

	if DisableMe
		Disable(ShouldFadeOutOnDisable)
	endif

	if DeleteMe
		Delete()
	endif

	if EnableMe
		Enable(ShouldFadeInOnEnable)
	endif

	if ActivateMe
		Activate(self)
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

	SetBusy(false)

	debug.trace(self + "DidMyThing == " + DidMyThing)


	RETURN 1 ;returning a value for possible extendability needs
EndFunction

; owning lights call this function to make me register to listen for deletion event
function RegisterForDeletionEvent(DefaultRemoveableLight myOwner)
	if myOwner
		RegisterForCustomEvent(myOwner, "AO_DeleteMarkerEvent")
	endif
EndFunction

; delete myself when delete marker event received
Event DefaultRemoveableLight.AO_DeleteMarkerEvent(DefaultRemoveableLight akSender, Var[] akArgs)
	Delete()
endEvent