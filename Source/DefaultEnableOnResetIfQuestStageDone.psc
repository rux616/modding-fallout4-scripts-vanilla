Scriptname DefaultEnableOnResetIfQuestStageDone extends ScriptedResetRef Default

Quest Property MyQuest Auto Const Mandatory
Int Property MyStage Auto Const Mandatory

Event OnCellDetach()
	RegisterForReset()
EndEvent

Function ScriptedReset()
	if MyQuest.IsStageDone(MyStage)
		self.Enable()
	endif
EndFunction