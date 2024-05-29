Scriptname DLC03:DLC03HermitCrabSpawnChildScript extends Actor
{This script lives on the Hermit Crab spawn and allows them to talk to the Hermit Crab to limit how many of them can be spawned at a time}

DLC03HermitCrabSpawnScript myParent
Keyword Property DLC03_ActorTypeHermitCrab Auto

Event OnLoad()
	Debug.Trace(Self + ": Onload Called")
	FindMyMommy()
EndEvent

Event OnInit()
	Debug.Trace(Self + ": OnInit Called")
EndEvent

;This finds a queen and registers the spawn to it.
Function FindMyMommy()
	DLC03HermitCrabSpawnScript myTempParent
	ObjectReference[] AllNearbyParents
	AllNearbyParents = FindAllReferencesWithKeyword(DLC03_ActorTypeHermitCrab, 5000.0)
	Debug.Trace(Self + ": All Nearby Parents == " + AllNearbyParents)
	;Check the queens to try to find a parent
	int i = 0
	int count = AllNearbyParents.Length
	bool FoundAMommy = false
	Actor ActorSelf = self as Actor
	while i < count && !FoundAMommy
		myTempParent = (AllNearbyParents[i] as DLC03HermitCrabSpawnScript)
		;Ask the queen if she can be our mommy
		;	The function will keep track of us, and passes back true if it can be
		if myTempParent.FindParent(ActorSelf)
			myParent = myTempParent
			FoundAMommy = true
			Debug.Trace(self + " FOUND A PARENT >> " + myParent)
		;Not the momma, try the next one in the list
		else
			i += 1
		endif
	endWhile
	;If we made it all the way through and didn't find a Queen
	;	then do whatever we need to to clean up when we are done
	if !FoundAMommy
		Debug.Trace(self + " could not find a Parent")
	endif
EndFunction


Event OnDeath(Actor AkKiller)
	DeleteWhenAble()
EndEvent

Event OnUnload()
	DeleteWhenAble()
EndEvent