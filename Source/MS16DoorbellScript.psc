Scriptname MS16DoorbellScript extends ObjectReference 

quest property MS16 auto

Event onActivate(ObjectReference akActionRef)
	if (MS16.getstage() < 20)
		getlinkedref().activate(game.getplayer())
	endif
EndEvent