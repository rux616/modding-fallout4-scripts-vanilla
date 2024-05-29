ScriptName DN015IsotopePlacementActivator extends ObjectReference 


ReferenceAlias Property Isotope Auto Const
ReferenceAlias Property myContainer Auto Const
Message Property DN015_IsotopeNeededMessage Auto Const
GlobalVariable Property DN015_IsotopePlaced Auto Const
ObjectReference Property DN015_PuzzleTerminalRef Auto Const
DN015PuzzleScript Property DN015Puzzle Auto Const

Event OnActivate(ObjectReference AkActivator)
	ObjectReference Player = game.GetPlayer()
	if akActivator == Player
		if Player.GetItemCount(Isotope.GetReference()) >= 1
			Player.RemoveItem(Isotope.GetReference(), 1, false, myContainer.GetReference())
			GetLinkedRef().Enable()
			Self.Disable()
			DN015_IsotopePlaced.SetValue(1)

			DN015Puzzle.CheckForAllItemsPlaced()
			DN015_PuzzleTerminalRef.AddTextReplacementData("DN015IsotopeCurrent", Isotope.GetReference().GetBaseObject())
		else
			DN015_IsotopeNeededMessage.Show()
		endif
	endif
EndEvent
