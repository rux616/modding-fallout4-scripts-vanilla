Scriptname DLC04:DLC04_MonorailControlsScript extends ObjectReference
{Script for the Monorail Control Panel.}

Group Autofill_Properties
	Quest property DLC04MQ00 Auto Const Mandatory
	{DLC04MQ00}

	Quest property DLC04MQ01Gauntlet Auto Const Mandatory
	{DLC04MQ01Gauntlet}

	Message property DLC04MQ00NukaExpressControlMessageOverOr30 Auto Const Mandatory
	{Message: Does the player want to proceed to Nuka World? Display only during MQ00 (the first use), if Player Level >= 30.}

	Message property DLC04MQ00NukaExpressControlMessageUnder30 Auto Const Mandatory
	{Message: Does the player want to proceed to Nuka World? Display only during MQ00 (the first use), if Player Level < 30.}

	Message property DLC04_MonorailPowerCutMessage Auto Const Mandatory
	{Message: Power has been cut.}

	Message property DLC04_MonorailPowerOutMessage Auto Const Mandatory
	{Message: Power is out.}
EndGroup

Group Reference_Properties
	DLC04:DLC04_MonorailScript property Monorail Auto Const
	{The Monorail these controls control.}
EndGroup

bool shouldReenableOnUnload


State On
	Event OnBeginState(String asOldState)
		if (Self.WaitFor3DLoad())
			Self.PlayAnimation("StartOn01")
		Else
			Debug.Trace("ERROR: Unable to set " + Self + " to the ON state; its 3D didn't load.", 2)
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			if (Monorail.IsMoving())
				Debug.Trace("ERROR: Control Lever " + Self + " was in the On state while the Monorail was moving.", 2)
			EndIf

			;During MQ00 (the player's first trip into the park), prompt them to confirm that they really want to travel to Nuka-World.
			;Omit this message box subsequently.
			if (DLC04MQ00.IsRunning())
				int selection
				if (Game.GetPlayer().GetLevel() < 30)
					selection = DLC04MQ00NukaExpressControlMessageUnder30.Show()
				Else
					selection = DLC04MQ00NukaExpressControlMessageOverOr30.Show()
				EndIf
				if (selection != 0)
					return
				EndIf
			EndIf

			GoToState("Busy")
			Self.PlayAnimationAndWait("Play01", "done")
			Monorail.ControlLeverActivated()
		EndIf
	EndEvent
EndState 

State Off
	Event OnBeginState(String asOldState)
		if (Self.WaitFor3DLoad())
			Self.PlayAnimation("StartOff01")
		Else
			Debug.Trace("ERROR: Unable to set " + Self + " to the OFF state; its 3D didn't load.", 2)
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			Self.PlayAnimationAndWait("Play01", "done")
			if (Monorail.IsMoving())
				;Then nothing is wrong; we're just not doing anything in response to the player pulling the lever.
			ElseIf (DLC04MQ01Gauntlet.IsRunning())
				DLC04_MonorailPowerCutMessage.Show()
			Else
				DLC04_MonorailPowerOutMessage.Show()
			EndIf
		EndIf
	EndEvent
EndState


State Busy
	;Do nothing.
EndState

Function SetOn()
	GoToState("On")
EndFunction

Function SetOff()
	GoToState("Off")
EndFunction


Function ReenableOnUnload(bool shouldReenable)
	shouldReenableOnUnload = shouldReenable
EndFunction

Event OnUnload()
	if (shouldReenableOnUnload)
		SetOn()
	EndIf
EndEvent