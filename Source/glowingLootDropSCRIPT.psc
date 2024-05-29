Scriptname glowingLootDropSCRIPT extends ActiveMagicEffect

LeveledItem PROPERTY list AUTO

ACTOR caster

EVENT OnEffectStart(Actor akTarget, Actor akCaster)

	caster = akCaster

ENDEVENT

EVENT onDying(ACTOR akKiller)

	caster.additem(list)
	debug.trace("farts")

ENDEVENT