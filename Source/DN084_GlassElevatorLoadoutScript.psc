Scriptname DN084_GlassElevatorLoadoutScript extends ObjectReference Hidden
{Trigger at the top of the interior glass elevator shaft, and at the bottom of the exterior one. Apply an Imagespace Modifier to improve the load transition.}

;The DN084 Glass Elevators (see DN084_GlassElevatorScript) are intended to seem continuous to the player. However, the standard cell transition process
;breaks that illusion-- when the player passes through the autoload, the elevator on the other side won't start moving for a second or two because it has
;to wait for the cell to finish loading and for the Papyrus VM to unfreeze. This traps the player in a stationary elevator for a moment.
;
;To cover this, these triggers, placed just before the elevator autoload, use an IMod to fade to black and hold the screen at black until the elevator on
;the other side starts moving (typically 1-2s). DN084_GlassElevatorScript then takes care of removing the IMod.

Group Required_Properties
	GlobalVariable property DN084_ElevatorLoadActive Auto Const Mandatory
	{Global set by DN084_GlassElevatorScript that indicates whether the player is on an elevator heading into the load.}

	ImagespaceModifier property DN084_FadeToBlackImod Auto Const Mandatory
	{IMod: Fades to black over 1s, then holds there for 4s.}

	ImagespaceModifier property HoldAtBlackImod Auto Const Mandatory
	{IMod: Holds at black indefinitely.}
EndGroup


Auto State Ready
	Event OnTriggerEnter(ObjectReference obj)
		Actor player = Game.GetPlayer()
		if (obj == player)
			GoToState("Busy")
			Debug.Trace("Loadout Script: Applying Imagespace Modifier for Elevator Load.")
			DN084_FadeToBlackImod.Apply()
			DN084_ElevatorLoadActive.SetValue(1)
			Utility.Wait(0.75)
			;For safety, check the global to be absolutely sure nothing unexpected has happened during the delay (the player hit the load early, etc.).
			;Otherwise, we might apply this Imod after the point in which we remove it, which would be bad.
			if (DN084_ElevatorLoadActive.GetValue() > 0)
				DN084_FadeToBlackImod.PopTo(HoldAtBlackImod)
			EndIf
			GoToState("Ready")
		EndIf
	EndEvent
EndState

State Busy
	Event OnTriggerEnter(ObjectReference obj)
		;Do nothing.
	EndEvent
EndState
