Scriptname CodsworthShrubTrimming extends ObjectReference
{MAkes the bushes he is cutting animate}
ObjectReference Property Codsworth1ref Auto Const
{Codsworth post war still trimming}
Actor Property bushTrimmer Auto
{play anim when this actor is in trigger}

Event OnUnload()
    UnregisterForAnimationEvent(bushTrimmer, "SawSwipeLeft")
    UnregisterForAnimationEvent(bushTrimmer, "SawSwipeRight")
EndEvent

Auto State waiting
	Event OnLoad()
	    ;Register for the two events we need for saw swipes
	  ;  RegisterForAnimationEvent(bushTrimmer, "SawSwipeLeft")
	  ;  RegisterForAnimationEvent(bushTrimmer, "SawSwipeRight")

	EndEvent
	Event OnTriggerEnter(ObjectReference akActionRef)
		;Confirm we are the activly trimmed bush via trigger box
		;Debug.Trace(akActionRef + " entered trigger")
		if akActionRef == Codsworth1ref
			;Register for the two events we need for saw swipes
		    RegisterForAnimationEvent(bushTrimmer, "SawSwipeLeft")
		    RegisterForAnimationEvent(bushTrimmer, "SawSwipeRight")
		    GotoState("waitingToAnimate")
		 endif
	EndEvent
EndState

State waitingToAnimate
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		;Animate the bush in the correct direction
		if asEventName == "SawSwipeLeft"
			;Debug.Trace("Got my event left")
		    PlayAnimation("CharFXBurstA")
		 elseIf asEventName == "SawSwipeRight"
			;Debug.Trace("Got my event right")
		    PlayAnimation("CharFXBurstB")
		 endIf
	EndEvent
	Event OnTriggerLeave(ObjectReference akActionRef)
		;Debug.Trace(akActionRef + " left trigger")
		if akActionRef == Codsworth1ref
			;go back to waiting for handy to return
		    GotoState("waiting")
		endIf
	EndEvent
EndState