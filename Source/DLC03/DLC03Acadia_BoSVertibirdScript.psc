Scriptname DLC03:DLC03Acadia_BoSVertibirdScript extends Quest

referenceAlias property Alias_Vertibird auto const mandatory 

function StartBoardingFailsafeTimer()
	StartTimer(30.0)
endFunction

event OnTimer(int aiTimerID)
	if getStageDone(20) == false
		actor vertibird = Alias_Vertibird.GetActorRef()
		if vertibird.IsFlying() == false
    		setStage(20)
    	else 
    		; run timer again
    		StartBoardingFailsafeTimer()
    	endif 
    endif
EndEvent