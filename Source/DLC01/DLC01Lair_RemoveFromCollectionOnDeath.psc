Scriptname DLC01:DLC01Lair_RemoveFromCollectionOnDeath extends RefCollectionAlias Const
{Script for the 'All Robots' ref collection in DLC01Lair. When an actor in the collection dies, remove it from the collection so it can be cleaned up via normal corpse cleanup.}

Event OnDeath(ObjectReference akSource, Actor akKiller)
	Self.RemoveRef(akSource)
EndEvent