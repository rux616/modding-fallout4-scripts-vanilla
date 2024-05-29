Scriptname HoveringVertibirdScript extends Actor
{plays the ground fx associated with flying}

ImpactDataSet Property HoveringVbirdGroundImpactSet Auto Const
{The groud fx set that is used when the ground in picked}

ImpactDataSet Property HoveringVbirdPropellarImpactSet Auto Const
{The groud fx set that is used when the ground in picked}

bool playGFX  = true
bool playPropDust  = false
bool playBigDust  = false
int playTimerID = 1 const



float Property waitBetweenPicks = 0.25 Auto const
{Update time..keep as low as possible}

Event OnLoad()
	if Is3DLoaded() ; we may be disabled, so make sure we have 3D
		StartTimer(waitBetweenPicks, playTimerID)
		RegisterForAnimationEvent(self, "FlightHovering")
		RegisterForAnimationEvent(self, "FlightCruising")
		RegisterForAnimationEvent(self, "FlightLanding")
		RegisterForAnimationEvent(self, "FlightLanded")
		RegisterForAnimationEvent(self, "FlightTakeOff")
		RegisterForAnimationEvent(self, "PropsOn")
		RegisterForAnimationEvent(self, "PropsOff")
	endIf
EndEvent

Function CancelFX()
	playGFX = false
	CancelTimer(playTimerID)

	;Need to do this so a vertibird won't persist unnecessarily.
	UnregisterForAllEvents()
EndFunction

Event OnUnload()
	CancelFX()
EndEvent

Event OnDying(Actor akKiller)
    CancelFX()
EndEvent

Event OnTimer(int aiTimerID)
	; Only play the effects and continue with the timer if our flag is set and we still have 3d
	if (aiTimerID == playTimerID) && playGFX && Is3DLoaded()
		if playBigDust == true
			self.PlayImpactEffect(HoveringVbirdGroundImpactSet, "com"  , 0, 0, -1, 1024, false, false)
		endIf
		if playPropDust == true
			self.PlayImpactEffect(HoveringVbirdPropellarImpactSet, "LeftPropeller" , 0, 0, -1, 2048, false, false)
			self.PlayImpactEffect(HoveringVbirdPropellarImpactSet, "RightPropeller" , 0, 0, -1, 2048, false, false)
		endIF
		StartTimer(waitBetweenPicks, playTimerID)
	endIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace(self + asEventName)
	if asEventName == "PropsOn"
		playBigDust = false
		playPropDust = false
	elseif asEventName == "FlightCruising"
		playBigDust = true
		playPropDust = false
	elseIf 	 asEventName == "FlightLanding" ||  asEventName == "FlightTakeOff"
		playBigDust = true
		playPropDust = true
	elseif asEventName == "PropsOff"
		playBigDust = false
		playPropDust = false
	else
		playBigDust = false
		playPropDust = true
	endif

EndEvent
