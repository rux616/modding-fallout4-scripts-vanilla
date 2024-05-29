Scriptname DLC05:DLC05WorkshopElevatorNavCutScript extends ObjectReference
{This script talks to the Elevator script for the workshop elevators}

;The Elevator script should be registering this object for the event
;This is listening for when the elevator is deleted from the workshop
Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(self + ": Has Received OnWorkshopObjectDestroyed !!!!!")
	Delete()
EndEvent