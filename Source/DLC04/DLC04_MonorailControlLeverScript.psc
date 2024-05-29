Scriptname DLC04:DLC04_MonorailControlLeverScript extends ObjectReference
{Script for the DLC04 Monorail Control Levers.}

Quest property DLC04MQ01Gauntlet Auto Const Mandatory
Message property DLC04_MonorailPowerCutMessage Auto Const Mandatory
Message property DLC04_MonorailPowerOutMessage Auto Const Mandatory
DLC04:DLC04_MonorailScript property Monorail Auto Const

bool hasInitialized
Actor player
ObjectReference myMonorail


Function InitializeLever()
	hasInitialized = True
	player = Game.GetPlayer()
	myMonorail = Self.GetLinkedRef()
EndFunction

Quest property DLC04MQ00 Auto Const Mandatory
Message property DLC04MQ00NukaExpressControlMessage Auto Const Mandatory

State On
	Event OnBeginState(String asOldState)
		if (!hasInitialized)
			InitializeLever()
		EndIf
		if (Self.WaitFor3DLoad())
			Self.PlayAnimation("StartOn01")
		Else
			Debug.Trace("Unable to set " + Self + " to the ON state; its 3D didn't load.")
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		if (akActivator == player)
			if (Monorail.IsMoving())
				Debug.Trace("Control Lever " + Self + " was in the On state while the Monorail was moving.", 2)
			Else
				if (DLC04MQ00.IsRunning())
				int selection = DLC04MQ00NukaExpressControlMessage.Show()
				Debug.Trace("Selection was " + selection)
				if (selection != 0)
					return
				EndIf
			EndIf
			GoToState("Busy")
			Self.PlayAnimationAndWait("Play01", "done")
			Monorail.ControlLeverActivated()
			EndIf
		EndIf
	EndEvent
EndState 

State Busy
	;Do nothing.
EndState

State Off
	Event OnBeginState(String asOldState)
		if (!hasInitialized)
			InitializeLever()
		EndIf
		if (Self.WaitFor3DLoad())
			Self.PlayAnimation("StartOff01")
		Else
			Debug.Trace("Unable to set " + Self + " to the OFF state; its 3D didn't load.")
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		if (akActivator == player)
			if (Monorail.IsMoving())
				;Ignore activation while the Monorail is moving.
			Else
				if (DLC04MQ01Gauntlet.IsRunning())
					DLC04_MonorailPowerCutMessage.Show()
				Else
					DLC04_MonorailPowerOutMessage.Show()
				EndIf
			EndIf
		EndIf
	EndEvent
EndState


Function SetOn()
	if (GetState() == "Busy")
		Debug.Trace("Monorail Control Lever " + Self + " was in the Busy state. Ignoring.", 2)
	Else
		GoToState("On")
	EndIf
EndFunction

Function SetOff()
	if (GetState() == "Busy")
		Debug.Trace("Monorail Control Lever " + Self + " was in the Busy state. Ignoring.", 2)
	Else
		GoToState("Off")
	EndIf
EndFunction