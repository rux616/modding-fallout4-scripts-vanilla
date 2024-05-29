Scriptname DLC03:VRDoorScript extends ObjectReference Hidden

;Event OnLoad()
;    GetLinkedRef()
;EndEvent
;
;Event OnPowerOn(ObjectReference akPowerGenerator)
;    SetOpen(TRUE)
;EndEvent
;
;Event OnPowerOff()
;    SetOpen(FALSE)
;EndEvent
;
;Event OnClose(ObjectReference akActionRef)
;    if self.IsPowered()
;    	SetOpen(TRUE)
;    endif
;EndEvent
;
;Event OnOpen(ObjectReference akActionRef)
;    if self.IsPowered() == FALSE
;    	SetOpen(FALSE)
;    endif
;EndEvent