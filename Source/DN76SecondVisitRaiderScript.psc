Scriptname DN76SecondVisitRaiderScript extends ObjectReference Hidden

ObjectReference Property DN76PreQuestBossRef const auto
Quest Property Inst301 const auto

auto STATE WaitingForQuest
	Event OnLoad()
			; If the boss is dead, and Inst301 Stage 200 is done.
	    if (DN76PreQuestBossRef as Actor).IsDead() && Inst301.GetStageDone(200)
	    	GoToState("Done")
	    	self.EnableNoWait()
	    endif
	EndEvent
EndSTATE

STATE Done
	;Done and done
EndSTATE