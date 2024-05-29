Scriptname DisableEnableLinkOnActivateOnce extends ObjectReference
{Enables or disables this object's linked ref on activation.}

Group Optional_Properties
	Keyword Property LinkKeyword Auto Const
	{If set, enable or disable the link with this keyword. Defaults to NONE.}

	Bool Property ShouldEnable = TRUE Auto Const
	{Default=TRUE. Should we disable or enable the linked ref?}

	Bool Property PlayerActivateOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Activated by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Activated by anybody.}

	ObjectReference[] Property ActivatedByReferences Auto Const
	{Stage will be set if Activated by any of these references.
	If ALL arrays are empty then stage is set if Activated by anybody.}

	ReferenceAlias[] Property ActivatedByAliases Auto Const
	{Stage will be set if Activated by any of these aliases.
	If ALL arrays are empty then stage is set if Activated by anybody.}

	Faction[] Property ActivatedByFactions Auto Const
	{Stage will be set if Activated by any of these factions.
	If ALL arrays are empty then stage is set if Activated by anybody.}
EndGroup

Auto State Waiting
Event OnActivate(ObjectReference akActionRef)
	if (DefaultScriptFunctions.CheckForMatches(RefToCheck = akActionRef, ReferenceArray = ActivatedByReferences, AliasArray = ActivatedByAliases, FactionArray = ActivatedByFactions, PlayerCheckOverride = PlayerActivateOnly))
		if (ShouldEnable)
			Self.GetLinkedRef(LinkKeyword).Enable()
		Else
			Self.GetLinkedRef(LinkKeyword).Disable()
		EndIf
		gotoState("Done")
	EndIf
EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActionRef)
		;Do Nothing
	endEvent
EndState