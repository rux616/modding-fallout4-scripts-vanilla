Scriptname DLC04:DLC04DialogueHubologistsScript extends Quest

InputEnableLayer property HubLayer auto

Function Freeze()
	HubLayer = InputEnableLayer.Create()
    HubLayer.DisablePlayerControls()
EndFunction

Function UnFreeze()
    HubLayer.EnablePlayerControls()
EndFunction