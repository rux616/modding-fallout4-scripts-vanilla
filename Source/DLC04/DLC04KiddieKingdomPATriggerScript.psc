Scriptname DLC04:DLC04KiddieKingdomPATriggerScript extends DLC04:DLC04KiddieKingdomPATrigParent


Auto State Waiting
	Event OnTriggerEnter(ObjectReference akActionRef)
		Debug.Trace(Self + ": OnTriggerEnter")
		Debug.Trace(Self + ": mySceneNum == " + mySceneNum)
	    GoToState("Done")
	    if mySceneNum >= 0
	    	;Declared on Parent
	    	SendPAScene()
	    endif
	    if disableSelfOnTrigger
	    	disable()
	    endif
	EndEvent
endState

State Done 
EndState