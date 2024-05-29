ScriptName VaultElevatorAscendAgainScript extends ObjectReference
{Player is leaving Vault 111 again after the first time.}

ObjectReference PROPERTY Vault111InteriorAutoLoadDoorREF AUTO const
OBjectReference Property Vault111AlwaysEnableControlsTriggerREF Auto Const
OBjectReference Property V111ElevatorCollisionPlatformEnableMarker Auto Const
ObjectReference Property V111IntCompanionFailsafeWarpTriggerREF Auto Const
Vault111ElevatorHandlerScript Property Vault111ElevatorHandler Auto Const

ObjectReference Property V111ElevatorNavCutterREF Auto Const

Event onTriggerEnter(ObjectReference akActionRef)
	If akActionRef == game.GetPlayer()
		Debug.trace("Elevator Script (Interior) - Raising Interior Elevator. Disabling Player Controls.")
		OBjectReference Link = self.getlinkedref()

		;disable player controls
		Vault111ElevatorHandler.DisableControlsForElevator()

		;disable this trigger, re-enable all the triggers we need for the ascent
		Self.Disable()
		Vault111AlwaysEnableControlsTriggerREF.Enable()
		V111ElevatorCollisionPlatformEnableMarker.Enable()
		V111ElevatorNavCutterREF.Enable()
		V111IntCompanionFailsafeWarpTriggerREF.Enable()

		;enable the autoload door		
		Vault111InteriorAutoLoadDoorREF.enable()
		Utility.Wait(2.0)

		;raise elevator
		Link.PlayAnimation("stage3")

		;wait for animation to play before fade out
		Utility.wait(4.0)
		Game.FadeOutGame(true, true, 0.5, 1.0, true)
	EndIf
EndEvent