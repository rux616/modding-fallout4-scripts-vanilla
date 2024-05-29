Scriptname DLC01:DLC01MQ04SetStageOnActivate extends ObjectReference

quest property DLC01FortHagenSatelliteArrayQuest auto
int property stagetoset auto

auto state waiting
Event OnActivate(ObjectReference akActionRef)
	if DLC01FortHagenSatelliteArrayQuest.getstage() >= 100 && DLC01FortHagenSatelliteArrayQuest.getstage() < 1000
		;If the player disarmed the trap, the trap also gets an activate event, but we *don't* want to play the scene in that case.
		;So wait until we know what state the trap is in before we set our stage.
		if (akActionRef is DLC01:DLC01AssaultronHeadTrapScript)
			String myState = (akActionRef as DLC01:DLC01AssaultronHeadTrapScript).GetState()
			int breakout = 0
			While ((breakout < 10) && (myState == "Waiting"))
				Utility.Wait(0.2)
				(akActionRef as DLC01:DLC01AssaultronHeadTrapScript).GetState()
				breakout = breakout + 1
			EndWhile
			if (myState == "Inactive")
				DLC01FortHagenSatelliteArrayQuest.setstage(stagetoset)
    				gotostate("done")
    			endif
    		ElseIf (akActionRef is TrapBase)
			String myState = (akActionRef as TrapBase).GetState()
			int breakout = 0
			While ((breakout < 10) && (myState == "Idle"))
				Utility.Wait(0.2)
				(akActionRef as TrapBase).GetState()
				breakout = breakout + 1
			EndWhile
			if (myState == "TrapFired")
				DLC01FortHagenSatelliteArrayQuest.setstage(stagetoset)
    				gotostate("done")
    			endif	
    		Else	
		    	DLC01FortHagenSatelliteArrayQuest.setstage(stagetoset)
		    	gotostate("done")
		EndIf
    endif
EndEvent
endstate

state done
endstate
