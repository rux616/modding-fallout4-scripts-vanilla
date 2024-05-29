Scriptname DLC04:DLC04_KK_AddPAOnActivate extends DLC04:DLC04KiddieKingdomPATrigParent

bool Property DisableSelfOnActivate Auto Const
float Property ActivationDelay = 10.0 Auto Const

State Waiting
	Event OnActivate(ObjectReference akActionRef)
	    GoToState("Busy")
	    SendPAScene()
	    if DisableSelfOnActivate
	    	Disable()
	    else
	    	utility.Wait(ActivationDelay)
	    	GoToState("Waiting")
	    endif
	EndEvent
EndState


State Busy
EndState