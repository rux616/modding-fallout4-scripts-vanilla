Scriptname DLC06:VaultDoorTriggerScript extends ObjectReference conditional

ActorValue property DLC06VaultDoorTrigger auto const mandatory

Sound Property OBJKlaxon2DLPM Auto const mandatory
Int KlaxonSoundID

Keyword Property LinkVaultDoorConsoleFurniture Auto const mandatory
Keyword Property DLC06LinkVaultDoorConsoleFurniture02 Auto const mandatory

Keyword Property LinkCustom01 Auto const mandatory

bool busy = false

bool gearDoorOpen = false conditional

bool gearDoorOpenVar = false ; this gets set to true immediately at start of opening; false at start of closing

Quest property DLC06MQ01 auto const mandatory 
int property MQ01AllowAutoOpenStage = 150 auto const 

ObjectReference property VaultDoorEdgeMarker auto const mandatory
{ edge marker to disable when vault door is closed }

Function ToggleGearDoor()
	debug.trace(self + " ToggleGearDoor")
	OpenGearDoor(gearDoorOpen == false)
endFunction

Function OpenGearDoor(bool bOpen = true)
	debug.trace(self + " OpenGearDoor " + bOpen)
	if busy == false
		busy = true
		ObjectReference VaultDoor = GetLinkedRef()
		debug.trace(self + " OpenGearDoor - vault door=" + VaultDoor)

		if bOpen
			if gearDoorOpen == false
				StartKlaxonSound()
				VaultDoor.PlayAnimation("Stage2")
				VaultDoorEdgeMarker.Enable()  ; enable edge marker at door when door is open
				gearDoorOpenVar = true
			endif
		else
			if gearDoorOpen
				StartKlaxonSound()
				VaultDoor.PlayAnimation("Stage4")
				VaultDoorEdgeMarker.Disable() ; disable edge marker at door when door is closed
				gearDoorOpenVar = false
			endif
		endif

	;enable the Klaxon lights. Animations play in the RefAlias scripts for each KlaxonLight
;	LocalEnableAll(VaultDoorKlaxonLights)
		RegisterForAnimationEvent(VaultDoor, "KlaxonStop")
		; also run timer as failsafe
		StartTimerGameTime(0.5)
	else
		debug.trace(self + " OpenGearDoor: BUSY - do nothing")
	endif
EndFunction

Event OnTimerGameTime(int aiTimerID)
	debug.trace(self + " OnTimerGameTime " + aiTimerID)
	if busy
    	DoorAnimationFinished()
    endif
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace(self + " OnTriggerEnter " + akActionRef)
    if akActionRef is WorkshopNPCScript
    	if DLC06MQ01.GetStageDone(MQ01AllowAutoOpenStage)
	    	WorkshopNPCScript workshopNPC = akActionRef as WorkshopNPCScript
	    	if workshopNPC.GetValue(DLC06VaultDoorTrigger) == 0
	    		; flag them so they can't trigger the door again
	    		workshopNPC.SetValue(DLC06VaultDoorTrigger, 1)
	    		OpenGearDoor()
	    	endif
	    endif
    endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	debug.trace(self + " OnAnimationEvent " + asEventName)
	;wait for the gear door to finish animating, then stop Klaxon
	If (asEventName == "KlaxonStop")
		DoorAnimationFinished()
	EndIf
EndEvent

function DoorAnimationFinished()
	debug.tracestack(self + "DoorAnimationFinished")
	StartKlaxonSound(false)
	UnregisterForAnimationEvent(GetLinkedRef(), "KlaxonStop")
	; set conditional variable to match hidden variable
	gearDoorOpen = gearDoorOpenVar

	; ready to open/close
	busy = false
	; unblock activation on console
	ResetVaultConsole()
EndFunction

Function StartKlaxonSound(bool bStart = true)
	debug.trace(self + " StartKlaxonSound " + bStart)
	if bStart
		KlaxonSoundID = OBJKlaxon2DLPM.Play(GetLinkedRef())
	else
		debug.trace(self + "   stopping sound " + KlaxonSoundID)
		Sound.StopInstance(KlaxonSoundID)
	endif
	; turn lights on/off
	ObjectReference[] Klaxons = GetLinkedRefChildren(LinkCustom01)
	debug.trace(self + " StartKlaxonSound: klaxons=" + Klaxons)

	int i = 0
	while i < Klaxons.Length
		Default2StateActivator theKlaxon = Klaxons[i] as Default2StateActivator
		theKlaxon.SetOpen(bStart)
		ObjectReference[] KlaxonLights = theKlaxon.GetLinkedRefChildren(NONE)
		int j = 0
		while j < KlaxonLights.Length 
			ObjectReference theLight = KlaxonLights[j]
			if bStart 
				theLight.Enable()
				theLight.PlayAnimation("Stage2")
			else 
				theLight.Disable()
				theLight.PlayAnimation("Reset")
			endif
			j += 1
		endWhile
		i += 1
	endWhile

EndFunction

function ResetVaultConsole()
	debug.tracestack(self + " ResetVaultConsole")
	ObjectReference console = GetLinkedRef(LinkVaultDoorConsoleFurniture)
	if console 
		; unblock and reset
		console.BlockActivation(False, False)
		console.PlayAnimation("reset")
	endif 

	ObjectReference console02 = GetLinkedRef(DLC06LinkVaultDoorConsoleFurniture02)
	if console02 
		; unblock and reset
		console02.BlockActivation(False, False)
		console02.PlayAnimation("reset")
	endif 
endFunction 

;/
Event OnUnload()
    ; close vault door on unload, for fun
    OpenGearDoor(false)
EndEvent
/;

Event OnLoad()
	; make sure console can be used
	ResetVaultConsole()	
endEvent
