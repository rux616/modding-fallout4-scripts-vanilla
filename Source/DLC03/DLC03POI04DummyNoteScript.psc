Scriptname DLC03:DLC03POI04DummyNoteScript extends ObjectReference Hidden

DLC03POI04QuestScript Property DLC03POI04Quest Auto Const

ObjectReference MyBookRef

auto STATE WaitingForPickup
	Event OnLoad()
		RegisterForCustomEvent(DLC03POI04Quest, "DeleteDummyNotes")
	    RegisterForDistanceLessThanEvent(Game.GetPlayer(), self, 512)
	    Debug.Trace(self + "|OnLoad() Registering for Distance Less Than 512")
	EndEvent

	Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	    Debug.Trace(self + "|OnDistanceLessThan() Swapping myself for " + DLC03POI04Quest.JournalsToPlace[0] + " and Registering for Distance Greater Than 1024")
	    DisableNoWait()
	    MyBookRef = PlaceAtMe(DLC03POI04Quest.JournalsToPlace[0])
	    RegisterForDistanceGreaterThanEvent(Game.GetPlayer(), self, 1024)
	    RegisterForRemoteEvent(MyBookRef, "OnRead")
	EndEvent

	Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
		RegisterForDistanceLessThanEvent(Game.GetPlayer(), self, 512)
	    Debug.Trace(self + "|OnDistanceGreaterThan() Deleting " + MyBookRef + " and Registering for Distance Less Than 512")
	    EnableNoWait()
	    MyBookRef.DisableNoWait()
	    MyBookRef.Delete()
	    MyBookRef = NONE
	EndEvent

	Event ObjectReference.OnRead(ObjectReference akSender)
	    Debug.Trace(self + "|Remote.OnRead() The Player has read " + akSender + ". Switching STATE to 'BeenPickedUp'")
	    GoToState("BeenPickedUp")
	    DLC03POI04Quest.JournalsToPlace.Remove(0)
	    MyBookRef = NONE
	    if DLC03POI04Quest.JournalsToPlace.Length == 0
	    	Debug.Trace(self + "|Remote.OnRead() This was the last note, telling the quest to delete all notes.")
	    	DLC03POI04Quest.DeleteAllNotes()
	    endif
	    Delete()
	EndEvent

	Event OnUnload()
	    Debug.Trace(self + "|OnUnload() Unregistering For all Events.")
	    UnregisterForAllEvents()
	EndEvent
EndSTATE

STATE BeenPickedUp
	; Do Nothing

	Event ObjectReference.OnRead(ObjectReference akSender)
		; Because I have to	    
	EndEvent
EndSTATE

Event ObjectReference.OnRead(ObjectReference akSender)
	; Because I have to	    
EndEvent