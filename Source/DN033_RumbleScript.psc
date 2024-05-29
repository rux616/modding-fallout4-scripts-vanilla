Scriptname DN033_RumbleScript extends ObjectReference Hidden
{Moves an xmarker to a random location around the player and plays a rumble}

Sound property mySound Auto Const

ObjectReference property myMarker Auto Const
{the xmarker we play a rumble from}

float powerClosest = 1.0
float durationClosest = 5.0
int myTimerClosestMax = 10 	;max number of seconds between rumbles 
int myTimerClosestMin = 7 	;min number of seconds between rumbles

float powerClose = 0.75
float durationClose = 5.0
int myTimerCloseMax = 15 	;max number of seconds between rumbles 
int myTimerCloseMin = 10 	;min number of seconds between rumbles

float powerMiddle = 0.50
float durationMiddle = 5.0
int myTimerMiddleMax = 20 	;max number of seconds between rumbles 
int myTimerMiddleMin = 15 	;min number of seconds between rumbles

float powerFar = 0.40
float durationFar = 5.0
int myTimerFarMax = 25 	;max number of seconds between rumbles 
int myTimerFarMin = 20 	;min number of seconds between rumbles

float powerFarthest = 0.25
float durationFarthest = 5.0
int myTimerFarthestMax = 30 	;max number of seconds between rumbles 
int myTimerFarthestMin = 25 	;min number of seconds between rumbles



int myTimerID = 1 		;ID number for rumble timer
float myTimer = 0.0
bool inTrigger = false
float falloff = 12000.0

;**********************************************************

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		;player is in trigger, start timer to play rumble
		inTrigger = True
		myTimer = utility.RandomFloat(myTimerClosestMin, myTimerClosestMax)
		StartTimer(myTimer, myTimerID)	
	endIf
EndEvent

;**********************************************************

Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		inTrigger = false
		CancelTimer(myTimerID)
	endIf
EndEvent

;**********************************************************

Event OnTimer(int aiTimerID)
    if (aiTimerID == myTimerID)
    	;play a rumble from the marker and choose power and duration based on how close the Player is
		if(Game.GetPlayer().getDistance(myMarker) <= 512)
			myMarker.RampRumble(powerClosest, durationClosest, falloff)
			myTimer = utility.RandomFloat(myTimerClosestMin, myTimerClosestMax)
		elseif(Game.GetPlayer().getDistance(myMarker) <= 2000)
			myMarker.RampRumble(powerClose, durationClose, falloff)
			myTimer = utility.RandomFloat(myTimerCloseMin, myTimerCloseMax)
		elseif(Game.GetPlayer().getDistance(myMarker) <= 5000)
			myMarker.RampRumble(powerMiddle, durationMiddle, falloff)
			myTimer = utility.RandomFloat(myTimerMiddleMin, myTimerMiddleMax)
		elseif(Game.GetPlayer().getDistance(myMarker) <= 8000)
			myMarker.RampRumble(powerFar, durationFar, falloff)
			myTimer = utility.RandomFloat(myTimerFarMin, myTimerFarMax)
		elseif(Game.GetPlayer().getDistance(myMarker) <= falloff)
			myMarker.RampRumble(powerFarthest, durationFarthest, falloff)
			myTimer = utility.RandomFloat(myTimerFarthestMin, myTimerFarthestMax)
		endIf

		if(inTrigger)
			;player is still in trigger, restart timer
			mySound.play(Game.GetPlayer())
			StartTimer(myTimer, myTimerID)
		endif
	endif
EndEvent

;**********************************************************