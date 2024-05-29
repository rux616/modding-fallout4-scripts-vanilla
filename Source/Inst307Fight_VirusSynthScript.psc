Scriptname Inst307Fight_VirusSynthScript extends ReferenceAlias Const Hidden
{Inst307 Fight - Phase 3. Script for the Virus Synth. Reports its OnDying events to the quest script, allowing a new Virus Synth to spawn.}

Inst307FightQuestScript property Inst307Fight Auto Const Mandatory
{Inst307Fight}

Event OnDying(Actor akKiller)
	Inst307Fight.VirusSynthKilled()
EndEvent