Scriptname MS02Script extends Quest

InputEnableLayer property MS02Layer auto

Function Freeze()
	MS02Layer = InputEnableLayer.Create()
    MS02Layer.DisablePlayerControls()
EndFunction

Function UnFreeze()
    MS02Layer.EnablePlayerControls()
EndFunction
