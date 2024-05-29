Scriptname DN076PostQuestBossScript extends ObjectReference Hidden

Quest Property Inst301 Auto Const Mandatory
ActorBase Property DN076_LvlRaiderBoss Auto Const Mandatory

Event OnLoad()
    

	    ; If the Quest is running, then disable this boss.
	if Inst301.IsRunning()
		self.DisableNoWait()
	else
			; If the Quest is NOT running, and these stages have been set, then enable the boss.
		if Inst301.IsStageDone(1000) || Inst301.IsStageDone(1500)
    		self.EnableNoWait()
    	endif
    	
    		; If the Quest is NOT running, and the Pre-Quest Boss is dead, then enable the boss
    	if DN076_LvlRaiderBoss.GetDeadCount() > 0
    		self.EnableNoWait()
    	endif
	endif
EndEvent