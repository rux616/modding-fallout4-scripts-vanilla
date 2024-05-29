Scriptname DN76ElevatorCollisionFailsafe extends ObjectReference Hidden

Keyword Property LinkCustom01 const auto

auto STATE Waiting

    Event OnTriggerEnter(ObjectReference akActionRef)
        if akActionRef == Game.GetPlayer()
    		if GetLinkedRef(LinkCustom01).IsDisabled() == FALSE
                GoToState("Done")
    			StartTimer(13, 123)
    			debug.Trace("Timer Started!")
                utility.Wait(2)
                ;self.DisableNoWait()
    		endif
        endif
    EndEvent

EndSTATE

STATE Done

EndSTATE

Event OnTimer(int aiTimerID)
    if aiTimerID == 123
    	debug.Trace("Timer Ended")
    	GetLinkedRef(LinkCustom01).Disable()
    endif
EndEvent

Event OnReset()
    GetLinkedRef(LinkCustom01).Enable()
EndEvent