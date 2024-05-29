Scriptname Vault111ElevatorHandlerScript extends Quest
{Script to handle locking the Player's controls on the elevator in Vault111Cryo and Vault111Ext}

InputEnableLayer Property ElevatorInputLayer Auto Hidden

Function DisableControlsForElevator()
	ElevatorInputLayer = InputEnableLayer.Create()
	ElevatorInputLayer.DisablePlayerControls()
EndFunction

Function EnableControlsForElevator()
	ElevatorInputLayer = None
EndFunction