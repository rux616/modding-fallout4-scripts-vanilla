Scriptname CA_PickLockScript extends Quest

Event OnStoryPickLock(ObjectReference akActor, ObjectReference akLock)
	debug.trace(self + "akLock: " + akLock)
	debug.trace(self + "akLock.GetActorOwner: " + akLock.GetActorOwner())
	debug.trace(self + "akLock.GetActorRefOwner: " + akLock.GetActorRefOwner()) 
	debug.trace(self + "akLock.GetFactionOwner: " + akLock.GetFactionOwner())
	
EndEvent
