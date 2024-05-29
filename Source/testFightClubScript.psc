Scriptname testFightClubScript extends ObjectReference

LeveledActor Property listToSpawn Auto Const
ObjectReference[] Property SpawnPoints Auto Const
ObjectReference property ControlButton auto Const
{The thing in the world which the player interacts with.}
int property iSpawns = 3 auto Const
{How many enemies do we want alive at any given time?}
bool property useSpawnPointasPatrol = TRUE auto Const

bool isActive = FALSE
int enemiesAlive = 0

EVENT onInit()
	registerForRemoteEvent(ControlButton, "OnActivate")
endEVENT

EVENT ObjectReference.OnActivate(ObjectReference refActivated, objectReference actronaut)
	if isActive == FALSE
		isActive = TRUE
		SpawnEnemies()
	else
		isActive = FALSE
	endif
	; re-register so we catch future activations of the button
	registerForRemoteEvent(ControlButton, "OnActivate")
endEVENT

EVENT Actor.OnDeath(actor victim, actor killer)
	debug.trace("FIGHTCLUB: RIP, "+victim)
	enemiesAlive -= 1
	if isActive
		SpawnEnemies()
	endif
endEVENT

FUNCTION SpawnEnemies()
	while (enemiesAlive < iSpawns)
		int spawnIndex = utility.randomInt(0,spawnPoints.Length - 1)
		objectReference newRef = spawnPoints[spawnIndex].placeAtme(listToSpawn)
		if useSpawnPointasPatrol == TRUE
			;newRef.setLinkedRef(whatever-point-spawned-me)
		endif
		registerForRemoteEvent(newRef as actor, "onDeath")
		enemiesAlive += 1
		utility.wait(0.1)
	endWhile
endFUNCTION