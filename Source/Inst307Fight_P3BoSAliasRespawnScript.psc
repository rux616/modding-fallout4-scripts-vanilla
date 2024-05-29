Scriptname Inst307Fight_P3BoSAliasRespawnScript extends ReferenceAlias Hidden
{Inst307 Fight - Phase 3. ReferenceAlias script for respawning Phase 3 BoS enemies.}
;
;This is a named variant of defaultAliasRespawnScript with the following changes:
; - All of its respawns use a specified ActorBase instead of copying that from the actor they're respawning.
;   This allows us to have the initial actor be something different (usually better) than the respawns.
; - It adds an ActivateEnemy function that effectively 'resets' the actor in the alias to a respawn point.
;   this is used when one of the BoS unique actors is forced into the alias.

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
		Inst307Fight_P3BoSQuestRespawnScript myQuest = GetOwningQuest() as Inst307Fight_P3BoSQuestRespawnScript
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
		Inst307Fight_P3BoSQuestRespawnScript myQuest = GetOwningQuest() as Inst307Fight_P3BoSQuestRespawnScript
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


Function ActivateEnemy()
	Actor a = Self.GetActorRef()
	if (a != None)
		a.Disable()
		ObjectReference respawnMarker = (GetOwningQuest() as Inst307Fight_P3BoSQuestRespawnScript).GetRespawnMarker()
		Debug.Trace("Spawning " + Self + " at respawn marker " + respawnMarker)
		a.MoveTo(respawnMarker)
		a.Enable()
		a.EvaluatePackage()
		;Debug.Trace("Inst307FightP3BoSAliasResapwan ENABLED: " + a)
	EndIf
EndFunction