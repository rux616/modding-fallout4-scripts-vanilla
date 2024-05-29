Scriptname DefaultRemoteControlObjectReference extends ObjectReference Conditional
{Use to send remote control messages to objects that you have set up to listen for signals from this object}

import DefaultRemoteControl
;defines structs:
;SingalChoices
;SignalParams

CustomEvent On
CustomEvent Off
CustomEvent Toggle
CustomEvent CustomMessage

Group EventSignals
bool Property PlayerOnly = true const auto
{Only send signals for events below only when triggerd by the player}

SignalChoices Property OnActivate_Signals const auto
{When I am activated, which signals should I send?}

SignalChoices Property OnTriggerEnter_Signals const auto
{When I am entered, which signals should I send?}

SignalChoices Property OnTriggerLeave_Signals const auto
{When I am left, which signals should I send?}

SignalChoices Property OnLoad_Signals const auto
{When I load, which signals should I send?

Note: PlayerOnly setting has no effect}

SignalChoices Property OnUnload_Signals const auto
{When I unload, which signals should I send?

Note: PlayerOnly setting has no effect}

EndGroup

Group OptionalParameters 

SignalParams Property OnSignalParams const auto
{Optional Data to send with the On() Event - send by calling TurnOn()}

SignalParams Property OffSignalParams const auto
{Optional Data to send with the Off() Event - send by calling TurnOff()}

SignalParams Property ToggleSignalParams const auto
{Optional Data to send with the Toggle() Event - send by calling SendToggleMessage()}

SignalParams Property CustomSignalParams const auto
{Optional Data to send with the CustomMessage() Event - send by calling SendCustomMessage()}

EndGroup

Group ToggleParameters
	; RELATED TO TOGGLEABLE ACTIVATORS ONLY
	; e.g. switches, levers
	; -- KMK
	bool Property ToggleStartsOn const auto
	{ true = switch starts "on"
	  false = switch starts "off"
	}

	bool Property ToggleIsOn auto Conditional
	{tracks current state of switch}

	bool Property ToggleIsInDefaultState = true auto Conditional
	{ false if the switch changes to the non-default state
	 NOTE: NPCs should only respond to switch state changes if:
	  ToggleIsInDefaultState = false
		 	AND
	  ToggleStateChangeCount > 0
	}

	int Property ToggleStateChangeCount = 0 auto Conditional
	{ increment when remote receivers respond that they actually changed state }
	; /KMK
EndGroup

Event OnInit()
	; init IsOn to correct starting state
	ToggleIsOn = ToggleStartsOn
endEvent

var[] Function getArgs(SignalParams Params)
		var[] args = new var[1]

		args[0] = Params
		return args

EndFunction

Function sendSignals(SignalChoices theSignalChoices)
	if theSignalChoices
		; clear state change count
		ToggleStateChangeCount = 0
		
		if theSignalChoices.SendOn 
			TurnOn(getArgs(OnSignalParams))
		endif

		if theSignalChoices.SendOff 
			TurnOff(getArgs(OffSignalParams))
		endif

		if theSignalChoices.SendToggle 
			SendToggleMessage(getArgs(OffSignalParams))
		endif

		if theSignalChoices.SendCustom
			TurnOff(getArgs(CustomSignalParams))
		endif

	endif

EndFunction


Function TurnOn(var[] kArgs)
	debug.trace(self + "TurnOn() " + kArgs)
	sendCustomEvent("On", kArgs)

EndFunction

Function TurnOff(var[] kArgs)
	debug.trace(self + "TurnOff() " + kArgs)
	sendCustomEvent("Off", kArgs)

EndFunction

Function SendToggleMessage(var[] kArgs)
	debug.trace(self + "SendToggleMessage() " + kArgs)
	sendCustomEvent("Toggle", kArgs)

EndFunction

Function SendCustomMessage(var[] kArgs)
	debug.trace(self + "SendCustomMessage() " + kArgs)
	sendCustomEvent("CustomMessage", kArgs)

EndFunction

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + "OnActivate() " + akActionRef)
	if akActionRef == Game.GetPlayer() || PlayerOnly == false
		sendSignals(OnActivate_Signals)
		; toggleable state tracking:
		ToggleIsOn = !ToggleIsOn
		ToggleIsInDefaultState = (ToggleIsOn == ToggleStartsOn)
	endif
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace(self + "OnTriggerEnter() " + akActionRef)
	if akActionRef == Game.GetPlayer() || PlayerOnly == false
		sendSignals(OnTriggerEnter_Signals)
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	debug.trace(self + "OnTriggerLeave() " + akActionRef)
	if akActionRef == Game.GetPlayer() || PlayerOnly == false
		sendSignals(OnTriggerLeave_Signals)
	endif
EndEvent

Event OnLoad()
	debug.trace(self + "OnLoad()")
	sendSignals(OnLoad_Signals)
EndEvent

Event OnUnload()
	debug.trace(self + "OnUnload()")
	sendSignals(OnUnload_Signals)
EndEvent

; call this function to restore a toggle to its default state
function ToggleRestoreDefaultState()
	if ToggleIsInDefaultState == false
		if ToggleStartsOn
			TurnOn(getArgs(OnSignalParams))
		else
			TurnOff(getArgs(OffSignalParams))
		endif
	endif
endFunction

; Remote receivers call this if they change state in response to a signal
function IncrementReceiverStateChangeCount(DefaultRemoveableLight theLight)
	ToggleStateChangeCount += 1
	; register for deletion events from the light
	if theLight
		debug.trace(self + " IncrementReceiverStateChangeCount: registering for AO_DeleteMarkerEvent from " + theLight)
		RegisterForCustomEvent(theLight, "AO_DeleteMarkerEvent")		
	endif
endFunction

; decrement the state change count if I get deletion event
; so if all the lights are broken/removed, the switch stops being "interesting" to NPCs
Event DefaultRemoveableLight.AO_DeleteMarkerEvent(DefaultRemoveableLight akSender, Var[] akArgs)
	ToggleStateChangeCount -= 1
	debug.trace(self + " AO_DeleteMarkerEvent received from " + akSender + ", ToggleStateChangeCount=" + ToggleStateChangeCount)
endEvent
