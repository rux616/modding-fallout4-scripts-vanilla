Scriptname DLC06:WorkshopIdleObjectScript extends ObjectReference Const

Quest property IdleQuest auto const mandatory
{ base quest to start }

Keyword property IdleQuestKeyword auto const mandatory
{ story manager keyword to use to start quest }

Keyword property WorkshopItemKeyword auto const mandatory
{ to get my workshop }

float property idleTimerDays = 0.2 auto const 
{ how many game days between attempts to start idleQuest }

string property TargetMarkerNode = "IdleNode01" auto const 
{ node name to move target marker to when created }

float property sleepTimeStart = 0.0 auto const 
{ start of "sleep time" - won't send events during sleep time }

float property sleepTimeStop = 0.25 auto const 
{ end of "sleep time" - won't send events during sleep time }

Event OnUnload()
	; stop quest OnUnload so other sirens can work - turn off OnLoad (because that doesn't work when siren is unloaded)
	StartIdleTimer(false)
EndEvent

Event OnLoad()
	; start running timer when I load with short timer to get things going
	StartIdleTimer(true, 0.1)
endEvent

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	StartIdleTimer(false)
EndEvent

function StartIdleTimer(bool bStart, float timerDays = 0.0)
	debug.trace(self + " StartIdleTimer bStart=" + bStart + ", timerDays=" + timerDays)
	if bStart 
		if timerDays == 0.0
			timerDays = idleTimerDays
		endif
		if Is3DLoaded()
			StartTimerGameTime(timerDays)
		endif
	else 
		CancelTimerGameTime()
	endif
endFunction

Event OnTimerGameTime(int aiTimerID)
	debug.trace(self + " OnTimerGameTime")
	if Is3DLoaded()
	    if IdleQuest.IsRunning() == false && CanProduceForWorkshop()
			; check time
			float currentGameTime = Utility.GetCurrentGameTime()
			float currentTime = currentGameTime - math.floor(currentGameTime)
			debug.trace(self + "   currentTime=" + currentTime)
			if ( currentTime < sleepTimeStart || currentTime > sleepTimeStop )
				debug.trace(self + " OnTimerGameTime - try to start quest")
		    	IdleQuestKeyword.SendStoryEvent(akRef1 = GetLinkedRef(WorkshopItemKeyword))
		    endif
	    else 
			debug.trace(self + " OnTimerGameTime - don't try to start quest")
	    endif
		StartIdleTimer(true)
	endif
EndEvent