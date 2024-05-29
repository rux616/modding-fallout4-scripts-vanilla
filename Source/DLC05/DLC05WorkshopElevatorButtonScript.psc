Scriptname DLC05:DLC05WorkshopElevatorButtonScript extends ObjectReference
{This script talks to the Elevator script for the workshop elevators}

Message Property DLC05_ElevatorRequiresPowerMessage Auto Const Mandatory
{Message Shown when there is no power}

int Property FloorNumber = 1 Auto Const
{Which floor this button goes to}

bool hasPower
Function SetHasPower(bool shouldBePowered)
	hasPower = shouldBePowered
	if hasPower
		PlayAnimation("Play02")
	else
		PlayAnimation("StartOff")
	endif
EndFunction

;/
Function SetElevatorParent(ObjectReference myElevator)
	ElevatorParent = myElevator as DLC05:DLC05WorkshopElevatorScript
EndFunction
/;

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(self + ": Has Received OnWorkshopObjectDestroyed !!!!!")
	Delete()
EndEvent

Auto State Ready
	Event OnActivate(ObjectReference akActivator)
		GoToState("busy")
		if hasPower
			;Play the button press anim
			PlayAnimation("Play01")
			;If the elevator is busy, immediately go back
			if (GetLinkedRef() as DLC05:DLC05WorkshopElevatorScript).GoToFloor(FloorNumber)
				Debug.Trace(self + ": myElevator is busy")
				utility.wait(1.0)
				PlayAnimation("Play01")
				GoToState("Ready")
			else 	;This occurs if the elevator is NOT busy
					;and happens after it reaches the floor intended
				PlayAnimation("Play01")
				GoToState("Ready")
			endif
		else
			DLC05_ElevatorRequiresPowerMessage.Show()
			GoToState("Ready")
		endif
	EndEvent
EndState

State busy
EndState
;/
State busy
	Function SetButtonFree()
		if hasPower
			PlayAnimation("Play01")
		endif
		GoToState("Ready")
	EndFunction
EndState

Function SetButtonFree()
EndFunction
/;