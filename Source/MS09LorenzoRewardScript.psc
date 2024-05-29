Scriptname MS09LorenzoRewardScript extends ReferenceAlias
{clears alias when player uses serum}

Event OnEquipped(Actor akActor)
	; if anyone equips this (uses it), clear the alias so player can get another one
    Clear()
EndEvent
