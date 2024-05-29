Scriptname RETriggerSecondaryScript extends ObjectReference
{use for triggers linked to other RETriggers
mainly useful for triggers which use OnTrigger to fire
}

Event OnCellLoad()
	RETriggerScript myLinkedTrigger = GetLinkedRef() as RETriggerScript
	if myLinkedTrigger && myLinkedTrigger.TriggerOnLoad
		debug.trace(self + "OnLoad - calling StartEncounter on linked trigger " + myLinkedTrigger)
		myLinkedTrigger.OnCellLoad()
	endif
endEvent


Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef != Game.GetPlayer()
		return
	EndIf

	RETriggerScript myLinkedTrigger = GetLinkedRef() as RETriggerScript
	if myLinkedTrigger && !myLinkedTrigger.TriggerOnLoad
		debug.trace(self + "OnTriggerEnter - calling StartEncounter on linked trigger " + myLinkedTrigger)
		myLinkedTrigger.OnTriggerEnter(akActionRef)
	endif
EndEvent
