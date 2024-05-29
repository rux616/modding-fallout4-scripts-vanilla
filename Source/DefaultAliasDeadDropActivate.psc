Scriptname DefaultAliasDeadDropActivate extends DefaultAlias Const Default
{Default script used for checking if an alias is activated, and optionally what Activated it.}

Message Property DeadDropMessage Auto Const

Group Optional_Properties
	Bool Property PlayerActivateOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Activated by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Activated by anybody.}

	ObjectReference[] Property ActivatedByReferences Auto Const
	{OPTIONAL: Stage will be set if Activated by any of these references.
	If ALL arrays are empty then stage is set if Activated by anybody.}

	ReferenceAlias[] Property ActivatedByAliases Auto Const
	{OPTIONAL: Stage will be set if Activated by any of these aliases.
	If ALL arrays are empty then stage is set if Activated by anybody.}

	Faction[] Property ActivatedByFactions Auto Const
	{OPTIONAL: Stage will be set if Activated by any of these factions.
	If ALL arrays are empty then stage is set if Activated by anybody.}

	Bool Property BlockWhilePlayerIsInCombat = FALSE Auto Const
	{If TRUE then the stage will only set if the player isn't in combat.}
EndGroup

Event OnActivate(ObjectReference akActionRef)
	if Game.GetPlayer().IsInCombat() && BlockWhilePlayerIsInCombat
		; Don't do a thing
	else
		; Check if we can set the stage.
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		DeadDropMessage.Show()
		TryToSetStage(PlayerCheckOverride = PlayerActivateOnly, RefToCheck = akActionRef, ReferenceArray = ActivatedByReferences, AliasArray = ActivatedByAliases, FactionArray = ActivatedByFactions)
	endif	
EndEvent
