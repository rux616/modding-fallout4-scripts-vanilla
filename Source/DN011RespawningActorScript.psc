Scriptname DN011RespawningActorScript extends ReferenceAlias Hidden

bool bCheckForDead = FALSE

Function StartCheckingForDead()
	if (Self.GetActorReference()).IsDead()
		(GetOwningQuest() as DefaultCounterQuestA).Increment()
	else
		bCheckForDead = TRUE
	endif
EndFunction

Event OnDeath(Actor akKiller)
    if bCheckForDead
    	(GetOwningQuest() as DefaultCounterQuestA).Increment()
    endif
EndEvent