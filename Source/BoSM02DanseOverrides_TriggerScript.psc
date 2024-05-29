Scriptname BoSM02DanseOverrides_TriggerScript extends ObjectReference Const Hidden
{Script on the triggers that start and stop the BoSM02DanseOverrides quest.}

Quest property BoSM02 Auto Const Mandatory
Quest property BoSM02DanseOverrides Auto Const Mandatory
ReferenceAlias property BoSM02PaladinDanse Auto Const Mandatory
ReferenceAlias property Companion Auto Const Mandatory

bool property shouldStartOverride Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		if ((BoSM02.IsRunning()) && (BoSM02.GetStage() < 350) && (Companion.GetActorRef() != None) && (Companion.GetActorRef() == BoSM02PaladinDanse.GetActorRef()))
			if (shouldStartOverride)
				BoSM02DanseOverrides.Start()
				BoSM02.SetStage(235)
			Else
				BoSM02DanseOverrides.Stop()
			EndIf
		EndIf
	EndIf
EndEvent
