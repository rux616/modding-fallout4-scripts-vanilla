Scriptname DN160_EncounterManagerScript extends ObjectReference Hidden
{Script for a DefaultDummy in HubrisComics01, responsible for enabling and managing combat encounters in the cell.}
;I'm using this instead of vanilla enable triggers because they (and the quest previously used to handle this) weren't reset safe,
;and almost half the encounters here have special events or conditions anyway. This is just cleaner to work with.


;-------------------------------
;Enabling & Disabling Encounters
;-------------------------------

;1F Markers & Objects
ObjectReference property DN160_1FGhoulAmbushStarter auto const
ObjectReference property DN160_1FGhoulEnableMarker_Group2 auto const
ObjectReference property DN160_AxeSpotlightEnableMarker Auto Const Mandatory
ObjectReference property DN160_1FCeilingLamp Auto Const Mandatory
Sound property QSTArcJetLightsOnA Auto Const Mandatory

;2F Markers
ObjectReference property DN160_2FGhoulChargeStarter auto const

;3F Markers
ObjectReference property DN160_3FEastEntryEnableMarker auto const
ObjectReference property DN160_3FWestEntryEnableMarker auto const

;4F Markers
ObjectReference property DN160_4FGhoulChargeStarter auto const
ObjectReference property DN160_4FStairEntryEnableMarker auto const
ObjectReference property DN160_4FRoofEntryEnableMarker auto const

;1F Store Lights & Music
Sound property MUSRadioSilverShroudMainTheme auto const
ObjectReference property DN160_StoreAudioSource auto const
ObjectReference property DN160_StoreSpotlightEnableMarker auto const

;Keyword links between actors on 1F and 4F. All links are Transient to avoid making the actors persist.
Keyword property LinkCustom10 auto const

;When set on these ghouls, activates a package that causes them to run out and sandbox at their LinkCustom01. Generally, this throws them at the player.
ActorValue property DN160_GhoulChargeToggle auto const

;Standard Release Hold Position AV.
ActorValue property DMP_Combat_ReleaseHoldPosition auto const


Event OnReset()
	;For the store area (only), disable the ambush system and just enable some vanilla ghouls on reset.
	EnableDisableActorChain(DN160_1FGhoulAmbushStarter, False)
	DN160_1FGhoulEnableMarker_Group2.EnableNoWait()

	;Disable all of the other enable parent markers in the cell on reset.
	DN160_3FEastEntryEnableMarker.DisableNoWait()
	DN160_3FWestEntryEnableMarker.DisableNoWait()
	DN160_4FStairEntryEnableMarker.DisableNoWait()
	DN160_4FRoofEntryEnableMarker.DisableNoWait()
EndEvent

;As the player enters triggers throughout the cell, they call this function with their IDs to trigger encounters.
Function EncounterEvent(int eventID)
	;Debug.Trace("EncounterEvent: " + eventID)
	if ((eventID == 1) && (!DN160_1FGhoulAmbushStarter.IsDisabled()))
		;1F - Trigger the Store Ambush (Normal)
		Utility.Wait(0.5)
		;Play the Silver Shroud's theme music.
     	MUSRadioSilverShroudMainTheme.Play(DN160_StoreAudioSource)
     	;Turn on the lights.
     	DN160_StoreSpotlightEnableMarker.EnableNoWait()
     	Utility.Wait(0.5)
     	;Start the ambush.
		StartSequentialAmbush()
		;Wait a bit.
		Utility.Wait(2)
		;Enable the light over the axe.
		QSTArcJetLightsOnA.Play(DN160_1FCeilingLamp)
		DN160_AxeSpotlightEnableMarker.Enable()
		DN160_1FCeilingLamp.DisableNoWait()
	ElseIf (eventID == 2)
		;1F - Trigger the Store Ambush (Monkey or Ghoul Shot)
     	;Start the ambush.
		StartSequentialAmbush()
	ElseIf (eventID == 3)
		;2F - Second floor, west side.
		EndSequentialAmbush()
	ElseIf (eventID == 4)
		;2F - Second floor, east side.
		EndSequentialAmbush()
	ElseIf ((eventID == 5) && (DN160_3FEastEntryEnableMarker.IsDisabled()))
		;3F - Third floor, west side.  Mutually exclusive with 6.
		DN160_3FWestEntryEnableMarker.EnableNoWait()
	ElseIf ((eventID == 6) && (DN160_3FWestEntryEnableMarker.IsDisabled()))
		;3F - Third floor, east side.  Mutually exclusive with 5.
		DN160_3FEastEntryEnableMarker.EnableNoWait()
	ElseIf ((eventID == 7) && (DN160_4FRoofEntryEnableMarker.IsDisabled()))
		;4F - Fourth floor, stair entry.  Mutually exclusive with 8.
		DN160_4FStairEntryEnableMarker.EnableNoWait()
	ElseIf ((eventID == 8) && (DN160_4FStairEntryEnableMarker.IsDisabled()))
		;4F - Fourth floor, roof entry.  Mutually exclusive with 7 and 1.
		DN160_4FRoofEntryEnableMarker.EnableNoWait()
		;Also switch to the alternate combat for the ground floor.
		EnableDisableActorChain(DN160_1FGhoulAmbushStarter, False)
		DN160_1FGhoulEnableMarker_Group2.EnableNoWait()
	ElseIf (eventID == 10)
		;Trigger the 2F Charge.
		SetValueChain(DN160_2FGhoulChargeStarter, 1)
	ElseIf (eventID == 11)
		;Trigger the 4F Charge.
		SetValueChain(DN160_4FGhoulChargeStarter, 1)
	Else
		;Debug.Trace("EncounterEvent received invalid eventID=" + eventID)
	EndIf
	;Debug.Trace("EncounterEvent: " + eventID + " done.")
