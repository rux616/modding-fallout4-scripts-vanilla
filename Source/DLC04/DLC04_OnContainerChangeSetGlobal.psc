Scriptname DLC04:DLC04_OnContainerChangeSetGlobal extends ObjectReference

GlobalVariable Property myGlobal Auto const Mandatory
int property globalSetInt = 1 auto const
{Set the global to this on container changed to the player}
Message Property myMessage Auto const

Auto State Waiting
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	 	if akNewContainer == Game.GetPlayer()
	  		GoToState("Done")
	    	;Debug.Trace("I just got put in the player's inventory!")
	   		myGlobal.SetValueInt(globalSetInt)
	   		if myMessage
	   			myMessage.Show()
	   		Endif
		endIf

	endEvent
EndState

State Done
EndState