Scriptname DN151_DoorSeal extends ObjectReference Conditional Hidden
{Script for doors that, when closed, block access to another door.}
;
;This script is an iteration of the door seal script originally used in Skyrim's Nchardak dungeon.
;It has been preserved for legacy reasons and is not currently in use.

DN151_TrackingQuestScript property TrackingQuest Auto Mandatory
{Tracking quest. Mainly exists to hold aliases used to clear names of objects that can't be activated while underwater.}

ObjectReference property LinkedDoor Auto
{The door this seal seals (if any).}

ObjectReference property PermittedActivator Auto
{For special cases, one specific activator we allow to open the seal on activation. Activate events are otherwise ignored.}

bool property PermittedActivationShouldToggle = False Auto
{When activated by the permitted activator, should we toggle open or closed? If false, just release the seal. Default: False}

bool property LinkedDoorIsLoadDoor = True Auto
{When the seal is released, allow the player to activate load doors. Non-load doors just open automatically.}

bool property isSealed = True Auto Conditional
{Is this door seal sealed?}

bool initialized = false				;Have we done our first-time initialization?
bool isLoading = false				;Each time a door seal loads, it has to run an update in case it unloaded while in an unsafe state (while animating, etc.).
bool isReleasingSeal = False			;Are we in the process of opening? Used to determine if OnTimer should process this.


Event OnCellLoad()
	if (!initialized)
		;Seals can never be activated or opened by followers.
		Self.BlockActivation(True)
		Self.SetNoFavorAllowed(True)
		RegisterForAnimationEvent(Self, "Opened")
		RegisterForAnimationEvent(Self, "Closed")
		initialized = True
	EndIf

	;We need to run our on-load update.
	isLoading = True
	GoToState("Ready")
	if (isSealed)
		RestoreSeal()
	Else
		ReleaseSeal()
	EndIf
EndEvent


Auto State Ready
	Function ReleaseSeal()
		;Handle this in an OnTimer event thread to avoid blocking the main script process.
		GoToState("Busy")
		isSealed = False
		isReleasingSeal = True
		StartTimer(0)
	EndFunction

	Function RestoreSeal()
		;Handle this in an OnTimer event thread to avoid blocking the main script process.
		GoToState("Busy")
		isSealed = True
		isReleasingSeal = False
		StartTimer(0)
	EndFunction

	Event OnTimer(int timer)
		;Make sure 3D is (still) loaded before trying to send animation events.
		if (WaitFor3DLoad())
			if (IsReleasingSeal)
				if (LinkedDoor != None)
					LinkedDoor.BlockActivation(False)
					LinkedDoor.SetNoFavorAllowed(False)
					TrackingQuest.RestoreNameOnObject(LinkedDoor)
					if (!LinkedDoorIsLoadDoor)
						LinkedDoor.SetOpen(True)
					EndIf
				EndIf
				if (isLoading)
					Self.PlayAnimation("StartOpen")
					isLoading = False
					GoToState("Ready")
				Else
					Self.PlayAnimation("Open")
				EndIf
			Else
				if (LinkedDoor != None)
					LinkedDoor.BlockActivation(True)
					LinkedDoor.SetNoFavorAllowed(True)
					TrackingQuest.ClearNameOnObject(LinkedDoor)
					if (!LinkedDoorIsLoadDoor)
						LinkedDoor.SetOpen(False)
					EndIf
				EndIf
				if (isLoading)
					Self.PlayAnimation("StartClosed")
					isLoading = False
					GoToState("Ready")
				Else
					Self.PlayAnimation("Close")
				EndIf
			EndIf
		EndIf
	EndEvent

	Event OnAnimationEvent(ObjectReference source, string eventName)
		;Just a warning (not an error), since this may happen as part of the on-load update, depending on how the door is set up.
		Debug.Trace("WARNING: Animation event " + eventName + " received by " + Self + " while in Ready state.", 1)
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		if (akActivator == PermittedActivator)
			if (isSealed)
				ReleaseSeal()
			ElseIf (!isSealed && PermittedActivationShouldToggle)
				RestoreSeal()
			EndIf
		EndIf
	EndEvent
EndState



;If a seal is animating open or closed, don't interrupt it.
State Busy
	Event OnAnimationEvent(ObjectReference source, string eventName)
		;We've registered for the Opened and Closed events; when we get either, return to the Ready state.
		GoToState("Ready")
	EndEvent
EndState

Function ReleaseSeal()
	;Do nothing.
EndFunction

Function RestoreSeal()
	;Do nothing.
EndFunction