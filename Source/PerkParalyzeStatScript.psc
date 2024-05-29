Scriptname PerkParalyzeStatScript extends ActiveMagicEffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Game.IncrementStat("Paralyzing Punches")
EndEvent