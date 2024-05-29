ScriptName Vault111DescendAgainTriggerScript extends ObjectReference
{Controls the Exterior Postwar Vault 111 Descent}

OBJECTREFERENCE PROPERTY Vault111InteriorAutoLoadDoorREF AUTO const
ObjectReference Property Vault111IntPlatformTrigger Auto Const
ObjectReference Property V111IntCompanionFailsafeWarpTriggerREF Auto Const
Vault111ElevatorHandlerScript Property Vault111ElevatorHandler Auto Const

auto State ElevatorIsIdle
	;used when the player re-activates the vault elevator in the exterior by pushing the button
	Event onActivate(ObjectReference akActionRef)
		gotoState("EmptyState")
		Debug.trace("Elevator Script (Exterior) - Button has been pressed.  Vault Elevator is ready to descend.")
		OBjectReference Link = self.getlinkedref()
		Link.PlayAnimation("stage6")
		;don't allow the trigger to fire while the animation plays, but DO allow it to fire if the player waits inside it
		Self.Disable()
		;wait for the anim to finish
		Utility.Wait(5.0)
		Self.Enable()
		GoToState("ElevatorIsReady")
	EndEvent

	Event onTriggerEnter(ObjectReference akActionRef)
		;do thing in this state
	EndEvent
EndState

State ElevatorIsReady
	Event onTriggerEnter(ObjectReference akActionRef)
		If akActionRef == Game.GetPlayer()
			GoToState("ElevatorIsIdle")
			Debug.trace("Elevator Script (Exterior) - Lowering Exterior Elevator. Disabling Player Controls.")
			OBjectReference Link = self.getlinkedref()
			;disable player controls
			Vault111ElevatorHandler.DisableControlsForElevator()

			;setup everything we need for the descent
			Vault111InteriorAutoLoadDoorREF.Disable()
			Vault111IntPlatformTrigger.Enable()
			V111IntCompanionFailsafeWarpTriggerREF.Disable()
			
			;lower elevator
			Utility.Wait(2.0)			
			Link.PlayAnimation("stage8")
			Utility.wait(1.0)
			Game.FadeOutGame(true, true, 2.0, 1.5, true)
		EndIf
	EndEvent
EndState

State EmptyState
	Event onTriggerEnter(ObjectReference akActionRef)
		;empty state
	EndEvent

	Event onActivate(ObjectReference akActionRef)
		;empty state
	EndEvent
EndState