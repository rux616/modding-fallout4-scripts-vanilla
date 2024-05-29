Scriptname DN084_ReactorElevatorKillBoxScript extends ObjectReference Hidden
{Trigger in the DN084 Reactor Level elevator. This trigger turns on during the security event and off afterwards. It kills any robots that happen to have become stuck in the elevator.}

Faction property DN084_MassFusionLabSecurityFaction Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActivator)
	Actor akActivatorActor = akActivator as Actor
	if ((DN084_MassFusionLabSecurityFaction != None) && (akActivatorActor != None) && (akActivatorActor.IsInFaction(DN084_MassFusionLabSecurityFaction)))
		akActivatorActor.Kill()
	EndIf
EndEvent