Scriptname DLC03:DLC03_WESafeEnableMarkerScript extends ObjectReference
{Script used for Wilderness Encounters that are disabled during quests. Provides a safe way to reenable them when the quest is done.}

Auto State Normal
	;Do nothing
EndState

State WaitingForDetach
	Event OnCellDetach()
		Self.EnableNoWait()
		GoToState("Normal")
	EndEvent
EndState

Function EnableIfUnloaded()
	if (Self.GetParentCell().IsLoaded())
		GoToState("WaitingForDetach")
	Else
		Self.EnableNoWait()
	EndIf
EndFunction