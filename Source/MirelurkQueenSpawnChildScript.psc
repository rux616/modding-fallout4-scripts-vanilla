ScriptName MirelurkQueenSpawnChildScript Extends Actor
{This script lives on the mirelurk spawn created by the queen and allows them to talk to the queen to limit how many of them can be spawned at a time}

MirelurkQueenSpawnScript myQueen
Keyword Property ActorTypeMirelurkQueen Auto

Event OnLoad()
	Debug.Trace(Self + ": Onload Called")
	FindMyMommy()

EndEvent

Event OnInit()
	Debug.Trace(Self + ": OnInit Called")
EndEvent

;This finds a queen and registers the spawn to it.
Function FindMyMommy()
	ObjectReference[] AllNearbyQueens
	AllNearbyQueens = FindAllReferencesWithKeyword(ActorTypeMirelurkQueen, 5000.0)
	Debug.Trace(Self + ": All Nearby Queens == " + AllNearbyQueens)
	;Check the queens to try to find a parent
	int i = 0
	int count = AllNearbyQueens.Length
	bool FoundAMommy = false
	Actor ActorSelf = self as Actor
	while i < count && !FoundAMommy
		;Ask the queen if she can be our mommy
		;	The function will keep track of us, and passes back true if it can be
		if ((AllNearbyQueens[i] as Actor) as MirelurkQueenSpawnScript).AreYouMyMommy(ActorSelf)
			FoundAMommy = true
			myQueen = ((AllNearbyQueens[i] as Actor) as MirelurkQueenSpawnScript)
			Debug.Trace(self + " FOUND A QUEEN >> " + myQueen)
		;Not the momma, try the next one in the list
		else
			i += 1
		endif
	endWhile
	;If we made it all the way through and didn't find a Queen
	;	then do whatever we need to to clean up when we are done
	if !FoundAMommy
		Debug.Trace(self + " could not find a Mirelurk Queen")
	endif
EndFunction


Event OnDeath(Actor AkKiller)
	DeleteWhenAble()
EndEvent

Event OnUnload()
	DeleteWhenAble()
EndEvent