Scriptname PerkMagBaseScript extends ObjectReference

Perk Property PerkAdded Auto Const
Bool ReadOnce

Event OnActivate(ObjectReference akActor)
	if ReadOnce == false
		Game.GetPlayer().Addperk(PerkAdded)
		ReadOnce = true
	endif
EndEvent
