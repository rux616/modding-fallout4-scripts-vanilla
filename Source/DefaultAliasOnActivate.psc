Scriptname DefaultAliasOnActivate extends DefaultAlias Const Default
{Default script used for checking if an alias is activated, and optionally what Activated it.}

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

	Message Property PowerArmorNoActivate Auto Const
	{Message to play if the player cannot activate due to being in Power Armor.}

	Message Property CombatNoActivate Auto Const
	{Message to play if the player cannot activate due to being in Combat.}

	Bool Property BlockWhilePlayerIsInPowerArmor = FALSE Auto Const
	{If TRUE then the stage will only set if the player isn't in Power Armor.}

	Bool Property BlockWhilePlayerIsSitting = FALSE Auto Const
	{If TRUE then the stage will only set if the player isn't sitting in furniture.}
EndGroup

Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	Bool ReadyToTrySetStage = False

	If akActionRef == PlayerREF
		if (BlockWhilePlayerIsInCombat) && (PlayerREF.IsInCombat())
			CombatNoActivate.Show()
		ElseIf (BlockWhilePlayerIsInPowerArmor) && (PlayerREF.IsInPowerArmor())
			PowerArmorNoActivate.Show()
		ElseIf (BlockWhilePlayerIsSitting) && (PlayerREF.GetSitState() != 0)
			; Don't do a thing
		else
			ReadyToTrySetStage = True
		EndIf
	Else
		ReadyToTrySetStage = True
	EndIf

	If ReadyToTrySetStage == True
		; Check if we can set the stage.
		debug.Trace(self + ": OnActivate() Called on DefaultAliasOnActivate script.")
		TryToSetStage(PlayerCheckOverride = PlayerActivateOnly, RefToCheck = akActionRef, ReferenceArray = ActivatedByReferences, AliasArray = ActivatedByAliases, FactionArray = ActivatedByFactions)
	endif	
EndEvent
