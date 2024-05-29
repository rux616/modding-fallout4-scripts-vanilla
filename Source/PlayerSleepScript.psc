Scriptname PlayerSleepScript extends Quest Const

Spell Property WellRested Auto Const
Keyword Property WorkshopItemKeyword Auto Const
ActorValue Property WorkshopPlayerOwned Auto Const


Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
	Actor myPlayer = Game.GetPlayer()
	debug.trace(self)
	debug.trace(akbed)
	debug.trace(akbed.GetActorRefOwner())
	debug.trace(akBed.GetFactionOwner())
	debug.trace(akBed.GetActorOwner())
	debug.trace(akBed.IsOwnedBy(myPlayer))
	debug.trace(akBed.GetLinkedRef(WorkshopItemKeyword).GetValue(WorkshopPlayerOwned))

	;if the player owns the bed or owns the workshop connected to the bed, give them the Well Rested Perk
	If (akBed.IsOwnedBy(myPlayer)) || (akBed.GetLinkedRef(WorkshopItemKeyword).GetValue(WorkshopPlayerOwned) >= 1)
		WellRested.Cast(myPlayer, myPlayer)
	EndIf
EndEvent