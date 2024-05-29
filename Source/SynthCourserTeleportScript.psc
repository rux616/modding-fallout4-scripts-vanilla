Scriptname SynthCourserTeleportScript extends Actor

import utility

Int property maxTeleportActors = 3 auto
Float property chanceToTeleport = 0.75 auto
Form property LvlSynthTeleport auto
GlobalVariable property LL_ChanceNone_SynthCourserTeleport auto

Event OnDeath(Actor akKiller)
	float chanceRoll = Utility.RandomFloat(0, 1)

	; Check against the chance success and the global set by whether the player knows about teleport or not
	if (chanceToTeleport >= chanceRoll && LL_ChanceNone_SynthCourserTeleport.GetValue() == 0.0)
		debug.trace(self + "SpawnTeleportActors")
		int i = 0
		while (i < maxTeleportActors)
			i += 1
			SpawnTeleportActor()
			wait(1.0)
		endwhile
	endif
EndEvent

Function SpawnTeleportActor()
	ObjectReference myActor
	objectReference objSelf = self as objectReference
	objSelf.placeAtMe(LvlSynthTeleport)
EndFunction
