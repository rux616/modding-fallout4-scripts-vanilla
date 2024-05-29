ScriptName SpotlightDestructionScript extends ObjectReference
{Lets the spotlight know when I'm destroyed}

import debug


;************************************

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
    if(aiCurrentStage == 2)
    	;I'm destroyed, let master script know
    	disable()
    endif
EndEvent

;************************************