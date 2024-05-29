Scriptname DN101_OnCellDetach extends ObjectReference Hidden Const

Group Required_Properties
	Quest Property MyQuest Auto Const
	{Quest containing the Stage to Set}

	Int Property StageToSet Auto Const
	{Stage to Set}
EndGroup

Group Optional_Properties
	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this event to fire}

	Int Property TurnOffStage = -1 Auto Const
	{If the quest stage is equal or greater than TurnOffStage, further events are ignored
	 NOTE: this stage does not actually have to be set - any quest stage equal or higher will turn off this script}
EndGroup

Event OnCellDetach()
	if MyQuest.GetStageDone(StageToSet) == false && ( PrereqStage == -1 || MyQuest.GetStageDone(PrereqStage) ) && ( TurnOffStage == -1 || MyQuest.GetStage() < TurnOffStage )
		MyQuest.SetStage(StageToSet)
	endif
EndEvent