Scriptname Vault111AlwaysEnableControlsScript extends ObjectReference Const

Vault111ElevatorHandlerScript Property Vault111ElevatorHandler Auto Const
ObjectReference Property V111ElevatorCollisionPlatformEnableMarker Auto Const

Event onTriggerEnter(ObjectReference obj)
	ObjectReference Link = Self.GetLinkedRef()
	Debug.trace(self + "Elevator Script (Always Enable Controls Trigger) - Player has loaded in after ascending.")
	Self.Disable()
	
	;make sure the elevator is in the right spot, then disable the collision keeping the player from falling
	Link.PlayAnimation("stage5")
	Utility.Wait(0.5)
	V111ElevatorCollisionPlatformEnableMarker.Disable()
	
	Game.FadeOutGame(false, true, 1.0, 1.0)	
	Utility.Wait(1.0)
	Vault111ElevatorHandler.EnableControlsForElevator()
EndEvent