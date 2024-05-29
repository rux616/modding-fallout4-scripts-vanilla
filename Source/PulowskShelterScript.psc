Scriptname PulowskShelterScript extends ObjectReference 

Quest Property DNMasterQuest Auto Const
Scene Property PulowskiShelterScene01 Auto Const
ReferenceAlias Property Alias_Pulowski_Shelter Auto Const
light property InteriorLight auto const

objectReference myLight

Event OnLoad()
		debug.trace("PulowskShelterScript: onLoad")
    	Alias_Pulowski_Shelter.forceRefTo(self)
    	if getLinkedRef() == NONE
    		debug.trace("PulowskShelterScript: Creating a light")
    		myLight = self.placeAtMe(InteriorLight)
    		myLight.moveTo(self,0,0,190)
    	else
    		debug.trace("PulowskShelterScript: Linked Light Exists!")
    		myLight = getLinkedRef()
    	endif

    	if getOpenState() == 1
    		myLight.enable()
    	elseif getOpenState() == 3
    		myLight.disable()
    	endif

EndEvent

Event OnUnload()
    if PulowskiShelterScene01.isPlaying()
    	PulowskiShelterScene01.stop()
    endif
    Alias_Pulowski_Shelter.clear()
    unregisterForDistanceEvents(self,game.getPlayer())
EndEvent

Event OnActivate(ObjectReference akActionRef)
	debug.trace("PulowskShelterScript: Openstate = "+getOpenState())
    if akActionRef == game.getPlayer()
    	int openState = getOpenState()
    	if openState == 2
    		debug.trace("PulowskShelterScript: Clicked - should be opening now")
    		if getDistance(game.getPlayer()) > 55
    			if PulowskiShelterScene01.isPlaying()
    				PulowskiShelterScene01.stop()
    			endif
    			; player isn't inside, turn on the light, start the messaging
    			PulowskiShelterScene01.start()
    			utility.wait(1.0)
    			myLight.enable()
    		endif
    	elseif getOpenState() == 4
    		debug.trace("PulowskShelterScript: Clicked - should be closing now")
    		if getDistance(game.getPlayer()) > 55
    			PulowskiShelterScene01.stop()
    			myLight.disable()
    		endif
    	else
    		debug.trace("PulowskShelterScript: Clicked while in intermediate opening/closing state")
    	endif
    endif
EndEvent

Event OnOpen(ObjectReference akActionRef)
	debug.trace("PulowskShelterScript: I have been opened.  Register for distance check!")
	blockActivation(false)
    if akActionRef == game.getPlayer()
    	if getDistance(game.getPlayer()) > 55
    		; player must not be within the shelter...
    		registerforDistanceLessThanEvent(self,game.getPlayer(),55)
    	else
    		registerforDistanceGreaterThanEvent(self,game.getPlayer(),64)
    	endif
    endif
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	debug.trace("PulowskShelterScript: Player is within!  Try to Close")
	setOpen(false)
	blockActivation(true)
	utility.wait(2.0)
	blockActivation(false)
	;setOpen()
endEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	myLight.disable()
	utility.wait(0.5)
	setOpen(false)
endEvent


