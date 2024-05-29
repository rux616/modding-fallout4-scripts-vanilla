ScriptName MirelurkHatchableScript extends ObjectReference
{}


int timerIDHatchTimer
float timerMin = 2.0
float timerMax = 7.0

Explosion Property MirelurkSpawnHatchExpl Auto

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		if !isDisabled() && !isDestroyed()
			if akActionRef as Actor 
				Hatch()
			else
				utility.wait(utility.RandomFloat(0.0, 1.5))
				PlayAnimation("Shake")
				startTimer(utility.randomFloat(timerMin, timerMax), timerIDHatchTimer)
			endif
		endif
	EndEvent

	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	    if aicurrentStage == 2
	    	GoToState("Done")
	    endif
	EndEvent
EndState

;Do nothing, we've hatched! Babies!!
State Done
	Event OnBeginState(string asOldState)
	    CancelTimer(timerIDHatchTimer)
	    ; tell my nest that I've hatched/been destroyed
	    MirelurkNestScript myNest = GetLinkedRef() as MirelurkNestScript
	    if myNest
	    	myNest.CheckEggStatus()
	    endif
	EndEvent
EndState

Event OnTimer(int aiTimerID)
    if timerIDHatchTimer == aiTimerID && !isDestroyed()
    	Hatch()
    endif
EndEvent

Function Hatch()
	GoToState("Done")
	PlayAnimation("Hatch")
	PlaceAtMe(MirelurkSpawnHatchExpl)
	DamageObject(50)
EndFunction


Event onReset()
	setDestroyed(false)
	clearDestruction()
	Reset()
endEvent