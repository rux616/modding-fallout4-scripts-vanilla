Scriptname Inst301MoveX6ToElevatorTrigScript extends ObjectReference Hidden

Quest Property Inst301 Auto
ReferenceAlias Property X6 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	(Inst301 as Inst301Script).X6MoveToElevator = TRUE
    	(X6.GetActorReference()).EvaluatePackage()
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	(Inst301 as Inst301Script).X6MoveToElevator = FALSE
    	(X6.GetActorReference()).EvaluatePackage()
    endif
EndEvent