EndFunction


;Enable or disable a chain of refs.
Function EnableDisableActorChain(ObjectReference obj, bool shouldEnable)
	int failsafe = 0
	While ((obj != None) && (failsafe < 25))
		if (shouldEnable)
			obj.EnableNoWait()
		Else
			Actor objAct = obj as Actor
			if ((objAct != None) && (!objAct.IsDead()))
				objAct.DisableNoWait()
			EndIf
		EndIf
		failsafe = failsafe + 1
		obj = obj.GetLinkedRef(LinkCustom10)
	EndWhile
EndFunction

;Set DN160_GhoulChargeToggle on a chain of refs.
Function SetValueChain(ObjectReference obj, int val)
	int failsafe = 0
	While ((obj != None) && (failsafe < 25))
		obj.SetValue(DN160_GhoulChargeToggle, val)
		obj.SetValue(DMP_Combat_ReleaseHoldPosition, 1)
		(obj as Actor).EvaluatePackage()
		failsafe = failsafe + 1
		obj = obj.GetLinkedRef(LinkCustom10)
	EndWhile
EndFunction



;-----------------------------
;Comic Store Sequential Ambush
;-----------------------------
;A series of linked ghouls whose ambushes trigger in sequence as the player kills them off.

int property maxActive Auto
{Number of enemies who should be active at a time.}

int ambushIndex 		;Index used to keep track of who we've triggered.
int ambushChainLength	;Number of enemies in the LinkCustom10 chain from DN160_1FGhoulAmbushStarter

;Activates the first <maxActive> enemies in the chain.
Function StartSequentialAmbush()
	if (ambushChainLength == 0)
		ambushChainLength = DN160_1FGhoulAmbushStarter.CountLinkedRefChain(LinkCustom10) + 2 ;+1 for the actor themselves, +1 so we can use less than in subsequent loops.
	EndIf
	if (ambushIndex == 0)
		;Debug.Trace("Start Sequential")
		While ((ambushIndex < maxActive) && (ambushIndex < ambushChainLength))
			Actor a = DN160_1FGhoulAmbushStarter.GetNthLinkedRef(ambushIndex, LinkCustom10) as Actor
			if ((a != None) && (!a.IsDead()))
				a.Activate(Self)
				a.SetValue(DN160_GhoulChargeToggle, 1)
				a.EvaluatePackage()
				Utility.Wait(Utility.RandomFloat(0.1, 0.5))
			EndIf
			ambushIndex = ambushIndex + 1
		EndWhile
	EndIf
EndFunction

;When one enemy dies, activate the next one.
;Note that if the player shoots an enemy that hasn't triggered normally, this effectively increases maxActive for the
;rest of the combat. No big deal. They asked for it...
Function SequentialAmbushEnemyDead()
	if (ambushIndex == 0)
		StartSequentialAmbush()
	ElseIf (ambushIndex < ambushChainLength)
		Actor a = DN160_1FGhoulAmbushStarter.GetNthLinkedRef(ambushIndex, LinkCustom10) as Actor
		if (a != None)
			a.Activate(Self)
			a.SetValue(DN160_GhoulChargeToggle, 1)
			a.EvaluatePackage()
		EndIf
		ambushIndex = ambushIndex + 1
	EndIf
EndFunction

;If the player bypasses the combat (by entering via the roof, rushing up the stairs, or jetpacking through any hole), activate any enemies they
;can see and disable any they can't to avoid ugliness on the second floor.
Function EndSequentialAmbush()
	;Debug.Trace("Ending Sequential " + ambushIndex + ", " + ambushChainLength)
	Actor player = Game.GetPlayer()
	if (ambushChainLength == 0)
		ambushChainLength = DN160_1FGhoulAmbushStarter.CountLinkedRefChain(LinkCustom10) + 2
	EndIf
	int i = 0
	While (i < ambushChainLength)
		Actor a = DN160_1FGhoulAmbushStarter.GetNthLinkedRef(i, LinkCustom10) as Actor
		if (a != None)
			if ((a.IsInCombat()) || (player.HasDetectionLoS(a)))
				a.Activate(Self)
				a.EvaluatePackage()
				;Debug.Trace("-Activating " + a)
			ElseIf (!a.IsDead()  && (a.GetSleepState() == 3))
				a.DisableNoWait()
				;Debug.Trace("-Disabling " + a)
			EndIf
		EndIf
		i = i + 1
	EndWhile
	;Debug.Trace("End Sequential")
EndFunction
