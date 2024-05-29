Scriptname DefaultEnableDisableOnDeathScript extends Actor Const Default
{Default script used for checking if a ref/alias/faction entered this trigger, which will enable/disable this triggers linked ref.}

Group Required_Properties
	Bool Property PlayerTriggerOnly = FALSE Auto Const
	{If set to TRUE the Linked Ref will Enable/Disable if Killed ONLY by the player.
	If set to FALSE (DEFAULT), and all arrays are empty, then the Linked Ref will Enable/Disable if Killed by anybody.
	(If you want to trigger based on the Player AND something else then add the toe the KilledByReferences array)}

	Bool Property bEnableLinkedRef = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this triggers LinkedRef will be enabled.
	If FALSE then it will be disabled.}

	Keyword Property LinkedRefKeyword Auto Const
	{If no keyword, then assumes it's a non-keyword linked ref.  If it has a keyword then that will be the 
	linked ref that gets enabled/disabled.}
EndGroup

Group Optional_Properties
	ObjectReference[] Property KilledByReferences Auto Const
	{OPTIONAL: LinkedRef will Enable/Disable if Killed by any of these references.
	If ALL arrays are empty then Enable/Disable happens if Killed by anybody.}

	ReferenceAlias[] Property KilledByAliases Auto Const
	{OPTIONAL: LinkedRef will Enable/Disable if Killed by any of these aliases.
	If ALL arrays are empty then Enable/Disable happens if Killed by anybody.}

	Faction[] Property KilledByFactions Auto Const
	{OPTIONAL: LinkedRef will Enable/Disable if Killed by any of these factions.
	If ALL arrays are empty then Enable/Disable happens if Killed by anybody.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup


Event OnDeath(Actor akKiller)
    	; If the linked ref is disabled, and we want to enable it, and a matched ref killed us, then Enable my LinkedRef.
    if !LinkedRefKeyword
		if (GetLinkedRef().IsEnabled() == FALSE) && (bEnableLinkedRef == TRUE) && (DefaultScriptFunctions.CheckForMatches(RefToCheck = akKiller, ReferenceArray = KilledByReferences, AliasArray = KilledByAliases, FactionArray = KilledByFactions, PlayerCheckOverride = PlayerTriggerOnly) == TRUE)
			DefaultScriptFunctions.DefaultScriptTrace(self + " Enabling my LinkedRef: " + GetLinkedRef(), ShowTraces)
			GetLinkedRef().EnableNoWait()
		elseif (GetLinkedRef().IsEnabled() == TRUE) && (bEnableLinkedRef == FALSE) && (DefaultScriptFunctions.CheckForMatches(RefToCheck = akKiller, ReferenceArray = KilledByReferences, AliasArray = KilledByAliases, FactionArray = KilledByFactions, PlayerCheckOverride = PlayerTriggerOnly) == TRUE)
			DefaultScriptFunctions.DefaultScriptTrace(self + " Disabling my LinkedRef: " + GetLinkedRef(), ShowTraces)
			GetLinkedRef().DisableNoWait()
		endif
	else
		if (GetLinkedRef(LinkedRefKeyword).IsEnabled() == FALSE) && (bEnableLinkedRef == TRUE) && (DefaultScriptFunctions.CheckForMatches(RefToCheck = akKiller, ReferenceArray = KilledByReferences, AliasArray = KilledByAliases, FactionArray = KilledByFactions, PlayerCheckOverride = PlayerTriggerOnly) == TRUE)
			DefaultScriptFunctions.DefaultScriptTrace(self + " Enabling my LinkedRef: " + GetLinkedRef(LinkedRefKeyword), ShowTraces)
			GetLinkedRef(LinkedRefKeyword).EnableNoWait()
		elseif (GetLinkedRef(LinkedRefKeyword).IsEnabled() == TRUE) && (bEnableLinkedRef == FALSE) && (DefaultScriptFunctions.CheckForMatches(RefToCheck = akKiller, ReferenceArray = KilledByReferences, AliasArray = KilledByAliases, FactionArray = KilledByFactions, PlayerCheckOverride = PlayerTriggerOnly) == TRUE)
			DefaultScriptFunctions.DefaultScriptTrace(self + " Disabling my LinkedRef: " + GetLinkedRef(LinkedRefKeyword), ShowTraces)
			GetLinkedRef(LinkedRefKeyword).DisableNoWait()
		endif
	endif
EndEvent