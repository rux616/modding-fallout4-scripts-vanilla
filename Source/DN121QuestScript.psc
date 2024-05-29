Scriptname DN121QuestScript extends Quest 

int property RewardHaggle = 0 auto hidden

ReferenceAlias Property Jake Auto const
ReferenceAlias Property FreewayMarker Auto Const

ObjectReference JakeRef

Keyword Property AnimFlavorHandsup Auto Const

Function ReadyToTeleportJake()
	Debug.Trace(Self + ": ReadyToTeleportJake")
	if !Jake.GetActorRef().IsDead()
		JakeRef = Jake.GetReference()
		Debug.Trace(Self + ": Registering for OnUnload on " + JakeRef)
		RegisterForRemoteEvent(Jake, "OnUnload")
	endif
EndFunction


Event ObjectReference.OnUnload(ObjectReference akSender)
	Debug.Trace(Self + ": Has received OnUnload from " + akSender)
	if akSender == JakeRef && !Jake.GetActorRef().IsDead()
		Debug.Trace(Self + ": Has received OnUnload from " + akSender)
		JakeRef.Moveto(FreewayMarker.GetReference())
		UnRegisterForRemoteEvent(Jake, "OnUnload")
	endif
EndEvent

Function JakeKilledForgetTheTeleport()
	;Just forget the whole thing okay??
	UnRegisterForRemoteEvent(Jake, "OnUnload")
EndFunction


Function JakeStartHandsUp()
	Jake.GetActorRef().changeAnimFlavor(AnimFlavorHandsup)
EndFunction

Function JakeStopHandsUp()
	Jake.GetActorRef().changeAnimFlavor()
EndFunction