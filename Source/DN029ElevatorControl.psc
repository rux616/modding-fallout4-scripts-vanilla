Scriptname DN029ElevatorControl extends ObjectReference Hidden

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto

ObjectReference PlatformHelper
ObjectReference TopTrigger
ObjectReference BottomTrigger
ObjectReference CallTrigger


Event OnInit()
	debug.Trace(self + "OnInit()")
	PlatformHelper = GetLinkedRef()
    TopTrigger = GetLinkedRef(LinkCustom01)
    BottomTrigger = GetLinkedRef(LinkCustom02)
    CallTrigger = GetLinkedRef(LinkCustom03)
EndEvent


Event OnLoad()
	debug.Trace(self + "OnLoad()")
    RegisterForRemoteEvent(TopTrigger, "OnTriggerEnter")
    RegisterForRemoteEvent(BottomTrigger, "OnTriggerEnter")
    RegisterForRemoteEvent(CallTrigger, "OnTriggerEnter")
    RegisterForRemoteEvent(CallTrigger, "OnTriggerLeave")
	;PlatformHelper.PlayAnimationAndWait("Play01", "End")
EndEvent


STATE TopPosition

	Event OnBeginState(string asOldState)
		if CallTrigger.GetTriggerObjectCount() > 0
			GoToState("Busy")
	    	PlatformHelper.PlayAnimationAndWait("Play01", "End")
	    	GoToState("BottomPosition")
	    endif
	EndEvent

	Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
		debug.Trace(self + "Remote OnTriggerEnter() in STATE TopPosition")

		if akSender == TopTrigger
			GoToState("Busy")
	    	PlatformHelper.PlayAnimationAndWait("Play01", "End")
	    	GoToState("BottomPosition")
	    endif

	    if akSender == CallTrigger
	    	GoToState("Busy")
	    	PlatformHelper.PlayAnimationAndWait("Play01", "End")
	    	GoToState("BottomPosition")
	    endif

	EndEvent
EndSTATE


STATE BottomPosition

	Event OnBeginState(string asOldState)
		if CallTrigger.GetTriggerObjectCount() == 0
			GoToState("Busy")
	    	PlatformHelper.PlayAnimationAndWait("Play01", "End")
	    	GoToState("TopPosition")
	    endif
	EndEvent

	Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
		debug.Trace(self + "Remote OnTriggerEnter() in STATE BottomPosition")

		if akSender == BottomTrigger
			GoToState("Busy")
	    	PlatformHelper.PlayAnimationAndWait("Play01", "End")
	    	GoToState("TopPosition")
	    endif

	EndEvent

	Event ObjectReference.OnTriggerLeave(ObjectReference akSender, ObjectReference akActionRef)
		debug.Trace(self + "Remote OnTriggerLeave() in STATE BottomPosition")

		if akSender == CallTrigger
			GoToState("Busy")
	    	PlatformHelper.PlayAnimationAndWait("Play01", "End")
	    	GoToState("TopPosition")
	    endif

	EndEvent
EndSTATE


auto STATE Busy
	Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
		debug.Trace(self + "Remote OnTriggerEnter() in STATE Busy")
		;Do Nothing
	EndEvent
EndSTATE


Function AllowUse()
	GoToState("TopPosition")
	TopTrigger.EnableNoWait()
	BottomTrigger.EnableNoWait()
	CallTrigger.EnableNoWait()
EndFunction

Function DisallowUse()
	GoToState("Busy")
	TopTrigger.DisableNoWait()
	BottomTrigger.DisableNoWait()
	CallTrigger.DisableNoWait()
EndFunction


	; Cause I have to
Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
	;Do Nothing
EndEvent
Event ObjectReference.OnTriggerLeave(ObjectReference akSender, ObjectReference akActionRef)
	;Do Nothing
EndEvent