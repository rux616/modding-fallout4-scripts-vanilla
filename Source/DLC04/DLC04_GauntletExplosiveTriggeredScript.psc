Scriptname DLC04:DLC04_GauntletExplosiveTriggeredScript extends ObjectReference Const

Keyword property LinkCustom01 Auto Const Mandatory
Quest property DLC04MQ01 Auto Const Mandatory

Event OnCellLoad()
	if (DLC04MQ01.IsRunning())
		ObjectReference[] links = Self.GetLinkedRefChain(LinkCustom01)
		int i = 0
		While (i < links.Length)
			Debug.Trace("Explosive Trigger registering for " + links[i])
			Self.RegisterForRemoteEvent(links[i], "OnActivate")
			i = i + 1
		EndWhile
	EndIf
EndEvent

Event OnUnload()
	UnregisterForAllEvents()
EndEvent

Event ObjectReference.OnActivate(ObjectReference source, ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		Debug.Trace("Ignoring; player disarmed the trap.")
	Else
		Debug.Trace("Explosive " + source + " was activated by " + akActivator + "; setting stage.")
		Utility.Wait(4)
		DLC04MQ01.SetStage(215)
		UnregisterForAllEvents()
	EndIf
EndEvent