Scriptname GlowingSeaPOIDB01LightScript extends ObjectReference Hidden

bool isBlinking

Event OnActivate(ObjectReference akActionRef)
		; If we are blinking, turn us off.  If we aren't, then turn us on
    if isBlinking
    	isBlinking = FALSE
    else
    	isBlinking = TRUE
    	UnregisterForDistanceEvents(self, Game.GetPlayer())
    	RegisterForDistanceGreaterThanEvent(self, Game.GetPlayer(), 36000)
    	StartBlinking()
    endif
EndEvent

	; Run the blinking loop, but only if the light should be blinking
Function StartBlinking()
	while (isBlinking)
		self.EnableNoWait()
		utility.Wait(1)
		self.DisableNoWait()
		utility.Wait(1)
	endwhile
EndFunction

	; Player has walked too far away, stop blinking
Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	RegisterForDistanceLessThanEvent(self, Game.GetPlayer(), 34000)
	isBlinking = FALSE
EndEvent

	; Player has walked close enough, start blinking again
Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	isBlinking = TRUE
	RegisterForDistanceGreaterThanEvent(self, Game.GetPlayer(), 36000)
   	StartBlinking()
EndEvent