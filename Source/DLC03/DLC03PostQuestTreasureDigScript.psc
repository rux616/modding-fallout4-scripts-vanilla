Scriptname DLC03:DLC03PostQuestTreasureDigScript extends Quest

InputEnableLayer myLayer

Function BlockPlayerControls()
	myLayer = InputEnableLayer.Create()
	myLayer.DisablePlayerControls()
EndFunction

Function UnblockPlayerControls()
	myLayer.Delete()
EndFunction
