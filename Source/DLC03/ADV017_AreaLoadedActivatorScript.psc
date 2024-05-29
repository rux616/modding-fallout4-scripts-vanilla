Scriptname DLC03:ADV017_AreaLoadedActivatorScript extends ObjectReference Const


ADV017QuestScript Property DLC03_ADV017 Auto Const Mandatory


Event OnCellAttach()
	DLC03_ADV017.SetAreaLoaded(true)
EndEvent

Event OnCellDetach()
	DLC03_ADV017.SetAreaLoaded(false)
EndEvent