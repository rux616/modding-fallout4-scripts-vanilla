Scriptname TrapMonkeyTriggerScript extends ObjectReference

Group AnimNames CollapsedOnRef
	String Property Trip = "Trip" auto const	
	String Property Arm = "Arm" auto const
	string Property Set = "Set" auto const
	String Property Disarm = "Disarm" auto const
	String Property TransitionComplete = "TransitionComplete" Auto const
	String Property ResetAnim = "Reset" Auto const
EndGroup

int Property aiSoundLevel auto

Sound Property ArmSound auto
Sound Property TriggerSound auto
Sound Property ResetSound auto

float property WarnTime = 3.0 Auto const
Int property WarnTimerNumber = 100 Auto Const


Float Property AlarmTime = 10.0 Auto const
int Property AlarmTimerNumber = 200 auto const

keyword Property MonkeyTrap Auto

ObjectReference[] property Monkey auto hidden

;int[] Property TriggerSoundInstances auto

Event OnCellLoad()
		Monkey = GetlinkedrefChain(MonkeyTrap)
		int i = 0
		int MonkeyCount = Monkey.length
		while (i < MonkeyCount)
			ObjectReference CurrentMonkey = Monkey[i]
			CurrentMonkey.PlayAnimation(ResetAnim)
			i += 1
		endwhile
EndEvent

Event OnReset()
		Monkey = GetlinkedrefChain(MonkeyTrap)
		int i = 0
		int MonkeyCount = Monkey.length
		while (i < MonkeyCount)
			ObjectReference CurrentMonkey = Monkey[i]
			CurrentMonkey.Enable()
			CurrentMonkey.PlayAnimation(ResetAnim)
			CurrentMonkey.ClearDestruction()
			CurrentMonkey.Reset()
			i += 1
		endwhile
		gotoState ("Active")
EndEvent

Auto State Active

	Event OnCellAttach()
	    ;Monkey = Getlinkedref(Monkeytrap)
	EndEvent

	Event OnBeginState(string asOldState)		

		if ((asOldState == "Warn") || (asOldState == "Tripped"))
			int i = 0
			Int MonkeyCount = Monkey.length
			Int DeadMonkeyCount = 0
			while (i <MonkeyCount)
				ObjectReference CurrentMonkey = Monkey[i]
				if (CurrentMonkey.IsDestroyed() == FALSE)
					;Resetsound.Play(CurrentMonkey)
					CurrentMonkey.PlayAnimationandWait(Set,TransitionComplete)
					utility.wait(utility.randomfloat(0.1,0.2))
				else
					DeadMonkeyCount += 1  	
				endif
					i += 1
			endwhile
			if DeadMonkeyCount >= MonkeyCount
				gotostate("DeadMonkey")
			endif
		endif    
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		if(akActionRef == game.getPlayer())
			debug.trace("Motion Detector Monkey: Trigger Entered")
			if (akActionRef as actor).isSneaking()
				debug.trace("Motion Detector Monkey: player has entereted trigger, but is sneaking.")
				; register to catch when the player un-sneaks
				if registerForAnimationEvent(game.getPlayer(), "sneakStateExit")
					debug.trace("Motion Detector Monkey: Anim registration successful")
				else
					debug.trace("Motion Detector Monkey: Anim Registration Failed")
				endif
			else
				gotostate("Warn")
			endif
		endif
	endEvent


	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		debug.trace("Motion Detector Monkey: I've caught anim event "+asEventName+" from "+akSource)
	    if (akSource == game.getPlayer() && (asEventName == "sneakStateExit"))
	    	; we caught the player un-sneaking within our trigger zone.
	    	gotostate("Warn")
	    endif
	EndEvent


	event OnTriggerLeave(ObjectReference akActionRef)
		; We only care about this if the player was sneaking and left without ever entering warn state
		debug.trace("Motion Detector Monkey: received a trigger leave within active state")
		unRegisterForanimationEvent(akActionRef, "sneakStateExit")
	endEvent

endState

state Warn

	Event OnBeginState(string asOldState)
	    if asOldState == "Active"
			int i = 0
			Int MonkeyCount = Monkey.length
			Int DeadMonkeyCount = 0
			while (i <MonkeyCount)
				ObjectReference CurrentMonkey = Monkey[i]
				if (CurrentMonkey.IsDestroyed() == FALSE)
					CurrentMonkey.playAnimation(Arm)
					;ArmSound.play(CurrentMonkey)
					utility.wait(utility.randomfloat(0.1,0.2))
				else
					DeadMonkeyCount += 1  	
				endif
				i += 1
			endwhile
						if DeadMonkeyCount >= MonkeyCount
				gotostate("DeadMonkey")
			endif
			StartTimer(WarnTime, WarnTimerNumber)
			registerForAnimationEvent(game.getPlayer(), "sneakStateEnter")
	    endif
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
		CancelTimer(WarnTimerNumber)
		gotostate("Active")
	endEvent

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		debug.trace("Motion Detector Monkey: I've caught anim event "+asEventName+" from "+akSource)
	    if (akSource == game.getPlayer() && (asEventName == "sneakStateEnter"))
	    	gotostate("Active")
	    endif	    
	EndEvent

	Event OnTimer(int aiTimerID)
		if aiTimerID == WarnTimerNumber
			gotostate("Tripped")
		endif
	endEvent

endState

state Tripped

	Event OnBeginState(string asOldState)
	    if (asOldState == "Warn")
			int i = 0
			Int MonkeyCount = Monkey.length
			;TriggerSoundInstances = new int[MonkeyCount]
			Int DeadMonkeyCount = 0
			while (i <MonkeyCount)
				ObjectReference CurrentMonkey = Monkey[i]
				if (CurrentMonkey.IsDestroyed() == FALSE)
					CurrentMonkey.Activate(Monkey[i])
					CurrentMonkey.CreateDetectionEvent(Game.GetPlayer(), aiSoundLevel)
					;TriggerSoundInstances[i] = TriggerSound.Play(CurrentMonkey)
					CurrentMonkey.PlayAnimationandWait(Trip,TransitionComplete)
					utility.wait(utility.randomfloat(0.1,0.4))
				else
					DeadMonkeyCount += 1  	
				endif
				i += 1
			endwhile
			if DeadMonkeyCount >= MonkeyCount
				gotostate("DeadMonkey")
			endif
			StartTimer(AlarmTime, AlarmTimerNumber)
	    endif
	EndEvent

	Event OnTimer (int aiTimerID)
		if aiTimerID == AlarmTimerNumber
			gotoState("Active")
		endif
	EndEvent

endState

;/State Busy
	
EndState
/;

State DeadMonkey

EndState
