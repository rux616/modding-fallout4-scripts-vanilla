Scriptname KendallHospitalCorpseScript extends ObjectReference Hidden

Keyword Property LinkCustom01 auto
;Int HavokTimer = 10

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		GetLinkedRef().ApplyHavokImpulse(1.0, 0.0, 0.0, 450.0)
		(GetLinkedRef(LinkCustom01) as Actor).SetLookAt(GetLinkedRef())
		Utility.Wait(4)
		(GetLinkedRef(LinkCustom01) as Actor).ClearLookAt()
	    DisableNoWait()
	    Delete()
	endif
	;RegisterForDetectionLOSGain(Game.GetPlayer(),GetLinkedRef())
	;StartTimer(10, HavokTimer)
EndEvent

;Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
	;GetLinkedRef().ApplyHavokImpulse(0.0, 100.0, 1.0, 0.0)
    ;DisableNoWait()
   ; Delete()
;endEvent

;Event OnTimer(int aiTimerID)
    ;GetLinkedRef().ApplyHavokImpulse(0.0, 100.0, 1.0, 0.0)
    ;DisableNoWait()
    ;Delete()