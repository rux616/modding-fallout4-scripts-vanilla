Scriptname DN151_TrackingQuestScript extends Quest Conditional
{Quest script for the DN151 tracking quest. Fields requests from the movable water system and manages the puzzle itself.}

;-------------------
;DN151 Water Puzzle
;-------------------

Group Main_Puzzle
	Quest property DN151 Auto Const Mandatory
	{The dungeon quest for this space (a different quest).}

	DN151_MovableWater property DN151WaterPlane Auto Const Mandatory
	{The main water plane in Weston.}

	ObjectReference[] property DN151WaterPumps Auto Const Mandatory
	{Array of water pumps.}

	;Track whether each pump is on.
	bool property DN151WaterPumpMainOn = False Auto Conditional Hidden
	bool property DN151WaterPump1On = False Auto Conditional Hidden
	bool property DN151WaterPump2On = False Auto Conditional Hidden
	bool property DN151WaterPump3On = False Auto Conditional Hidden
	bool property DN151WaterPump4On = False Auto Conditional Hidden
	bool property DN151SecuritySystemOn = True Auto Conditional Hidden

	;How many pumps are on?
	int property DN151PumpsActive = 0 Auto Conditional Hidden

	;Turret RefCollectionAlias
	RefCollectionAlias property TurretRefCol Auto Const Mandatory

	;Each of the four Flood Control Pumps (01-04) and the main pump (05) have a LinkCustom08 transient linkedref to their
	;'ready' sound marker.
	Keyword property LinkCustom08 Auto Const Mandatory

	;Each of the four Flood Control Pumps (01-04) and the main pump (05) have a LinkCustom09 transient linkedref chain
	;to objects that need to respond when the pump is started. This may include:
	; - Default2StateActivators, which get open events.
	; - LoadElevatorPanelScripts, which get set to active.
	; - Anything else, which gets toggled.
	Keyword property LinkCustom09 Auto Const Mandatory

	Sound property AMBIntAlarmGeneric2DLPM Auto Const Mandatory
	{Alarm sound to play when activating a pump.}

	Sound property QSTWestonWaterFlow2DB Auto Const Mandatory
	{Water sound to play when activating a pump.}
EndGroup

int alarmSoundID = -1 		;Tracking index for the alarm sound.
int waterFlowSoundID = -1 	;Tracking index for the water sound.


Function ActivatePump(ObjectReference pump, int pumpID)
	Keyword pumpKeyword

	;Set the associated bool's state, update the water height, and update quest stages on DN151 as necessary.
	int waterHeight = 0
	if (pumpID == 1)
		DN151WaterPump1On = True
		DN151PumpsActive = 1
		waterHeight = 3
	ElseIf (pumpID == 2)
		DN151WaterPump2On = True
		DN151PumpsActive = 2
		waterHeight = 2
	ElseIf (pumpID == 3)
		DN151WaterPump3On = True
		DN151PumpsActive = 3
		waterHeight = 1
	ElseIf (pumpID == 4)
		DN151WaterPump4On = True
		DN151PumpsActive = 4
		waterHeight = 0
		;If the player is on DN151, display 'Restart the Main Pump'
		DN151.SetStage(130)
	ElseIf (pumpID == 5)
		DN151WaterPumpMainOn = True
		;If the player is on DN151, display 'Return to Supervisor White'. Otherwise, just record that this is done for later reference.
		DN151.SetStage(200)
	EndIf

	;Turn off the prior sound effects if they were still playing.
	StopPumpActivationSFX()

	;Turn off the old 'Ready' sound for this pump.
	ObjectReference oldReadySound = pump.GetLinkedRef(LinkCustom08)
	if (oldReadySound != None)
		oldReadySound.DisableNoWait()
	EndIf

	if (pumpID < 5)
		;Play the pump startup sounds.
		StartPumpActivationSFX(pump)

		;Wait for the pump startup sounds to play.
		Utility.Wait(2.5)
	EndIf

	;Update the objects associated with the pump.
	ObjectReference next = pump.GetLinkedRef(LinkCustom09)
	int breakout = 0
	While ((next != None) && (breakout < 25))
		Debug.Trace("DN151 Pump is interacting with: " + next)
		if ((next as Default2StateActivator) != None)
			(next as Default2StateActivator).SetOpenNoWait()
		ElseIf ((next as LoadElevatorPanelScript) != None)
			(next as LoadElevatorPanelScript).MakeElevatorFunctional()
		ElseIf ((next as DNSC_MusicActivatorScript) != None)
			Utility.Wait(3)
			next.Activate(next)
		ElseIf (next.IsDisabled())
			next.EnableNoWait()
		Else
			next.DisableNoWait()
		EndIf
		next = next.GetLinkedRef(LinkCustom09)
		breakout = breakout + 1
	EndWhile

	;Update the water height; start translating the water planes.
	DN151WaterPlane.SetWaterStage(waterHeight)
	DN151WaterPlane.BeginWaterStageTranslation()

	;Update the status text for all of the terminals.
	UpdateTerminalText()

	;After a brief delay, turn on the Ready sound for the next pump.
	StartTimer(4)
EndFunction

Event OnTimer(int timerID)
	;When the timer fires, check to see if the player has activated the next pump yet (probably not).
	;If not, enable the 'Ready' sound for that pump to draw attention to it. 
	ObjectReference currentPump = DN151WaterPumps[DN151PumpsActive]
	if (currentPump.GetLinkedRef(LinkCustom09).IsDisabled())
		currentPump.GetLinkedRef(LinkCustom08).Enable()
	EndIf
EndEvent


Function StartPumpActivationSFX(ObjectReference pump)
	;Debug.Trace("Start pump activation.")
	alarmSoundID = AMBIntAlarmGeneric2DLPM.Play(pump)
	waterFlowSoundID = QSTWestonWaterFlow2DB.Play(pump)
