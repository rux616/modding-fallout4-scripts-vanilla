Scriptname DLC04:DLC04_MonorailLoadoutScript extends ObjectReference
{Script for triggers in the Monorail tunnels. During a Monorail load, apply an Imagespace Modifier to fade to black.}

Group Required_Properties
	GlobalVariable property DLC04_MonorailLoadActive Auto Const Mandatory
	{Used to indicate if a Monorail Load is in progress. Set to 1 during the load, then back to 0 after.}

	ImagespaceModifier property DLC04_FadeToBlackImod Auto Const Mandatory
	{IMod: Fades to black over 1s, then holds there for 4s.}

	ImagespaceModifier property HoldAtBlackImod Auto Const Mandatory
	{IMod: Holds at black indefinitely.}
EndGroup

DLC04:DLC04_MonorailScript property Monorail Auto Const Mandatory


Auto State Ready
	Event OnTriggerEnter(ObjectReference obj)
		Actor player = Game.GetPlayer()
		if ((obj == player) && (DLC04_MonorailLoadActive.GetValue() > 0))
			GoToState("Busy")
			DLC04_FadeToBlackImod.Apply()
			Utility.Wait(1)
			;For safety, recheck the global to be absolutely sure nothing unexpected has happened during the delay (the player hit the load early, etc.).
			;Otherwise, we might apply this Imod after the point in which we remove it, which would be bad.
			if (DLC04_MonorailLoadActive.GetValue() > 0)
				DLC04_FadeToBlackImod.PopTo(HoldAtBlackImod)
			EndIf
			Monorail.LoadoutTriggerFadeFinished()
			GoToState("Ready")
		EndIf
	EndEvent
EndState 

State Busy
	Event OnTriggerEnter(ObjectReference obj)
		;Do nothing.
	EndEvent
EndState
