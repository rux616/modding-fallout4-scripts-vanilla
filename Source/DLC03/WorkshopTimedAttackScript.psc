Scriptname DLC03:WorkshopTimedAttackScript extends WorkshopAttackScript
{script to augment WorkshopAttackScript with additional attackers spawned on a timer}

float property fNewAttackerTimer = 0.10 auto const
int property iNewAttackerTimerID = 1 auto const

int property AttackerDeadCountGroupIndex = 0 auto const
{ index of attackers in DeadCountGroups array on REScript on this quest }

int property iMaxSpawns = 10 auto
{ total times to spawn new attackers }

int property iSpawnCount = 0 auto
{ running total of how many spawns }

int property iMaxAttackers = 5 auto const
{ don't spawn new attackers until current count is less than this }

ReferenceAlias property AttackMarker01 auto const mandatory
{ primary attack marker - extras are already stored on WorkshopAttackScript }

struct SpawnAttacker
	ActorBase actorToSpawn
	int maxToSpawn = 1
endStruct

SpawnAttacker[] property AttackersToSpawn auto const mandatory
{ array of actors to pick from when spawning attackers }

DLC03:WorkshopRadiantOwnedScript myRadiantQuest

ObjectReference[] attackMarkers

event OnQuestInit()
	myRadiantQuest = (self as Quest) as DLC03:WorkshopRadiantOwnedScript

	; initialize attack marker array
	attackMarkers = new ObjectReference[0]
	attackMarkers.Add(AttackMarker01.GetRef())
	; add extras, if any
    int i = 0
    while i < ExtraAttackMarkers.Length
        ObjectReference markerRef = ExtraAttackMarkers[i].GetRef()
        if markerRef
            attackMarkers.Add(markerRef)
        endif
        i += 1
    endWhile
endEvent

function StartSpawning(bool bStartSpawning = true)
	debug.trace(self + " StartSpawning " + bStartSpawning)
	if bStartSpawning
		SpawnAttackers()
	else
		CancelTimerGameTime(iNewAttackerTimerID)
	endif
endFunction

Event OnTimerGameTime(int aiTimerID)
    debug.trace(self + "OnTimerGameTime aiTimerID=" + aiTimerID)
    if aiTimerID == iNewAttackerTimerID
    	SpawnAttackers()
    endif
    Parent.OnTimerGameTime(aiTimerID)
EndEvent

function SpawnAttackers()
	debug.trace(self + " SpawnAttackers: start")
	; how many attackers still alive?
	int aliveCount = 0
	int i = 0
    while i < Attackers.GetCount()
        Actor attacker = Attackers.GetAt(i) as Actor
        if attacker && attacker.IsDead() == false
        	aliveCount += 1
        endif
        i += 1
    endWhile

	debug.trace(self + "  aliveCount=" + aliveCount + " vs. iMaxAttackers=" + iMaxAttackers)

    ; if below max, spawn
    if aliveCount < iMaxAttackers
    	iSpawnCount += 1

    	Actor player = Game.GetPlayer()

    	; pick a marker to spawn at - out of sight of player if possible
    	ObjectReference spawnMarker
    	i = 0
    	while i < attackMarkers.Length && spawnMarker == NONE
    		ObjectReference theMarker = attackMarkers[i]
    		if player.HasDetectionLOS(theMarker) == false
    			spawnMarker = theMarker
    		endif
    	endWhile

    	; failsafe - use primary marker
    	if spawnMarker == NONE
    		spawnMarker = AttackMarker01.GetRef()
    	endif

    	; spawn attackers at the marker
    	int randomRoll = utility.RandomInt(0, AttackersToSpawn.Length-1)
    	SpawnAttacker spawnData = AttackersToSpawn[randomRoll]
    	int numToSpawn = utility.RandomInt(1, spawnData.maxToSpawn)

    	debug.trace(self + "  spawning " + numToSpawn + " new " + spawnData + " at marker " + spawnMarker)
    	
    	i = 0
    	while i < numToSpawn
			Actor spawnedActor = spawnMarker.PlaceActorAtMe(spawnData.actorToSpawn, 4, WorkshopAlias.GetRef().GetEncounterZone()) as Actor
			; add to ref collection
			Attackers.AddRef(spawnedActor)
    		i += 1
    	endWhile
    	; update attacker count on REScript
    	myRadiantQuest.UpdateDeadCountGroupSize(AttackerDeadCountGroupIndex, Attackers.GetCount())
    endif

    ; if still more to spawn, restart timer
    if iSpawnCount < iMaxSpawns
    	debug.trace(self + "   iSpawnCount=" + iSpawnCount + ", run timer again")
		StartTimerGameTime(fNewAttackerTimer, iNewAttackerTimerID)
    endif	
endFunction