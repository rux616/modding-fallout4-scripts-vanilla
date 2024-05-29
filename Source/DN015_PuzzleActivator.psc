Scriptname DN015_PuzzleActivator extends ReferenceAlias Const
{}


ReferenceAlias Property myMiscObject Auto Const

ReferenceAlias Property QuestContainer Auto Const


Event OnActivate(objectReference akActivator)
	if akActivator == game.GetPlayer() && GetReference().isEnabled()
		GetReference().Disable()
		game.GetPlayer().AddItem(myMiscObject.GetReference())
	endif
EndEvent