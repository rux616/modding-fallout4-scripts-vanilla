Scriptname DLC03:V118_CellAttachTrackerScript extends ReferenceAlias

DLC03:DLC03DialogueV118Script Property DLC03DialogueV118 Auto Const Mandatory
Event OnCellDetach()
	DLC03DialogueV118.SetAttachTracker(false)
EndEvent

Event OnCellAttach()
	DLC03DialogueV118.SetAttachTracker(true)
EndEvent