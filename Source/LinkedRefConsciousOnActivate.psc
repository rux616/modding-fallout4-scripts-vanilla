Scriptname LinkedRefConsciousOnActivate extends ObjectReference

Group Optional_Properties
	Bool Property PlayerActivatedOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) the Linked Ref will Activate if Activated ONLY by the player.
	If set to FALSE, and all arrays are empty, then the Linked Ref will Activate if Activated by anybody.
	(If you want to trigger based on the Player AND something else then add the toe the ActivatedByReferences array)}

	Bool Property DoOnce = FALSE Auto Const
	{If you only want this to be activated once set to TRUE.  DEFAULT = FALSE}

	Keyword Property LinkedRefKeyword Auto Const
	{The Keyword of the LinkedRef you want to activate when this activated.}

	ObjectReference[] Property ActivatedByReferences Auto Const
	{OPTIONAL: LinkedRef will Activate if Activated by any of these references.
	If ALL arrays are empty then Activate happens if Activated by anybody.}

	ReferenceAlias[] Property ActivatedByAliases Auto Const
	{OPTIONAL: LinkedRef will Activate if Activated by any of these aliases.
	If ALL arrays are empty then Activate happens if Activated by anybody.}

	Faction[] Property ActivatedByFactions Auto Const
	{OPTIONAL: LinkedRef will Activate if Activated by any of these factions.
	If ALL arrays are empty then Activate happens if Activated by anybody.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

Auto State PreActivation
	Event OnActivate(ObjectReference akActionRef)
		if (DefaultScriptFunctions.CheckForMatches(RefToCheck = akActionRef, ReferenceArray = ActivatedByReferences, AliasArray = ActivatedByAliases, FactionArray = ActivatedByFactions, PlayerCheckOverride = PlayerActivatedOnly) == TRUE)
			DefaultScriptFunctions.DefaultScriptTrace(akactionRef + " is setting conscious " + GetLinkedRef(LinkedRefKeyword) + " by way of " + self, ShowTraces)
			Actor robot = Self.GetLinkedRef() as Actor
			robot.SetUnconscious(False)
			robot.EvaluatePackage()
			if DoOnce
				gotoState("PostActivation")
			endif
		endif
	EndEvent
EndState

State PostActivation
	;Do nothing
EndState
