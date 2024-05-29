Scriptname DN124SetGlobalOnInvChange extends ObjectReference

GlobalVariable Property BuzzBiteRecipeFound Auto

auto State Waiting

	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	  if akNewContainer == Game.GetPlayer()
	  	GoToState("Done")
	    ;Debug.Trace("I just got put in the player's inventory!")
	    BuzzBiteRecipeFound.SetValueInt(1)

	  endIf

	endEvent

endState


state Done
;do nothing

endState