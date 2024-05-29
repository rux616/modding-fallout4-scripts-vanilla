ScriptName DN133EggCounterScript extends RefCollectionAlias


DN133QuestScript Property DN133 Auto Const
int Property DestructionStageToCheckFor = 1 Auto Const

Event OnDestructionStageChanged(ObjectReference akSenderRef, int aiOldStage, int aiCurrentStage)
	Debug.Trace(SELF + ": >> " + akSenderRef + " << OnDestructionStageChanged >> " + aiCurrentStage)
    if aiCurrentStage == DestructionStageToCheckFor
    	RemoveRef(akSenderRef)
		DN133.IncrementEggCounter()
    endif
EndEvent


Event OnActivate(ObjectReference akSenderRef, ObjectReference akActivateRef)
	Debug.Trace(SELF + ": >> " + akSenderRef + " << recieved OnActivate from >> " + akActivateRef)
	if akActivateRef as Actor
		RemoveRef(akSenderRef)
		DN133.IncrementEggCounter()
	endif
EndEvent