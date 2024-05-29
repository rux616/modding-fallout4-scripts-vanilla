Scriptname CIS_ScriptEventSenderActorScript extends Actor Const
{For companions who have CIS scenes that can't rely on existing story manager or script events to trigger
Starts up quest: ScriptEvent_CIS_Manager
For example: Piper finding nearby Vendors to get discounts from (***this example is obsolete now***)
}

float Property SendScriptEventFrequency = 0.15 const auto
{In hours, will be used for game time timer duration}

keyword Property CIS_ScriptEvent_Start const auto
{AUTOFILL}

int TimerID_SendScriptEvent = 0 const

Event OnLoad()
    StartScriptEventTimer()
EndEvent

Event OnUnload()
    CancelTimerGameTime(TimerID_SendScriptEvent) 
EndEvent

Event OnTimerGameTime(int aiTimerID)
    if aiTimerID == TimerID_SendScriptEvent
		FollowersScript.trace(self, "OnTimerGameTime() calling CIS_ScriptEvent_Start.SendStoryEvent()")
		CIS_ScriptEvent_Start.SendStoryEvent(akRef1 = self, akLoc = GetCurrentLocation())
		StartScriptEventTimer()
    endif
EndEvent

Function StartScriptEventTimer()
	StartTimerGameTime(SendScriptEventFrequency, TimerID_SendScriptEvent) 
EndFunction