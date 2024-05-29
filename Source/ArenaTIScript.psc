Scriptname ArenaTIScript extends TopicInfo const

group FunctionsAndParams

bool Property PlaceWager const auto
{Call PlaceWager(Combatant)}

int Property Combatant const auto
{1 = Left combatant, 2 = Right combatant}

bool Property CollectEarnings const auto
{Call CollectEarnings()}

bool Property CollectPrize const auto
{Call CollectPrize}

endGroup

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	ArenaScript Arena = GetOwningQuest() as ArenaScript

	if PlaceWager
		Arena.PlaceWager(Combatant)
	endif	

	if CollectEarnings
		Arena.CollectEarnings()
	endif	

	if CollectPrize
		Arena.CollectPrize()
	endif	

EndEvent

Function PlaceWager()
	ArenaScript Arena = GetOwningQuest() as ArenaScript

	Arena.PlaceWager(Combatant)
EndFunction

Function CollectEarnings()
	ArenaScript Arena = GetOwningQuest() as ArenaScript
	
	Arena.CollectEarnings()
EndFunction

