ScriptName BoSM01QuestScript extends Quest Conditional
{Quest Script for BoSM01, The Lost Patrol. Manages conditional variables referenced by quest dialogue and scenes, and handles updating the pulser objectives.}

Group Main_Properties
	ObjectReference[] property Transmitters auto
	{Array of transmitters.}

	Quest property BoS200 Auto Const
	{BoS200 - Interim quest used by the BoS for the remainder of Act I.}

	Quest property BoSM01DanseOverrides Auto Const
	{BoSM01 Danse Overrides quest.}

	float property radioFrequency = 107.0 Auto Hidden Const
	;Frequency of the pulsers.

	float property VarhamPulserMaxRange = 10000.0 Auto Hidden Const
	;Range of Varham's pulser.

	float property AstlinPulserMaxRange = 5255.0 Auto Hidden Const
	;Range of Astlin's pulser.

	float property FarisPulserMaxRange = 9000.0 Auto Hidden Const
	;Range of Faris' pulser.
EndGroup

Group Quest_Conditionals
	bool property isDanseDialogueEnabled = False Auto Hidden Conditional
	{Default=False. If true, Danse will offer his BoSM01 Intro, Midquest, and Final dialogue. If false, he won't.}

	bool property isDanseHandoffEnabled = False Auto Hidden Conditional
	{Default=False. If true, Danse will speak his handoff line about the quest, directing the player to Kells.}

	bool property isKellsDialogueEnabled = False Auto Hidden Conditional
	{Default=False. If true, Kells will offer his BoSM01 Intro, Midquest, and Final dialogue. If false, he won't.}

	bool property isDanseInitialQuestgiver = False Auto Hidden Conditional
	{Default=False. Used for quest summary conditions. Was Danse the player's original questgiver?}

	bool property isQuestTrackingEnabled = False Auto Hidden Conditional
	{Default=False. If true, quest objectives will be displayed; if not, they won't. Set to true when the player receives the quest or approaches a body.}

	bool property hasUnreportedMidquestEvent Auto Hidden Conditional
	{Is there an unreported midquest event the player could tell Danse or Kells about? This variable basically stores the result of a complex conditional.}

	bool property isVarhamPulserObjectiveDisplayed Auto Hidden Conditional
	{Are we displaying the objective to follow Varham's pulser?}

	bool property isAstlinPulserObjectiveDisplayed Auto Hidden Conditional
	{Are we displaying the objective to follow Astlin's pulser?}

	bool property isFarisPulserObjectiveDisplayed Auto Hidden Conditional
	{Are we displaying the objective to follow Faris' pulser?}
EndGroup


;----------------------------
;Quest Conditional Functions
;----------------------------

;Enable the Act I version of BoSM01, with Danse as the questgiver, and direct the player to speak with him.
Function EnableBoSM01Act1()
	isDanseDialogueEnabled = True
	BoS200.SetStage(200)
EndFunction

;Disable the Act I version of BoSM01 when BoS201 (Shadow of Steel) starts, to prevent conflicts with BoS201/202 dialogue and scenes.
Function DisableBoSM01Act1()
	isDanseDialogueEnabled = False
EndFunction

;Enable the Act II version of BoSM01 when BoS202 (Show No Mercy) is ready for it, with Kells as the questgiver.
Function EnableBoSM01Act2()
	if (GetStageDone(30) && !GetStageDone(200))
		isDanseHandoffEnabled = True
	EndIf
	isDanseDialogueEnabled = False
	isKellsDialogueEnabled = True
EndFunction

;Disable Danse's handoff dialogue once he says it, or once the player speaks to Kells.
Function DisableDanseHandoff()
	isDanseHandoffEnabled = False
EndFunction

;Make sure all dialogue is turned off when the quest fails.
Function DisableBoSM01Dialogue()
	isDanseDialogueEnabled = False
	isKellsDialogueEnabled = False
	isDanseHandoffEnabled = False
EndFunction


;-------------------------
;Midquest Event Reporting
;-------------------------

;Determine if the player has completed a quest events (the 7s) but hasn't told the questgiver about it yet (the 8s, and 91).
Function CheckMidquestEventReporting()
	if ((GetStageDone(67) && !GetStageDone(68)) || \
		(GetStageDone(77) && !GetStageDone(78)) || \
		(GetStageDone(87) && !GetStageDone(88)) || \
		(GetStageDone(90) && !GetStageDone(91)))
		hasUnreportedMidquestEvent = True
	Else
		hasUnreportedMidquestEvent = False
	EndIf
EndFunction

;Clear any unreported midquest events.
Function ClearMidquestEventReporting()
	if (GetStageDone(67))
		SetStage(68)
	EndIf
	if (GetStageDone(77))
		SetStage(78)
	EndIf
	if (GetStageDone(87))
		SetStage(88)
	EndIf
	if (GetStageDone(67) && GetStageDone(77) && GetStageDone(87))
		SetStage(91)
	EndIf
	hasUnreportedMidquestEvent = False
EndFunction


;--------------------------
;Pulser Objective Handling
;--------------------------

Function UpdatePulserObjectives()
	StartTimer(0)
EndFunction

Event OnTimer(int timerID)
	UpdateObjectives()
EndEvent

Function UpdateObjectives()
	;Debug.Trace("BoSM01: Update Pulsers")
	Actor player = Game.GetPlayer()

	if (isQuestTrackingEnabled)
		;Check Varham
		if (GetStageDone(60) && !GetStageDone(61) && !GetStageDone(62))
			if (Transmitters[0].GetTransmitterDistance() < VarhamPulserMaxRange)
				if (!IsObjectiveDisplayed(60))
					SetObjectiveDisplayed(60, True, True)
					isVarhamPulserObjectiveDisplayed = True
				EndIf
			Else
				SetObjectiveDisplayed(60, False)
				isVarhamPulserObjectiveDisplayed = False
			EndIf
		EndIf

		;Check Astlin
		if (GetStageDone(70) && !GetStageDone(71) && !GetStageDone(72))
			;Check seperately to see if the player is inside or outside the National Guard Training Yard, since distance checks don't work through load doors.
			if (Transmitters[1].GetTransmitterDistance() < AstlinPulserMaxRange)
				if (!IsObjectiveDisplayed(70))
					SetObjectiveDisplayed(70, True, True)
					isAstlinPulserObjectiveDisplayed = True
				EndIf
			Else
				SetObjectiveDisplayed(70, False)
				isAstlinPulserObjectiveDisplayed = False
			EndIf
		EndIf

		;Check Faris
		if (GetStageDone(80) && !GetStageDone(81) && !GetStageDone(82))
			if (Transmitters[2].GetTransmitterDistance() < FarisPulserMaxRange)
				if (!IsObjectiveDisplayed(80))
					SetObjectiveDisplayed(80, True, True)
					isFarisPulserObjectiveDisplayed = True
				EndIf
			Else
				SetObjectiveDisplayed(80, False)
				isFarisPulserObjectiveDisplayed = False
			EndIf
		EndIf
	EndIf

	if (!GetStageDone(90))
		StartTimer(5)
	EndIf
EndFunction

;--------------------------
;Danse Overrides Handling
;--------------------------

Function BeginDanseScene()
	(BoSM01DanseOverrides as BoSM01DanseOverridesQuestScript).BeginDanseScene()
EndFunction

Function EndDanseScene()
	(BoSM01DanseOverrides as BoSM01DanseOverridesQuestScript).EndDanseScene()
EndFunction