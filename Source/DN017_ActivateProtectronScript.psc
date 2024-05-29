Scriptname DN017_ActivateProtectronScript extends ObjectReference Hidden
{Script on a DefaultDummy that activates the pre-quest protectron boss when the player trips a tripwire.}

ActorValue property ProtectronPodStatus Auto Const Mandatory
{ProtectronPodStatus AV}

Auto State Ready
	Event OnActivate(ObjectReference akActivator)
		GoToState("Done")
		Actor protectron = Self.GetLinkedRef() as Actor
		protectron.SetValue(ProtectronPodStatus, 1)
		protectron.SetUnconscious(FALSE)
		protectron.EvaluatePackage()
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState