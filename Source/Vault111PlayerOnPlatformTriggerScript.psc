ScriptName Vault111PlayerOnPlatformTriggerScript extends ObjectReference
{Vault 111. Player is entering the vault again and is loaded on the platform going down.}

Vault111ElevatorHandlerScript Property Vault111ElevatorHandler Auto Const
ObjectReference Property V111ElevatorNavCutterREF Auto Const
ObjectReference Property V111ReturnElevatorFailsafeMoveMarker Auto Const

Event onTriggerEnter(ObjectReference akActionRef)
	If akActionRef == game.GetPlayer()
		OBjectReference Link = self.getlinkedref()
		Debug.trace(self + "Elevator Script (Interior) - Resetting Interior Elevator.")
		Self.Disable()
		Link.PlayAnimation("reset")
		Utility.wait(1.0)
		;failsafe move the player to the platform since he sometimes loads on the floor
		Game.GetPlayer().Moveto(V111ReturnElevatorFailsafeMoveMarker)
		Game.FadeOutGame(false, true, 0.0, 1.0)
		Debug.trace(self + "Elevator Script (Interior)- Lowering Interior Elevator. Enable Player Controls.")
		;Link.PlayAnimationAndWait("stage2", "animFinish")
		; KMK - changed to just playAnimation since animFinish isn't valid - 73078
		Link.PlayAnimation("stage2")
		Debug.trace(self + "enable controls")
		;enable player controls
		Vault111ElevatorHandler.EnableControlsForElevator()

		V111ElevatorNavCutterREF.Disable()
	EndIf			
EndEvent