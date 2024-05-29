Scriptname MS16BoxcarDoorScript extends ReferenceAlias

quest property MS16quest auto


auto state firstTime
	Event OnOpen(ObjectReference akActionRef)
		if MS16quest.getstage() == 235 && akActionRef == game.getplayer() 
	    	MS16quest.setstage(238)
	    	gotoState("doNothing")
	    endif
	EndEvent
endstate

state doNothing
endstate