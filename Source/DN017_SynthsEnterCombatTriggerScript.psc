Scriptname DN017_SynthsEnterCombatTriggerScript extends ObjectReference Const
{Script for a trigger used during the DN017 Synth Assault battle.}
;
;During this fight, the synths have an Ignore Combat Travel package that forces them to run into the combat,
;dropping down from high ledges where they would otherwise prefer to fight. When they hit this trigger, the
;EVP snaps them out of the package and allows them to enter combat normally.

Faction property SynthFaction Auto Const Mandatory
{The Synth faction.}

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor akActionActor = akActionRef as Actor
	if ((akActionActor != None) && (akActionActor.IsInFaction(SynthFaction)))
		akActionActor.EvaluatePackage()
	EndIf
EndEvent