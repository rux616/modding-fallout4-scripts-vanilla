Scriptname TempCopperHarvestScript extends ObjectReference  
{Prototype of environmental scavenging gameplay}

ingredient property copperpipe auto

EVENT onActivate(ObjectReference actronaut)
	actronaut.additem(copperpipe, 1)
	getLinkedRef().disable()
	disable()
endEVENT