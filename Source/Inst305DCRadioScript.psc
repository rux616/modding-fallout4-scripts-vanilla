Scriptname Inst305DCRadioScript extends ReferenceAlias Conditional

Quest Property Inst305 Auto

Int Property ButtonPressed Auto
Message Property Inst305ModulatorMessage Auto

Event OnActivate (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if Inst305.GetStage() == 50
			ButtonPressed=Inst305ModulatorMessage.Show()
			if ButtonPressed == 0
				;do nothing
			elseif ButtonPressed == 1
				Inst305.SetStage(60)
			endif
		endif
	endif

endEvent