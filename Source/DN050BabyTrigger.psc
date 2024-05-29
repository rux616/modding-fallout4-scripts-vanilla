Scriptname DN050BabyTrigger extends ObjectReference 

miscObject property babyBottle01 auto
miscObject property babyBottle02 auto
quest property DN050 auto


Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef.getBaseObject() == babyBottle01 || akActionRef.getBaseObject() == babyBottle02
		if DN050.getstage() == 30
			DN050.setstage(35)
		endif
    endif
EndEvent


