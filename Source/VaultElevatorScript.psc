ScriptName VaultElevatorScript extends ObjectReference
	{This script controls Vault Exit Elevators.}

OBJECTREFERENCE PROPERTY CollisionVolumeToggle AUTO const	
OBJECTREFERENCE PROPERTY InteriorAutoLoadDoor AUTO const
ObjectReference Property V111ElevatorCollisionRingEnableMarker Auto const
ObjectReference Property V111ElevatorCollisionPlatformEnableMarker Auto const

IMAGESPACEMODIFIER PROPERTY transitionISFX AUTO const

BOOL PROPERTY IsInteriorElevator AUTO const
	{Set to FALSE (DEFAULT) to control the exterior portion of the elevator.  Set to TRUE to control the interior portion.}
BOOL PROPERTY IsRaiseTrigger AUTO const
	{Set to FALSE (DEFAULT) to control the descent the elevator.  Set to TRUE to control the ascent of the elevator.}

BOOL IsReadyToAscend = false
BOOL IsReadyToDescend = false

BOOL PlayerReveal = true

Vault111ElevatorHandlerScript Property Vault111ElevatorHandler Auto Const

auto State ElevatorIsIdle
	;Elevator is idle.

	;used when the player re-activates the vault elevator in the exterior by pushing the button
	Event onActivate(ObjectReference akActionRef)
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

	Event onLoad()
		Debug.trace("Elevator Script - State: ElevatorIsIdle")
		If IsInteriorElevator
			If IsRaiseTrigger == false
				Debug.trace("Elevator Script (Interior)- Elevator is descending.")
				GoToState("ElevatorIsReady")
			Else
				IsReadyToAscend=True
				GoToState("ElevatorIsReady")
			EndIf
		Else
			OBjectReference Link = self.getlinkedref()
			;when we load the first time, we play a special reveal scene along with the elevator raise. don't do this twice
			If PlayerReveal
				PlayerReveal = false
			Else
				;make sure the elevator is in the right spot, then disable the collision keeping the player from falling
				Link.PlayAnimation("stage5")
				Utility.Wait(0.5)
				V111ElevatorCollisionPlatformEnableMarker.Disable()
			EndIf
		EndIf
	EndEvent

	Event onTriggerEnter(ObjectReference obj)
		If IsReadyToAscend == false && IsInteriorElevator == true
			If obj == game.GetPlayer()
				Debug.trace("Elevator Script (Interior) - Vault Elevator is ready to ascend.")
				IsReadyToAscend = true
				GoToState("ElevatorIsReady")
			EndIf
		EndIf	
		
		;NEW
		If IsReadyToDescend == false && IsInteriorElevator == false
			If obj == game.GetPlayer()
				Debug.trace("Elevator Script (Exterior) - Vault Elevator is ready to Descend. Enable Player Controls")
				IsReadyToDescend = true
				GoToState("ElevatorIsReady")
				;enable player controls
				Vault111ElevatorHandler.EnableControlsForElevator()
			EndIf
		EndIf
	EndEvent
EndState

State ElevatorIsReady
	Event OnBeginState(string asOldState)
		Debug.trace("Elevator Script - State: ElevatorIsReady")
	EndEvent

	Event onTriggerEnter(ObjectReference obj)
		If obj == game.GetPlayer()
			OBjectReference Link = self.getlinkedref()
			If IsInteriorElevator
				If IsRaiseTrigger
					IsReadyToAscend = false
					Debug.trace("Elevator Script (Interior) - Raising Interior Elevator. Disabling Player Controls.")
					;disable player controls
					Vault111ElevatorHandler.DisableControlsForElevator()
					Link.PlayAnimation("stage3")
					InteriorAutoLoadDoor.enable()
					Utility.wait(5.0)
					Game.FadeOutGame(true, true, 0.5, 1.0, true)
				Else	
					Debug.trace("Elevator Script (Interior) - Resetting Interior Elevator.")
					Link.PlayAnimation("reset")
					Utility.wait(1.0)
					Game.FadeOutGame(false, true, 0.0, 1.0)
					Debug.trace("Elevator Script (Interior)- Lowering Interior Elevator. Enable Player Controls.")
					Link.PlayAnimationAndWait("stage2", "animFinish")
					;enable player controls
					Vault111ElevatorHandler.EnableControlsForElevator()
					IsReadyToAscend = false
				EndIf
			Else
				Debug.trace("Elevator Script (Exterior) - Lowering Exterior Elevator. Disabling Player Controls.")
				;disable player controls
				Vault111ElevatorHandler.DisableControlsForElevator()
				InteriorAutoLoadDoor.disable()
				Link.PlayAnimation("stage8")
				Utility.wait(1.0)
				Game.FadeOutGame(true, true, 2.0, 1.5, true)
			EndIf
		EndIf			
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
		If IsReadyToAscend == false
	    	GoToState("ElevatorIsIdle")
		EndIf
	EndEvent
EndState