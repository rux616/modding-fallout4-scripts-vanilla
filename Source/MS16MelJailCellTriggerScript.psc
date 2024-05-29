Scriptname MS16MelJailCellTriggerScript extends ObjectReference
 
quest property MS16Quest auto mandatory
actor property MS16Mel auto mandatory

Event onTriggerLeave(ObjectReference akActionRef)
	if akActionRef == MS16Mel && MS16Quest.getstage() == 55
		MS16Quest.setstage(58)
	endif
EndEvent