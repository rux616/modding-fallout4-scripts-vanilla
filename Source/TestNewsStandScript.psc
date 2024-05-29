Scriptname TestNewsStandScript extends ObjectReference
{A quick hack so that activate causes it to animate.}

State Open
	Event OnActivate(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
EndState

Event OnActivate(ObjectReference akActionRef)
	GotoState("Open")
	debug.trace(self + "OnActivate()")
    playanimation("Open")
EndEvent