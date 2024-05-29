Scriptname DLC04:DLC04FireAlarmLightScript extends ObjectReference

bool property StartOn Auto 
{Whether the lights start on or not.  Default = FALSE}

bool property AutoOff = True Auto
{Whether to have the klaxon automatically turn off or not.  Default = FALSE}

int property AutoOffTime = 10 Auto
{Time before the klaxon automatically turns off.}

Auto State WaitingOff

	Event OnLoad()
  		if (StartOn == TRUE)
  			gotoState("BlockingActivation")
  			PlayLights()
  		endif
	endEvent

	Event OnActivate(ObjectReference akActionRef)
		gotoState("BlockingActivation")
		PlayLights()
	EndEvent

EndState

State WaitingOn

	Event OnActivate(ObjectReference akActionRef)
		gotoState("BlockingActivation")
		StopLights()
	EndEvent

EndState

State BlockingActivation

EndState

Function PlayLights()
	Self.PlayAnimation("Stage2")
	ObjectReference KlaxonSound = Self.GetLinkedRef()
	if(KlaxonSound)
		KlaxonSound.Enable()
	endif
	if AutoOff
		StartTimer(AutoOffTime, 1)
	endif
	gotoState("WaitingOn")
endFunction

Function StopLights()
	Self.PlayAnimation("Reset")
	ObjectReference KlaxonSound = Self.GetLinkedRef()
	if(KlaxonSound)
		KlaxonSound.Disable()
	endif
	CancelTimer(1)
	gotoState("WaitingOff")
EndFunction

;Auto-Off timer.
Event OnTimer(int timerID)
	if (timerID == 1)
		StopLights()
	EndIf
EndEvent