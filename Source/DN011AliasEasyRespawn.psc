Scriptname DN011AliasEasyRespawn extends ReferenceAlias Hidden

ReferenceAlias Property RespawnMarkerAlias Auto Const 

Int Property TimesToRespawn Auto Const

int RespawnCount

Event OnDeath(Actor akKiller)
	RespawnCount = RespawnCount + 1
	if RespawnCount <= TimesToRespawn
		Utility.Wait(1)
	    self.ForceRefTo((RespawnMarkerAlias.GetReference()).PlaceAtMe(self.GetActorRef().GetActorBase()))
	endif
EndEvent