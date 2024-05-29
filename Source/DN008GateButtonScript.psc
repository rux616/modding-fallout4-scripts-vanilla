Scriptname DN008GateButtonScript extends ObjectReference Hidden

Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const
Keyword Property LinkCustom05 Auto Const
Sound Property DRSJunkyardMegaloaderOpen Auto Const
Sound Property DRSJunkyardMegaloaderClose Auto Const

Int GateSoundInstance

int iGateCount = 0

Event OnLoad()
    RegisterForAnimationEvent(GetLinkedRef(LinkCustom01), "done")
    RegisterForAnimationEvent(GetLinkedRef(LinkCustom02), "done")
    GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fspeed", 5.5)
    GetLinkedRef(LinkCustom02).SetAnimationVariableFloat("fspeed", 5.5)
EndEvent

auto STATE GateClosed
	Event OnActivate(ObjectReference akActionRef)
	    GoToState("GateOpening")
	    GateSoundInstance = DRSJunkyardMegaloaderOpen.Play(GetLinkedRef(LinkCustom05))
	    utility.Wait(2)
	   	GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fvalue", 9)
	    GetLinkedRef(LinkCustom01).PlayAnimation("play01")
	    utility.Wait(0.25)
	   	GetLinkedRef(LinkCustom02).SetAnimationVariableFloat("fvalue", -9)
	    GetLinkedRef(LinkCustom02).PlayAnimation("play01")
	EndEvent
EndSTATE

STATE GateClosing

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

		if (akSource == GetLinkedRef(LinkCustom01)) || (akSource == GetLinkedRef(LinkCustom02))
	    	if asEventName == "done"
	    		iGateCount = iGateCount + 1
	    	endif
	    endif

	    if iGateCount >= 2
	    	iGateCount = 0
	    	GoToState("GateClosed")
	    	GetLinkedRef(LinkCustom03).EnableNoWait()
	    	GetLinkedRef(LinkCustom04).EnableNoWait()
	    endif

	EndEvent

EndSTATE

STATE GateOpening

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)

		if (akSource == GetLinkedRef(LinkCustom01)) || (akSource == GetLinkedRef(LinkCustom02))
	    	if asEventName == "done"
	    		iGateCount = iGateCount + 1
	    	endif
	    endif

	    if iGateCount >= 2
	    	iGateCount = 0
	    	GoToState("GateOpened")
	    	GetLinkedRef(LinkCustom03).DisableNoWait()
	    	GetLinkedRef(LinkCustom04).DisableNoWait()
	    endif

	EndEvent

EndSTATE

STATE GateOpened
	Event OnActivate(ObjectReference akActionRef)
	    GoToState("GateClosing")
	    GateSoundInstance = DRSJunkyardMegaloaderClose.Play(GetLinkedRef(LinkCustom05))
	    utility.Wait(2)
	   	GetLinkedRef(LinkCustom01).SetAnimationVariableFloat("fvalue", 0)
	    GetLinkedRef(LinkCustom01).PlayAnimation("play01")
	    utility.Wait(0.25)
	   	GetLinkedRef(LinkCustom02).SetAnimationVariableFloat("fvalue", 0)
	    GetLinkedRef(LinkCustom02).PlayAnimation("play01")
	EndEvent
EndSTATE