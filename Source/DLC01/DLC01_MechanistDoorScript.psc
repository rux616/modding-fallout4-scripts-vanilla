Scriptname DLC01:DLC01_MechanistDoorScript extends Default2StateActivator Hidden
{Script for the Mechanist Doors. See DLC01_MechanistDoorControlScript for an overview of the Mechanist Door system.}
;
;In addition to the standard Default2StateActivator behavior, these doors:
; - Wait a set amount of time (their Delay Timing) before opening. Since these doors are used in sequence, this
;   allows us to set the doors to open one after another. The amount of time the door waits depends on which side it
;   was activated from (since the final door in the sequence from one side is the first door in the sequence from the other).
; - Call back to the controller script once they've finished animating, so the controller can make sure all of the doors
;   have finished before it resumes processing events.
 

;New Properties
float[] property DelayTimings Auto Const
{A two-element array; the delay before the door opens when activated from the [0] Primary and [1] Secondary sides.}

;Local variables.
DLC01:DLC01_MechanistDoorControlScript myController	;The Primary Controller for this system of doors.


;Called by the Controller to initialize each of its doors.
Function InitializeDoor(DLC01:DLC01_MechanistDoorControlScript controller)
	;Store the controller.
	myController = controller
	;Register for the event sent by the Controller to open or close the doors.
	Self.RegisterForCustomEvent(controller, "SetMechanistDoorState")
EndFunction

;On Unload, discard local refs.
Event OnUnload()
	myController = None
EndEvent

;Open or close when we receive the event from our Controller.
Event DLC01:DLC01_MechanistDoorControlScript.SetMechanistDoorState(DLC01:DLC01_MechanistDoorControlScript akSender, Var[] args)
	bool shouldOpen = args[0] as bool
	if (shouldOpen) ;args[0] = shouldOpen
		;If we're opening, we open with a delay based on which Controller the player activated.
		float delay
		if (args[1] as bool) ;args[1] = sourceIsPrimaryController
			delay = DelayTimings[0]
		Else
			delay = DelayTimings[1]
		EndIf
		Utility.Wait(delay)
		if (Self.Is3DLoaded())
			Self.SetOpen(shouldOpen)
			myController.DoorDone(Self)
		EndIf
	Else
		;If we're closing, just close. All doors close immediately to keep the player from potentially getting stuck.
		Self.SetOpen(shouldOpen)
		myController.DoorDone(Self)
	EndIf
EndEvent