Scriptname DLC03:DLC03HighConfessorAliasScript extends ReferenceAlias

Location Property DLC03NucleusMemoryBanksLocation Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

Event OnDeath(Actor akKiller)
	;If the correct stage has been set, proceed with quest. Otherwise, fail quest.
	if DLC03MQ06a.GetStageDone(70)
		DLC03MQ06a.SetStage(100)
	else
		DLC03MQ06a.SetStage(750)
	endif
EndEvent