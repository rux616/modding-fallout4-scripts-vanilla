Scriptname BoS304KickTriggerScript extends ObjectReference Const

ReferenceAlias Property Alias_PaladinDanse Auto Const
Faction Property CurrentCompanionFaction Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if Alias_PaladinDanse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 1
			debug.trace("BoS304KICK - Paladin Danse can't go into Institute at the end!!!!")
			Alias_PaladinDanse.GetActorRef().DisallowCompanion()
		endif
	endif

endEvent

Event OnTriggerLeave(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if Alias_PaladinDanse.GetActorRef().IsInFaction(CurrentCompanionFaction) == 0
			debug.trace("BoS304KICK - Paladin Danse can be the Player's Companion again!!!!")
			Alias_PaladinDanse.GetActorRef().AllowCompanion(MakeCompanionIfNoneCurrently = false)
		endif
	endif

endEvent