Scriptname DLC03:DLC03VRNoBuildScript extends ObjectReference

Sound Property DLC03QSTVRBlockDissolve Auto Const Mandatory

Event OnLoad()
	ObjectReference myLinkedRef = GetLinkedRef()
	if myLinkedRef
		RegisterForRemoteEvent(myLinkedRef, "OnActivate")
	endif
EndEvent

Event OnUnload()
	CancelTimer()
endEvent 

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	StartTimer(Utility.RandomFloat(0, 2))
EndEvent

Event OnTimer(int aiTimerID)
	;int instanceID = DLC03QSTVRBlockDissolve.play(self)
	;Sound.SetInstanceVolume(instanceID, 1)
	if Is3DLoaded()
		PlayAnimationAndWait("Play01","Done")
	endif
	DisableNoWait()
EndEvent
