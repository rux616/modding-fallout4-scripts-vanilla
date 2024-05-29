Scriptname Inst305ReactorTriggerScript extends ObjectReference Conditional

ObjectReference Property ReactorRef Auto Const

Quest Property Inst305 Auto Const

Event OnActivate(ObjectReference ActionRef)


	if ActionRef == Game.GetPlayer()
		if Inst305.GetStage() == 70

			ReactorRef.PlayAnimation("play01")
			(Inst305 as Inst305QuestScript).Inst305ReactorReady=1
			Self.Disable()
		endif
	endif

endEvent