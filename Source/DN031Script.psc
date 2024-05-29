Scriptname DN031Script extends Quest
{resets respawning guards when location loads}

int property respawnCountMax = 0 auto hidden

RefCollectionAlias property ExteriorGuards auto const mandatory

LocationAlias property ParsonsLocation auto const mandatory

event OnQuestInit()
	; register for location loaded event from Parsons
	RegisterForRemoteEvent(ParsonsLocation.GetLocation(), "OnLocationLoaded")
endEvent

Event Location.OnLocationLoaded(Location akSender)
	debug.trace(self + " OnLocationLoaded " + akSender)
	if akSender == ParsonsLocation.GetLocation() && GetStageDone(500) == false
		; reset respawn state
		defaultQuestRespawnScript respawnQuest = (self as Quest) as defaultQuestRespawnScript
		if respawnQuest
			if respawnCountMax < respawnQuest.respawnCount
				respawnCountMax = respawnQuest.respawnCount
			endif
			; reset respawn count
			respawnQuest.respawnCount = 0
			; respawn all guards
			ExteriorGuards.ResetAll()
		endif
	endif
endEvent