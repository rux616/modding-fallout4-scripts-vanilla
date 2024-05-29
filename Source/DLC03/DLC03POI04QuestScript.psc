Scriptname DLC03:DLC03POI04QuestScript extends Quest Hidden

Book[] Property JournalsToPlace Auto

CustomEvent DeleteDummyNotes

Function DeleteAllNotes()
	Debug.Trace(self + "|DeleteAllNotes() Sending 'DeleteDummyNotes' event.")
	SendCustomEvent("DeleteDummyNotes")
EndFunction

Function DoThing()
	int count = 0
	While (count < JournalsToPlace.Length)
		Game.GetPlayer().AddItem(JournalsToPlace[count])
		count += 1
	EndWhile
EndFunction