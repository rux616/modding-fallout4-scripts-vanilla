Scriptname DefaultEnableDisableChainTrigScript extends ObjectReference Const Default
{Variant of DefaultEnableDisableTrigScript; enables or disables a chain of objects linked by the same keyword.}

Group Required_Properties
	Bool Property PlayerTriggerOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) the Linked Ref will Enable/Disable if Triggered ONLY by the player.
	If set to FALSE, and all arrays are empty, then the Linked Ref will Enable/Disable if Triggered by anybody.
	(If you want to trigger based on the Player AND something else then add the toe the TriggeredByReferences array)}

	Bool Property bEnableLinkedRef = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this triggers LinkedRef will be enabled.
	If FALSE then it will be disabled.}

	Keyword Property LinkKeyword = None Auto Const
	{Keyword of the linked ref to use.}
EndGroup

Group Optional_Properties
	ObjectReference[] Property TriggeredByReferences Auto Const
	{OPTIONAL: LinkedRef will Enable/Disable if Triggered by any of these references.
	If ALL arrays are empty then Enable/Disable happens if Triggered by anybody.}

	ReferenceAlias[] Property TriggeredByAliases Auto Const
	{OPTIONAL: LinkedRef will Enable/Disable if Triggered by any of these aliases.
	If ALL arrays are empty then Enable/Disable happens if Triggered by anybody.}

	Faction[] Property TriggeredByFactions Auto Const
	{OPTIONAL: LinkedRef will Enable/Disable if Triggered by any of these factions.
	If ALL arrays are empty then Enable/Disable happens if Triggered by anybody.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

Event OnTriggerEnter(ObjectReference akActionRef)
	EnableDisableChain(GetLinkedRef(LinkKeyword), akActionRef)
EndEvent

Function EnableDisableChain(ObjectReference obj, ObjectReference akActionRef)
	; If the linked ref is disabled, and we want to enable it, and a matched ref triggered us, then Enable my LinkedRef.
	if (obj.IsEnabled() == FALSE) && (bEnableLinkedRef == TRUE) && (DefaultScriptFunctions.CheckForMatches(RefToCheck = akActionRef, ReferenceArray = TriggeredByReferences, AliasArray = TriggeredByAliases, FactionArray = TriggeredByFactions, PlayerCheckOverride = PlayerTriggerOnly) == TRUE)
		DefaultScriptFunctions.DefaultScriptTrace(self + " Enabling: " + obj, ShowTraces)
		obj.EnableNoWait()
	elseif (obj.IsEnabled() == TRUE) && (bEnableLinkedRef == FALSE) && (DefaultScriptFunctions.CheckForMatches(RefToCheck = akActionRef, ReferenceArray = TriggeredByReferences, AliasArray = TriggeredByAliases, FactionArray = TriggeredByFactions, PlayerCheckOverride = PlayerTriggerOnly) == TRUE)
		DefaultScriptFunctions.DefaultScriptTrace(self + " Disabling: " + obj, ShowTraces)
		obj.DisableNoWait()
	endif

	ObjectReference next = obj.GetLinkedRef(LinkKeyword)
	if (next != None)
		EnableDisableChain(next, akActionRef)
	EndIf
EndFunction