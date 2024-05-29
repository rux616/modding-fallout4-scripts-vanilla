Scriptname MS07bScript extends Quest

InputEnableLayer myLayer

Function BlockPlayerControls()
	myLayer = InputEnableLayer.Create()
	myLayer.DisablePlayerControls()
EndFunction

Function UnblockPlayerControls()
	myLayer.Delete()
EndFunction