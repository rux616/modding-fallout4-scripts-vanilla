Scriptname DLC01:DLC01Lair_ClearAliasOnDeath extends ReferenceAlias Const
{Script for some Optional robot aliases in DLC01Lair. When the actor dies, clear the alias so the actor's corpse can be cleaned up normally.}

Event OnDeath(Actor akKiller)
	Self.Clear()
EndEvent