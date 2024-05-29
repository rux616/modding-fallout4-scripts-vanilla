Scriptname DN144CorpseHavokImpulseTrigScript extends ObjectReference Hidden

Bool Property isPlayerTrig = FALSE const auto		
Keyword Property LinkCustom01 const auto
Sound Property StringHit const auto	


auto STATE WaitForTrigger
	Event OnTriggerEnter(ObjectReference akActionRef)
	    if isPlayerTrig && akActionRef == Game.GetPlayer()
	    	GoToState("Done")
	    	int StringHitInstance = StringHit.play(self)
	    	;GetLinkedRef(LinkCustom01).EnableNoWait()
	    	StartTimer(1)
	    	(GetLinkedRef() as DN144CorpseHavokImpulse).StartEatingCorpse()
	    	utility.Wait(3)
	    	GetLinkedRef(LinkCustom01).DisableNoWait()
	    endif

	    if !isPlayerTrig && akActionRef == GetLinkedRef()
	    	GoToState("Done")
	    	(GetLinkedRef() as DN144CorpseHavokImpulse).StopHavoking = TRUE
	    endif
	EndEvent
ENDSTATE

STATE Done
	;All done doing things
ENDSTATE


Event OnTimer(int aiTimerID)
    GetLinkedRef(LinkCustom01).EnableNoWait()
EndEvent