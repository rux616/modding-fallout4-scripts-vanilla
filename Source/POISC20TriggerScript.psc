Scriptname POISC20TriggerScript extends ObjectReference Hidden
{Script for the POISC20 Trigger.}

GlowingKlaxonLightScript property POISC20Klaxon Auto Const Mandatory
Default2StateActivator property POISC20Door Auto Const Mandatory
Keyword property LinkCustom01 Auto Const Mandatory
ActorValue property ProtectronPodStatus Auto Const Mandatory

Auto State Waiting
	Event OnTriggerEnter(ObjectReference akActivator)
		GoToState("Done")
		POISC20Klaxon.PlayLights()
		StartTimer(6)
	EndEvent
EndState

State Done
	Event OnTriggerEnter(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState

Event OnTimer(int timerID)
	POISC20Door.SetOpenNoWait(True)
	;Fetch the actors.
	ObjectReference[] POIActors = POISC20Door.GetLinkedRefChain(LinkCustom01)
	;Release Sentry Bot (0)
	(POIActors[0] as Actor).SetUnconscious(False)
	POISC20Klaxon.StopLights()
EndEvent