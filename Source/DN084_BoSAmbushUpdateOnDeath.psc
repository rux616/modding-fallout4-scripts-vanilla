Scriptname DN084_BoSAmbushUpdateOnDeath extends RefCollectionAlias Hidden Const
{When an actor in the BoS303 Descent Ambush ref collection dies, notify the quest so it can teleport in the next synth.}

Quest property DN084 Auto Const Mandatory
{DN084}

Event OnDying(ObjectReference source, Actor akKiller)
	(DN084 as DN084_QuestScript).UpdateBoSTeleportAmbush()
EndEvent