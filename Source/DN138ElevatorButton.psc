Scriptname DN138ElevatorButton extends ObjectReference Hidden

Event OnActivate(ObjectReference akActionRef)
    if (GetLinkedRef() as DN138Elevator).GetState() == "DownPosition" || (GetLinkedRef() as DN138Elevator).GetState() == "UpPosition"
    	playAnimationAndWait("Stage2","Reset")
    	(GetLinkedRef() as DN138Elevator).MoveElevator()
    endif
EndEvent