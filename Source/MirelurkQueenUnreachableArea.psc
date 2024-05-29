ScriptName MirelurkQueenUnreachableArea Extends ObjectReference
{This goes on a trigger to place in exterior areas that a mirelurk queen cannot reach to tell her to spawn babies}

Keyword Property ActorTypeMirelurkQueen Auto Const
Float Property FindRadius = 6000.0 Auto Const

MirelurkQueenSpawnScript[] NearbyQueens
bool hasTriggeredRecently
float TriggerTimer = 15.0
int RecentlyFiredTimerID = 100

Event OnLoad()
	ObjectReference[] localQueens = FindAllReferencesWithKeyword(ActorTypeMirelurkQueen, FindRadius)
	int count = localQueens.length
	int i = 0
	Actor CurrentQueen
	NearbyQueens = new MirelurkQueenSpawnScript[0]
	while i < count
		CurrentQueen = localQueens[i] as actor
		if !CurrentQueen.isDead()
			Debug.Trace(self + ": Adding Queen >> " + CurrentQueen)
			NearbyQueens.Add(localQueens[i] as MirelurkQueenSpawnScript) 
			RegisterForRemoteEvent(CurrentQueen, "OnDeath")
		endif
		i += 1
	endWhile
EndEvent

Event OnUnload()
	UnregisterForAllRemoteEvents()
	NearbyQueens = none
	hasTriggeredRecently = false
	CancelTimer(RecentlyFiredTimerID)
EndEvent


Event OnTriggerEnter(ObjectReference TriggerRef)
	Debug.Trace(self + ": OnTriggerEnter by >> " + TriggerRef)
	if !hasTriggeredRecently
		StartTimer(TriggerTimer, RecentlyFiredTimerID)
		hasTriggeredRecently = True
		SendFireSpawnEvents()
	endif
EndEvent


Function SendFireSpawnEvents()
	Debug.Trace(self + ": SendFireSpawnEvents")
	int count = NearbyQueens.length
	int i = 0
	while i < count
		NearbyQueens[i].SpawnBabiesDueToUnreachablePlayer()
		i += 1
	endWhile
EndFunction


Event OnTimer(int aiTimerID)
	if aiTimerID == RecentlyFiredTimerID
		hasTriggeredRecently = false
	endif
EndEvent


Event Actor.OnDeath(Actor akSender, Actor akKiller)
	UnRegisterForRemoteEvent(akSender, "OnDeath")
EndEvent