Scriptname DN050BabyBottleScript extends ObjectReference 

ObjectReference property DN050Baby auto
quest property DN050 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == DN050Baby
		if DN050.getstage() == 30
			DN050.setstage(35)
		endif
	endif
EndEvent
