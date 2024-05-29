Scriptname RECampCC01_RaiderAliasScript extends ReferenceAlias

Spell property RECampCC01_FearSpell auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	GetActorRef().AddSpell(RECampCC01_FearSpell, self)
EndEvent