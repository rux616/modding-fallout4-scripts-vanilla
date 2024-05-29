Scriptname DLC04:DLC04SafariTreehouseButtonOffScript extends ObjectReference 

quest property DLC04powerTracker auto
message property DLC04ParkPowerOutMessage auto


Event OnActivate(ObjectReference akActionRef)
	if DLC04powerTracker.getstagedone(10) == 0
		DLC04powerTracker.setstage(10)
	endif
    DLC04ParkPowerOutMessage.show()
EndEvent
