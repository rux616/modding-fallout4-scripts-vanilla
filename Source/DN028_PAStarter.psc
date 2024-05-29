Scriptname DN028_PAStarter extends ObjectReference Const


Quest Property DN028_PAsystem Auto Const

;This should start the PA quest
Event OnCellAttach()
	DN028_PAsystem.SetStage(0)
EndEvent

;This should stop the PA quest
Event OnCellDetach()
	DN028_PAsystem.SetStage(1000)
EndEvent