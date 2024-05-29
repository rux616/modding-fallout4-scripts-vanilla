Scriptname DNMessageBottleObjectiveScript extends ReferenceAlias Hidden

Int Property ObjectiveToDisplay Auto
Float Property DistanceToRegisterForObjectiveCompletion = 256.0 Auto
Float Property DistanceToRegisterForObjectiveTimerToStart Auto

Int Property ObjectiveHelpTimer = 10 Auto

Function DoStartingStuff(Int PassedObjectiveToDisplay)
	ObjectiveToDisplay = PassedObjectiveToDisplay
	Debug.Trace(self +"| I've Inititalized!")
	GetReference().GetLinkedRef().EnableNoWait()
	GetOwningQuest().SetObjectiveDisplayed(ObjectiveToDisplay)
	DistanceToRegisterForObjectiveTimerToStart = GetReference().GetDistance(GetReference().GetLinkedRef())
	RegisterForDistanceLessThanEvent(GetReference(), Game.GetPlayer(), DistanceToRegisterForObjectiveTimerToStart)
	;RegisterForDistanceLessThanEvent(GetReference().GetLinkedRef(), Game.GetPlayer(), DistanceToRegisterForObjectiveCompletion)
	RegisterForRemoteEvent(GetReference().GetLinkedRef(), "OnActivate")
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		Debug.Trace(self +"| Player activated me, complete the objective!")
		CancelTimer(ObjectiveHelpTimer)
		GetOwningQuest().SetObjectiveCompleted(ObjectiveToDisplay)
		Clear()
	endif
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	if akObj1 == GetReference() && akObj2 == Game.GetPlayer()
		StartTimer(90, ObjectiveHelpTimer)
		Debug.Trace(self +"| Player is close to me, start helper timer.")
	endif
	;if akObj1 == GetReference().GetLinkedRef() && akObj2 == Game.GetPlayer()
	;	Debug.Trace(self +"| Player is close to me, complete the objective!")
	;	GetOwningQuest().SetObjectiveCompleted(ObjectiveToDisplay)
	;	Clear()
	;endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == ObjectiveHelpTimer
    	GetReference().MoveTo(GetReference().GetLinkedRef())
    endif
EndEvent