Scriptname DLC04:DLC04NukaKillTrackerSCRIPT extends activemagiceffect

SPELL PROPERTY KillTrackerSpell AUTO

EVENT OnEffectStart(Actor akTarget, Actor akCaster)
	Game.GetPlayer().addSpell(killTrackerSpell, FALSE)
ENDEVENT

Event OnEffectFinish(Actor akTarget, Actor akCaster) 
	Game.GetPlayer().RemoveSpell(killTrackerSpell)
ENDEVENT