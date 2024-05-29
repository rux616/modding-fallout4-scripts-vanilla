Scriptname MS17StartSceneTriggerScript extends DefaultRef Const Default
{Default script used for checking if a reference entered this trigger, and optionally what Triggered it.}

Group Required_Properties
	Scene Property MyScene Auto Const
	{Quest containing the Stage to Set}
EndGroup

Group Optional_Properties
	Bool Property PlayerTriggerOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this stage will only set if Triggered by the player.
	If set to FALSE, and all arrays are empty, then the stage is set if Triggered by anybody.}

	ObjectReference[] Property TriggeredByReferences Auto Const
	{OPTIONAL: Stage will be set if Triggered by any of these references.
	If ALL arrays are empty then stage is set if Triggered by anybody.}

	ReferenceAlias[] Property TriggeredByAliases Auto Const
	{OPTIONAL: Stage will be set if Triggered by any of these aliases.
	If ALL arrays are empty then stage is set if Triggered by anybody.}

	Faction[] Property TriggeredByFactions Auto Const
	{OPTIONAL: Stage will be set if Triggered by any of these factions.
	If ALL arrays are empty then stage is set if Triggered by anybody.}

	Bool Property DeleteWhenTriggered = TRUE Auto Const
	{Delete this ref when triggered - TRUE by default}

EndGroup

Event OnTriggerEnter(ObjectReference akActionRef)
	if ( Game.GetPlayer() == akActionRef && MyQuest.GetStageDone(PrereqStage) )
		MyScene.Start()
		
		if DeleteWhenTriggered
			Delete()
		endif
	endif
EndEvent