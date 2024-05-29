Scriptname DN085RadioactiveGeyserTrigScript extends ObjectReference Hidden

Explosion Property DN085GeyserKnockdownExplosion Auto Const
Sound Property AMBGeyserGushALPM Auto Const
Bool bRunGeyserLoop = FALSE
Int GeyserTimer = 10

Event OnLoad()
	bRunGeyserLoop = TRUE
	StartTimer(Utility.RandomFLoat(8, 16), GeyserTimer)
EndEvent


Event OnTimer(int aiTimerID)
    if aiTimerID == GeyserTimer
    	if bRunGeyserLoop
			GetLinkedRef().Enable(1)
			int GeyserLoopInstance = AMBGeyserGushALPM.play(self)  
			Sound.SetInstanceVolume(GeyserLoopInstance, 1)
			GoToState("GeyserIsOn")
			Utility.Wait(Utility.RandomFLoat(8, 16))
			GetLinkedRef().Disable(1)
			Sound.StopInstance(GeyserLoopInstance)
			StartTimer(Utility.RandomFLoat(8, 16), GeyserTimer)
			GoToState("GeyserIsOff")
		endif
    endif
EndEvent


Event OnUnload()
	bRunGeyserLoop = FALSE
	CancelTimer(GeyserTimer)
	GetLinkedRef().Disable(1)
	GoToState("GeyserIsOff")
EndEvent


STATE GeyserIsOn
	Event OnTriggerEnter(ObjectReference akActionRef)
		if (akActionRef as Actor)
			if (akActionRef as Actor).IsDead()
		    	akActionRef.ApplyHavokImpulse(Utility.RandomFloat(-3, 3), Utility.RandomFloat(-3, 3), 10, 10000)
		    else
		    	akActionRef.PlaceAtMe(DN085GeyserKnockdownExplosion, 1)
		    	akActionRef.ApplyHavokImpulse(Utility.RandomFloat(-3, 3), Utility.RandomFloat(-3, 3), 10, 10000)
		    endif
		else
	    	akActionRef.ApplyHavokImpulse(Utility.RandomFloat(-3, 3), Utility.RandomFloat(-3, 3), 10, 7000)
	    endif
	EndEvent
EndSTATE


auto STATE GeyserIsOff

EndSTATE