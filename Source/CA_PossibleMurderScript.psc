Scriptname CA_PossibleMurderScript extends Quest Const

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
	bool GameConsidersMurder = aiCrimeStatus >= 1

	debug.trace(self + "OnStoryKillActor() calling SendPossibleMurderEvent() akVictim:" + akVictim + ", akKiller:" + akKiller + ", GameConsidersMurder:" + GameConsidersMurder)

	FollowersScript.SendPossibleMurderEvent(akVictim as Actor, akKiller as Actor, GameConsidersMurder)

EndEvent