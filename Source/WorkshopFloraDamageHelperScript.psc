Scriptname WorkshopFloraDamageHelperScript extends ObjectReference Const
{script to pass damage to linked flora}

EVENT OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if IsDestroyed()
		debug.trace(self + " Destroyed - passing on to my linked ref (" + GetLinkedRef() + ")")
		; pass on destruction to linked ref
		GetLinkedRef().DamageObject(9999)
	endif
EndEvent
