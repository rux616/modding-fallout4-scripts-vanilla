Scriptname DNFinancial_35CourtTrapScript extends ObjectReference Hidden
{Trap script for 35 Court.}

Keyword property LinkCustom01 Auto Const Mandatory
ActorValue property ProtectronPodStatus Auto Const Mandatory

Event OnActivate(ObjectReference akActivator)
	ObjectReference[] linkChain = Self.GetLinkedRefChain(LinkCustom01)
	Actor player = Game.GetPlayer()
	int i = 0
	;Debug.Trace("In OnActivate " + linkChain.Length)
	While (i < linkChain.Length)
		;Debug.Trace("i=" + i + ", " + linkChain[i])
		Actor a = linkChain[i] as Actor
		if (a != None)
			a.SetValue(ProtectronPodStatus, 1)
			a.Activate(player)
			a.SetUnconscious(False)
			a.EvaluatePackage()
		EndIf
		i = i + 1
	EndWhile
EndEvent