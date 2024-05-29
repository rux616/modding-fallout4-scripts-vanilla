Scriptname DLC04:DLC04TestSpawner extends ObjectReference

form Property LvlFeralGhoulAmbush Auto Const Mandatory
Keyword Property LinkAmbushFurniture Auto Const Mandatory
ObjectReference Property DLC04_KK_SpawnMarkerRef Auto Const Mandatory

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
	    GoToState("Busy")
	    actor mySpawn = DLC04_KK_SpawnMarkerRef.PlaceAtMe(LvlFeralGhoulAmbush, 1, false, true) as actor
	    mySpawn.SetLinkedREf(GetLinkedRef(LinkAmbushFurniture),LinkAmbushFurniture)
	    mySpawn.SetLinkedREf(GetLinkedRef())
		mySpawn.MoveTo(GetLinkedRef(LinkAmbushFurniture))
	    mySpawn.Enable()
	    utility.wait(1.0)
	    mySpawn.Activate(mySpawn)
	    utility.wait(2.0)
	    GoToState("Waiting")
	EndEvent
EndState


State Busy
EndState