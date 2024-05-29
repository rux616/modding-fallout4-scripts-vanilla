Scriptname COMDeaconUnloadedScript extends ReferenceAlias
{When Deacon gets unloaded note it down.}

Event OnUnload()

    ; If Deacon is unloaded set this to TRUE
	pCOMDeaconUnloaded.SetValue(1.0)

EndEvent

Event OnLoad()

    ; If Deacon is loaded set this to FALSE
	;pCOMDeaconUnloaded.SetValue(0.0)

EndEvent

GlobalVariable Property pCOMDeaconUnloaded Auto Const
