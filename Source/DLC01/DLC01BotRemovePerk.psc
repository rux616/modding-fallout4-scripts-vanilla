Scriptname DLC01:DLC01BotRemovePerk extends ActiveMagicEffect

Perk Property myPerk Auto
{Perk to remove while mod is installed.}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	(akTarget as Actor).RemovePerk(myPerk)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	(akTarget as Actor).AddPerk(myPerk)
EndEvent