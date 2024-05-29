ScriptName DN049_MultiCounterAliasIncOnceOnDeath extends DefaultCounterQuestIncOnDeath Hidden
{Increments a counter on the quest with the specified ID.}
;
;This is a variation on the usual DefaultCounterAlias/DefaultCounterQuest setup, since DN049 would otherwise need 7-8 scripts for
;different enemy subgroups, which is awkward and difficult to manage. (This script is the single-Alias version.)

Group MultiCounterProperties
	int property myCounter Auto Const Mandatory
	{ID of the counter to increment.}
EndGroup

Function Increment()
	(GetOwningQuest() as DN049_MultiCounterQuest).Increment(myCounter)
EndFunction