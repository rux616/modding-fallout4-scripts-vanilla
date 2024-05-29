Scriptname RemovableLightRemoteReceiver extends ObjectReference
{PROTYPING - HACK
Script to reciever remote control messages.

This object MUST also have a DefaultRemoveableLight script attached to it or it will do nothing.

PROBLEM with this prototype is the damage helper isn't created with the placeatme of the off version, so you can't shoot it.
}

Group Data

DefaultRemoteControlObjectReference Property RemoteControl const auto
{Pointer to the object that will send it remote control messages.

That object needs the script: DefaultRemoteControlObjectReference}

Float Property OnDelay const auto
{How many seconds to wait before responding to the On message}

Float Property OffDelay const auto
{How many seconds to wait before responding to the On message}

Bool Property StartOff const auto
{Default: false; if true, turn off the light when it loads}


EndGroup

ObjectReference Property OffRef auto hidden

;AN "ENUM"
int Property iState auto hidden   

;"ENUM VALUES"
int Property 	iUnInitialized	= 0	const auto hidden
int Property 	iOn 			= 1	const auto hidden
int Property 	iOff 			= 2	const auto hidden
int Property 	iTurningOn 		= 3 const auto hidden
int Property 	iTurningOff		= 4 const auto hidden
int Property 	iToggle			= 5 const auto hidden

Event OnLoad()
    RegisterForCustomEvent(RemoteControl, "On")
    RegisterForCustomEvent(RemoteControl, "Off")
    RegisterForCustomEvent(RemoteControl, "Toggle")
    RegisterForCustomEvent(RemoteControl, "CustomMessage")

    ;Reminder, when the destruction stage swaps the art, it causes the object to load again
    if iState == iUnInitialized
    	if StartOff
	    	debug.trace(self + "OnLoad() iUnInitialized && StartOff. Turning off.")
			SetBulbState(iOff, true)
		else
	    	debug.trace(self + "OnLoad() iUnInitialized && StartOff = false. Turning on.")
			SetBulbState(iOn, true)
		endif
    endif


EndEvent

Event OnUnload()
    UnregisterForCustomEvent(RemoteControl, "On")
    UnregisterForCustomEvent(RemoteControl, "Off")
    UnregisterForCustomEvent(RemoteControl, "Toggle")
    UnregisterForCustomEvent(RemoteControl, "CustomMessage")

EndEvent


Event DefaultRemoteControlObjectReference.On(DefaultRemoteControlObjectReference akSender, Var[] akArgs)
	debug.trace(self + "Received ON event")
	
	if SetBulbState(iOn)
		akSender.IncrementReceiverStateChangeCount((self as ObjectReference) as DefaultRemoveableLight)
	endif

EndEvent

Event DefaultRemoteControlObjectReference.Off(DefaultRemoteControlObjectReference akSender, Var[] akArgs)
	debug.trace(self + "Received OFF event")

	if SetBulbState(iOff)
		akSender.IncrementReceiverStateChangeCount((self as ObjectReference) as DefaultRemoveableLight)
	endif
		
EndEvent

Event DefaultRemoteControlObjectReference.Toggle(DefaultRemoteControlObjectReference akSender, Var[] akArgs)
	debug.trace(self + "Received OFF event")

	if SetBulbState(iToggle)
		akSender.IncrementReceiverStateChangeCount((self as ObjectReference) as DefaultRemoveableLight)
	endif

EndEvent


Event DefaultRemoteControlObjectReference.CustomMessage(DefaultRemoteControlObjectReference akSender, Var[] akArgs)
	debug.trace(self + "Received CUSTOMMESSAGE event")
	debug.trace(self + "WARNING: I don't handle CustomMessage event.", 2)

EndEvent


bool Function SetBulbState(int BulbState, bool bIgnoreDelay = false) 
;see "ENUM" values at top of scrip
; return TRUE if state changed

	bool hasBulb = !( GetCurrentDestructionStage() > 1 ) 	; destruction stage > 1 ==> missing or broken bulb - see DefaultRemoveableLight

	;wait until done turning on or off
	While iState == iTurningOn || iState == iTurningOff
		debug.trace(self + "SetBulbState waiting for bulb to finish turning on or off")
		Utility.wait(1)
	EndWhile

	; what's the state now? (so we can tell if state changes)
	int iStartState = iState

	;if we're toggling, set to the correct state 
	if BulbState == iToggle
		if iState == iOn
			BulbState = iOff
		elseif iState == iOff
			BulbState = iOn
		endif
	endif


	;call functions on light to turn on/off accordingly
	if BulbState == iOn
		if OnDelay > 0
			iState = iTurningOn
			if bIgnoreDelay == false
				Utility.wait(OnDelay)
			endif

		endif
		
		; don't place AO markers when light operated remotely
		if hasBulb
			((self as ObjectReference) as DefaultRemoveableLight).TurnOn(shouldPlaceAOMarker = false)
		endif

		iState = iOn

	elseif BulbState == iOff
		if OffDelay > 0
			iState = iTurningOff
			if bIgnoreDelay == false
				Utility.wait(OffDelay)
			endif
		endif
		
		; don't place AO markers when light operated remotely
		if hasBulb
			((self as ObjectReference) as DefaultRemoveableLight).TurnOff(shouldPlaceAOMarker = false) 
		endif

		iState = iOff

	endif

	if hasBulb
		; only report change of state if light is operable
		return (iStartState != iState)
	else
		; otherwise, always false because the light can't visibly change state
		return false
	endif
	
EndFunction