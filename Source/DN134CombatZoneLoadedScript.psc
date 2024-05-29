Scriptname DN134CombatZoneLoadedScript extends ObjectReference Const

DN134QuestScript Property DN134 Auto Const

;This just tells the quest that the interior has loaded.
Event OnCellAttach()
	DN134.CombatZoneInteriorHasLoaded()
EndEvent