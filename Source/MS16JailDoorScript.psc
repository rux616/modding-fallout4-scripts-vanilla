Scriptname MS16JailDoorScript extends ReferenceAlias

quest property MS16quest auto


auto state firstTime
	Event OnOpen(ObjectReference akActionRef)
	    if self.getReference().IsLocked() == false
	    	if MS16quest.getstage() == 55 || MS16quest.getstage() == 56
	    		MS16quest.setstage(58)
	    		gotostate("doNothing")
	    	endif
	    	if (akActionRef == Game.GetPlayer())
	    		self.getReference().SendStealAlarm(Game.GetPlayer())
	    	endif
	    endif
	EndEvent
endstate

state doNothing
endstate