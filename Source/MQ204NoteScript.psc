Scriptname MQ204NoteScript extends ObjectReference Conditional

Quest Property MQ204 Auto Const

GlobalVariable Property MQ204_PlayerHasNote Auto Const



Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if MQ204_PlayerHasNote.GetValue() == 0

			 MQ204_PlayerHasNote.SetValue(1)
		endif
	endif

EndEvent