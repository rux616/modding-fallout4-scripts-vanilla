Scriptname DN015_EmitterOutputScript extends ObjectReference Const

Message Property DN015_PuzMessagePuzEmitterResult auto const
Quest Property DN015 auto const
int property SuccessStage = 100 auto Const
int property FailureStage = 110 auto Const

event OnActivate(objectReference akActivator)
	if akActivator == game.getPlayer()
		int result
		result = DN015_PuzMessagePuzEmitterResult.show()
		if result == 0 ; success
			self.disable()
			DN015.setStage(SuccessStage)
		elseif result == 1
			self.disable()
			DN015.setStage(FailureStage)
		endif
	endif
endEvent