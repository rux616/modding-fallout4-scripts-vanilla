Scriptname DLC04:DLC04_GZForceSceneOnTriggerEnterScript extends ObjectReference
{Starts a scene when the player (or, optionally, another ref/alias/faction) enters the trigger. May start different scenes depending on whether the power has been restored.}

Group Reference_Properties
	Scene property SceneToStart_PrePower Auto Const Mandatory
	{Scene to start if PowerRestoredStage IS NOT set.}

	Scene property SceneToStart_PostPower Auto Const Mandatory
	{Scene to start if PowerRestoredStage IS set.}
EndGroup

Group Quest_Properties
	Quest property DLC04GZTrackingQuest Auto Const Mandatory
	{The Galactic Zone tracking quest.}

	int property DLC04GZTrackingQuest_PowerRestoredStage = 1000 Auto Const
	{Stage on DLC04GZTrackingQuest indicating that the power has been restored.}
EndGroup

Group Optional_Properties
	bool property DoOnce Auto Const
	{Default: False. Can this trigger start its scene multiple times?}

	float property RestartDelay = 10.0 Auto Const
	{Default: 10. Once the scene ends, delay before this trigger will start it again.}

	Bool Property PlayerTriggerOnly = TRUE Auto Const
	{If set to TRUE (DEFAULT) then this scene will only start if Triggered by the player.
	If set to FALSE, and all arrays are empty, then the Scene starts if Triggered by anybody.}

	ObjectReference[] Property TriggeredByReferences Auto Const
	{OPTIONAL: Quest will start if Triggered by any of these references.
	If ALL arrays are empty then Scene starts if Triggered by anybody.}

	ReferenceAlias[] Property TriggeredByAliases Auto Const
	{OPTIONAL: Quest will start if Triggered by any of these aliases.
	If ALL arrays are empty then Scene starts if Triggered by anybody.}

	Faction[] Property TriggeredByFactions Auto Const
	{OPTIONAL: Quest will start if Triggered by any of these factions.
	If ALL arrays are empty then Scene starts if Triggered by anybody.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup


Event OnLoad()
	if (!DoOnce)
		Self.RegisterForRemoteEvent(SceneToStart_PrePower, "OnEnd")
		Self.RegisterForRemoteEvent(SceneToStart_PostPower, "OnEnd")
	EndIf
EndEvent


Auto State Ready
	Event OnTriggerEnter(ObjectReference akActionRef)
		if (DefaultScriptFunctions.CheckForMatches(RefToCheck = akActionRef, ReferenceArray = TriggeredByReferences, AliasArray = TriggeredByAliases, FactionArray = TriggeredByFactions, PlayerCheckOverride = PlayerTriggerOnly) == TRUE)
			Scene sceneToStart
			if (!DLC04GZTrackingQuest.GetStageDone(DLC04GZTrackingQuest_PowerRestoredStage))
				sceneToStart = SceneToStart_PrePower
				Debug.Trace("A")
			Else
				sceneToStart = SceneToStart_PostPower
				Debug.Trace("B")
			EndIf

			Debug.Trace("TEST: " + DLC04GZTrackingQuest + ", " + DLC04GZTrackingQuest.GetStageDone(DLC04GZTrackingQuest_PowerRestoredStage))
			Debug.Trace("Triggering " + sceneToStart)

			if sceneToStart.IsPlaying() == False
				sceneToStart.ForceStart()
				if (DoOnce)
					GoToState("Done")
				Else
					GoToState("Active")
				EndIf
			EndIf
		EndIf
	EndEvent
EndState

State Done
	;Do nothing.
EndState

State Active
	Event Scene.OnEnd(Scene source)
		GoToState("WaitingForRestart")
	EndEvent
EndState

State WaitingForRestart
	Event OnBeginState(String asOldState)
		StartTimer(RestartDelay)
	EndEvent

	Event OnTimer(int timerID)
		GoToState("Ready")
	EndEvent
EndState

Event Scene.OnEnd(Scene source)
EndEvent