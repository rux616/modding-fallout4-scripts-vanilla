Scriptname BoS100AliasRespawnScript extends ReferenceAlias
{A variant of DefaultAliasRespawnScript, with BoS100FightMonitor as the combat control script. Otherwise identical to the default script.}

Group Optional_Properties
	bool Property bRespawningOn = true Auto  
	{Set to false to stop this alias from auto-respawning when it dies. Defaults to TRUE}
EndGroup

bool diedWhileInRespawnState = False	;Set if the actor dies while in the process of respawning. Forces another respawn.

function RespawnIfDead()
	;Debug.Trace(self + " RespawnIfDead")
	if GetActorRef().IsDead()
		gotoState("respawning")
		(GetOwningQuest() as BoS100FightMonitor).Respawn(self)
		gotoState("normal")
	else
	;Debug.Trace(self + "RespawnIfDead: I'm not dead - " + GetActorRef() + ".IsDead()=" + GetActorRef().IsDead())
	endif
endFunction


auto state normal
	Event OnDeath(Actor akKiller)
		if bRespawningOn
			diedWhileInRespawnState = False
			gotoState("respawning")
			(GetOwningQuest() as BoS100FightMonitor).TryToRespawn(self)
			gotoState("normal")
			if (diedWhileInRespawnState)
				Debug.Trace("Recursively respawning " + Self)
				OnDeath(akKiller)
			EndIf
		endif
	endEvent
endState

state respawning
	Event OnDeath(Actor akKiller)
		Debug.Trace(Self + " died while in Respawn state.")
		diedWhileInRespawnState = True
	endEvent
endState