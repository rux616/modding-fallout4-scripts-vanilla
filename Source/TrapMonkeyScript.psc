Scriptname TrapMonkeyScript extends ObjectReference

Keyword Property MonkeyTrigger Auto

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
    if (aiOldStage == 0 && aiCurrentStage > 0)
		
		GetLinkedRef(MonkeyTrigger).disable()
    
    endif

EndEvent