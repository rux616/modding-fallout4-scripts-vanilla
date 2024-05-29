Scriptname DN133EggClutchScript extends ObjectReference Const

Keyword Property KeywordToRemove Auto Const

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if isDestroyed()
		RemoveKeyword(KeywordToRemove)
	endif
	if getLinkedRef()
		getLinkedRef().Activate(self)
	endif
EndEvent