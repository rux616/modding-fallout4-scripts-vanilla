Scriptname DN084_GlassElevatorIDCardReaderScript extends IDCardReaderScript Hidden
{Script for the ID Card Readers that controls the glass elevators in Mass Fusion.}

Group DN084_Properties
	Quest property DN084 Auto Const Mandatory
	{DN084}

	Scene property DN084_Player_01_IDCardReaderPowerOut Auto Const Mandatory
	{DN084 Glass Elevator Power Out response scene.}
	
	Message property DN084_ElevatorOutOfPowerMessage Auto Const Mandatory
	{DN084 Glass Elevator Power Out message.}
EndGroup


State Green
	Event OnActivate(ObjectReference akActionRef)
		if (DN084.GetStageDone(225) && !DN084.GetStageDone(260))
			NeedsCardFailureSound.Play(Self)
			DN084_ElevatorOutOfPowerMessage.Show()
			DN084_Player_01_IDCardReaderPowerOut.Start()
		EndIf
	EndEvent
EndState
