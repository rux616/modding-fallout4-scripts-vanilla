Scriptname DLC04:DLC04_MonorailUpdaterScript extends ObjectReference Const
{Script for a dummy object in cells that care about the state of the monorail. On Cell Load, they prompt the Monorail to update its state.}

DLC04:DLC04_MonorailScript property Monorail Auto Const
{The monorail whose state we want to update.}

Event OnCellLoad()
	Monorail.UpdateMonorailState()
EndEvent