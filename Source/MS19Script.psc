Scriptname MS19Script extends Quest

InputEnableLayer property MS19Layer auto

Function Freeze()
	MS19Layer = InputEnableLayer.Create()
    MS19Layer.DisablePlayerControls()
EndFunction

Function UnFreeze()
    MS19Layer.EnablePlayerControls()
EndFunction