EndFunction

Function StopPumpActivationSFX()
	;Debug.Trace("Stop pump activation.")
	Sound.StopInstance(alarmSoundID)
	alarmSoundID = -1
	Sound.StopInstance(waterFlowSoundID)
	waterFlowSoundID = -1
EndFunction


;---------------------
;Name Clearing System
;---------------------

Group Name_Clearing
	RefCollectionAlias property NameClearingRefCol Auto Mandatory
	{A RefCollectionAlias with a blank display name override. Used to clear the names of submerged DN151_WaterObjects, temporarily preventing activation upon request.}
EndGroup

Function ClearNameOnObject(ObjectReference obj)
	NameClearingRefCol.AddRef(obj)
EndFunction

Function RestoreNameOnObject(ObjectReference obj)
	NameClearingRefCol.RemoveRef(obj)
EndFunction


;--------------------------
;Terminal Text Replacement
;--------------------------

Group Text_Replacement
	RefCollectionAlias property TerminalRefCol Auto Mandatory
	{A RefCollectionAlias of all of the terminals in the space that have text replacement tokens to update.}

	GlobalVariable property DN151_WaterPumpsActive Auto Mandatory
	{Global that maintains a count of active flood control pumps.}

	Message property DN151_Msg_MainPump_On Auto Mandatory ;ERROR
	Message property DN151_Msg_MainPump_Off Auto Mandatory ;ACTIVE	

	Message property DN151_Msg_FloodPump_On Auto Mandatory ;ERROR
	Message property DN151_Msg_FloodPump_Off Auto Mandatory ;ACTIVE	

	Message property DN151_Msg_Security_On Auto Mandatory ;ACTIVE
	Message property DN151_Msg_Security_Off Auto Mandatory ;DISABLED
EndGroup

;Terminal text is updated:
; - When the cell loads (OnCellLoad, above).
; - When the water stage changes (ModifyWaterStage, above).
Function UpdateTerminalText()
	Message mainMsg
	Message pump1Msg
	Message pump2Msg
	Message pump3Msg
	Message pump4Msg
	Message securityMsg

	;Main Pump
	if (DN151WaterPumpMainOn)
		mainMsg = DN151_Msg_MainPump_Off
	Else
		mainMsg = DN151_Msg_MainPump_On
	EndIf

	;Pump 1
	if (DN151WaterPump1On)
		pump1Msg = DN151_Msg_FloodPump_On
	Else
		pump1Msg = DN151_Msg_FloodPump_Off
	EndIf

	;Pump 2
	if (DN151WaterPump2On)
		pump2Msg = DN151_Msg_FloodPump_On
	Else
		pump2Msg = DN151_Msg_FloodPump_Off
	EndIf

	;Pump 3
	if (DN151WaterPump3On)
		pump3Msg = DN151_Msg_FloodPump_On
	Else
		pump3Msg = DN151_Msg_FloodPump_Off
	EndIf

	;Pump 4
	if (DN151WaterPump4On)
		pump4Msg = DN151_Msg_FloodPump_On
	Else
		pump4Msg = DN151_Msg_FloodPump_Off
	EndIf

	;Update the pump count.
	DN151_WaterPumpsActive.SetValueInt(DN151PumpsActive)

	;Security
	DN151SecuritySystemOn = True
	int i = 0
	Actor currentAsActor
	DN151_TurretScript currentAsDN151Turret
	;Debug.Trace("SECURITY SYSTEM CHECK " + TurretRefCol.GetCount())
	While (DN151SecuritySystemOn && (i < TurretRefCol.GetCount()))
		currentAsActor = TurretRefCol.GetAt(i) as Actor
		currentAsDN151Turret = (currentAsActor as ObjectReference) as DN151_TurretScript
		;Debug.Trace("--SECURITY: " + currentAsActor + ", " + currentAsDN151Turret + ", " + !currentAsActor.IsUnconscious() + ", " + !currentAsActor.IsDead())
		if (currentAsDN151Turret == None)
			;Non-DN151 Turret; one that doesn't get submerged.
			if (currentAsActor.IsUnconscious() && !currentAsActor.IsDead())
				DN151SecuritySystemOn = False
			EndIf
		Else
			;DN151 Turret, may be submerged.
			;Debug.Trace("--SECURITY 2: " + currentAsDN151Turret + ", " + currentAsDN151Turret.isDeactivated)
			;if (currentAsDN151Turret.isDeactivated && !currentAsActor.IsDead())
			;	DN151SecuritySystemOn = False
			;EndIf
		EndIf
		i = i + 1
	EndWhile
	;Debug.Trace("Security Result: " + DN151SecuritySystemOn)
	if (DN151SecuritySystemOn)
		securityMsg = DN151_Msg_Security_On
	Else
		securityMsg = DN151_Msg_Security_Off
	EndIf

	;Update all of the terminals:
	ObjectReference term
	i = 0
	While (i < TerminalRefCol.GetCount())
		term = TerminalRefCol.GetAt(i)
		term.AddTextReplacementData("DN151MainPumpStatus", mainMsg)
		term.AddTextReplacementData("DN151FloodPumpCount", DN151_WaterPumpsActive)
		term.AddTextReplacementData("DN151FloodPump1Status", pump1Msg)
		term.AddTextReplacementData("DN151FloodPump2Status", pump2Msg)
		term.AddTextReplacementData("DN151FloodPump3Status", pump3Msg)
		term.AddTextReplacementData("DN151FloodPump4Status", pump4Msg)
		term.AddTextReplacementData("DN151SecurityStatus", securityMsg)
		i = i + 1
	EndWhile
EndFunction