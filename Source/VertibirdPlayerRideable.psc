Scriptname VertibirdPlayerRideable extends ReferenceAlias

{This script is intended to block activation after initial interaction
so that quests requiring vertibird riding won't result 
in a player dismounting too early and the VB flying away.}

bool Property BlockOnActivateAndWait Auto
{Flag this if you want to control when activation is re-enabled after activating a vertibird}

Event OnAliasInit()
	debug.trace(Self + " added as a rideable vertibird alias")
	VertibirdTurretScript vertibird = GetActorRef() as VertibirdTurretScript
	if (vertibird)
		vertibird.BlockPlayerActivation(false, BlockOnActivateAndWait)
	endif
EndEvent