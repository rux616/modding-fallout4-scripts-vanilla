Scriptname vault111CryoPreloadSCRIPT extends ObjectReference

OBJECTREFERENCE PROPERTY exitDoor AUTO

Auto State WaitingforPlayer
	EVENT OnTriggerEnter(ObjectReference akActionRef)
		If akActionRef == game.getPlayer()
			gotoState("hasbeentriggered")
			; //take care of the preload stuff
			exitDoor.PreloadTargetArea()
		EndIf
	ENDEVENT
EndState

State hasbeentriggered
	;empty state
EndState