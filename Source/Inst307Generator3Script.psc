Scriptname Inst307Generator3Script extends ObjectReference Conditional Hidden

Quest Property Inst307 Auto Const

GlobalVariable Property Inst307GeneratorCurrent Auto

Event OnDestructionStageChanged(int OldStage, int CurrentStage)

	if CurrentStage >=1

		if Self == Inst307Generator1Ref
			(Inst307 as Inst307QuestScript).Generator1Disabled = 1

		elseif Self == Inst307Generator2Ref
			(Inst307 as Inst307QuestScript).Generator2Disabled = 1


		elseif Self == Inst307Generator3Ref
			(Inst307 as Inst307QuestScript).Generator3Disabled = 1

		endif

		Inst307.ModObjectiveGlobal(1, Inst307GeneratorCurrent, 40)

		if Inst307GeneratorCurrent.GetValue() == 3
			Inst307.SetStage(60)
		endif

	endif


EndEvent
ObjectReference Property LinkedGenerator Auto

ObjectReference Property Inst307Generator1Ref Auto

ObjectReference Property Inst307Generator2Ref Auto

ObjectReference Property Inst307Generator3Ref Auto