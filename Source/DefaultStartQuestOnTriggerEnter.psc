Scriptname DefaultStartQuestOnTriggerEnter extends ObjectReference Const Default
{Default script used for starting a quest when the player or, optionally, a specific ref/alias/faction enteres it.}

Group Required_Properties
	Quest Property QuestToStart Auto Const
	{Quest that we want to start}
EndGroup

Group Optional_Properties
	Bool Property PlayerTriggerOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this quest will only start if Triggered by the player.
	If set to FALSE, and all arrays are empty, then the Quest starts if Triggered by anybody.}

	ObjectReference[] Property TriggeredByReferences Auto Const
	{OPTIONAL: Quest will start if Triggered by any of these references.
	If ALL arrays are empty then quest starts if Triggered by anybody.}

	ReferenceAlias[] Property TriggeredByAliases Auto Const
	{OPTIONAL: Quest will start if Triggered by any of these aliases.
	If ALL arrays are empty then quest starts if Triggered by anybody.}

	Faction[] Property TriggeredByFactions Auto Const
	{OPTIONAL: Quest will start if Triggered by any of these factions.
	If ALL arrays are empty then quest starts if Triggered by anybody.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

Event OnTriggerEnter(ObjectReference akActionRef)

	if (DefaultScriptFunctions.CheckForMatches(RefToCheck = akActionRef, ReferenceArray = TriggeredByReferences, AliasArray = TriggeredByAliases, FactionArray = TriggeredByFactions, PlayerCheckOverride = PlayerTriggerOnly) == TRUE)
		if QuestToStart.isRunning() == FALSE
			Bool check = QuestToStart.start()
				; Do a quick check in case the quest could not be started
			if !check
					DefaultScriptFunctions.DefaultScriptTrace("ERROR: " + QuestToStart + " not started by " + self, ShowTraces)
			endif
		endif
	endif

EndEvent