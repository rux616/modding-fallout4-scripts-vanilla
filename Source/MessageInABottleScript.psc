Scriptname MessageInABottleScript extends ObjectReference Hidden

Quest Property DNMessageInABottleQuest Auto
ReferenceAlias Property MyObjectiveAlias Auto
Int Property ObjectiveToDisplay Auto

auto STATE WaitForPickup
	Event OnRead()
	    GoToState("Done")
		MyObjectiveAlias.ForceRefTo(GetLinkedRef())
		(MyObjectiveAlias as DNMessageBottleObjectiveScript).DoStartingStuff(ObjectiveToDisplay)
		Debug.Trace(self +"| I've Been Read!")
	EndEvent
EndSTATE

STATE Done
EndSTATE