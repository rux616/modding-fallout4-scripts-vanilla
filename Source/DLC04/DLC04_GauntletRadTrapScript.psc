Scriptname DLC04:DLC04_GauntletRadTrapScript extends ObjectReference Const

ObjectReference[] property DLC04Gauntlet_RadTrapTriggers Auto Const Mandatory
ObjectReference property DLC04Gauntlet_WalkwayRadiationTrapHazard Auto Const Mandatory

Event OnActivate(ObjectReference akActivator)
	Debug.Trace("I was activated by " + akActivator)
	StartTimer(0)
EndEvent

Event OnTimer(int timerID)
	bool isPlayerInTrigger = False
	int i = 0
	While (!isPlayerInTrigger && (i < DLC04Gauntlet_RadTrapTriggers.Length))
		Debug.Trace("Checking... " + DLC04Gauntlet_RadTrapTriggers[i])
		isPlayerInTrigger = DLC04Gauntlet_RadTrapTriggers[i].GetTriggerObjectCount() > 0
		i = i + 1
	EndWhile
	if (!Self.Is3DLoaded() || !isPlayerInTrigger)
		Debug.Trace("Player not found. Disabling.")
		DLC04Gauntlet_WalkwayRadiationTrapHazard.DisableNoWait()
	Else
		Debug.Trace("Restarting Timer")
		DLC04Gauntlet_WalkwayRadiationTrapHazard.EnableNoWait()
		StartTimer(1)
	EndIf
EndEvent