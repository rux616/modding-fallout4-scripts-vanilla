Scriptname DN041_StartButtonScript extends ObjectReference

float property WaitTime01 Auto
Float property WaitTime02 Auto
 
Keyword property LinkCustom01 Auto 
Keyword property LinkCustom02 Auto 

;int RJTimer01 = 0 Const

Event OnActivate(ObjectReference akActionRef)
    	debug.trace("DN041 Circuit Breaker Activated")
    	utility.wait(WaitTime01)
    	Self.GetLinkedRef(LinkCustom01).EnableNoWait()
    	;Self.StartTimer(0.75,RJTimer01)
    	;gotostate("busyState")
    	utility.wait(WaitTime02)
    	Self.GetLinkedRef(LinkCustom02).Activate(GetLinkedRef(LinkCustom02))
EndEvent

;Event OnTimer(int aiTimerID)
;    if aiTimerID == RJTimer01
;    	Self.GetLinkedRef(LinkCustom01).Activate(Self)
;   	endif
;EndEvent 