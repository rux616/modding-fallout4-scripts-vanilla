Scriptname Inst307Fight_BeaconAliasRespawn01 extends ReferenceAlias Hidden
{Inst307 Fight - Phase 3. ReferenceAlias script for respawning synths from the Institute Teleport Beacons.}
;
;This is a named variant of defaultAliasRespawnScript with a minor modification: all of its respawns
;use a specified ActorBase instead of copying it from the actor they're respawning. This allows us
;to have the first spawned actor be something different (usually better) than subsequent respawns.

Group Optional_Properties
	bool Property bRespawningOn = true Auto  
	{Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE}
EndGroup

ActorBase Property myActorBase Auto Const
{The ActorBase to use when this alias respawns.}

function RespawnIfDead()
 	;debug.trace(self + " RespawnIfDead")
	if GetActorRef().IsDead()
		Inst307Fight_BeaconQuestRespawn01 myQuest = GetOwningQuest() as Inst307Fight_BeaconQuestRespawn01
		gotoState("respawning")
		myQuest.Respawn(self)
		gotoState("normal")
	else
 		debug.trace(self + "RespawnIfDead: I'm not dead - " + GetActorRef() + ".IsDead()=" + GetActorRef().IsDead())
	endif
endFunction


auto state normal

Event OnDeath(Actor akKiller)
	;Debug.Trace("Respawning " + Self + " OnDeath")
	if bRespawningOn
		Inst307Fight_BeaconQuestRespawn01 myQuest = GetOwningQuest() as Inst307Fight_BeaconQuestRespawn01
		gotoState("respawning")
		myQuest.TryToRespawn(self)
		gotoState("normal")
	endif
endEvent

endState

state respawning

Event OnDeath(Actor akKiller)
endEvent

endState