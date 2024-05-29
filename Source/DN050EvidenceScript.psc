Scriptname DN050EvidenceScript extends ObjectReference 

quest property DN050 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akNewContainer == game.getplayer()
    	if DN050.getStage() == 30
    		DN050.setstage(35)
		endif
    endif
EndEvent
