Scriptname MQ301Script extends Quest Conditional

Quest Property DialogueDiamondCityEntrance Auto
ObjectReference Property DmndSecurityEnableMarker Auto
ObjectReference Property MQ301DeadGuardsEnableMarker Auto
ObjectReference Property DmndResidentsEnableMarker Auto
ReferenceAlias Property Y738 Auto
ObjectReference Property DiamondCityRadioTransmitterRef Auto
ObjectReference Property MQ301DiamondCityRadioTransmitterRef Auto
Quest Property MQ301RadioQuest Auto

bool initialized = false
Int Property KickedOutBoS Auto Conditional

; called once by startup stage
function InitializeQuest()
	if initialized
		return
	endif

	; which faction am I doing this quest "with"?
	; by default - BOS (if with Minutemen, will be set prior to starting this quest)
	if MQ301Faction.GetValueInt() == 0
		MQ301Faction.SetValueInt(1)		; BOS
	endif

	; change Diamond City state
	; Change the radio
	DiamondCityRadioTransmitterRef.Disable()
	MQ301RadioQuest.Start()
	MQ301DiamondCityRadioTransmitterRef.Enable()


	; clear up all the intro scenes from the starting state
	DialogueDiamondCityEntrance.SetStage(1000)

	; disable all the guards
	DmndSecurityEnableMarker.Disable()

	; enable dead guard bodies
	MQ301DeadGuardsEnableMarker.Disable()

	; disable the generic NPCs
	DmndResidentsEnableMarker.Disable()

	; enable the courser
	Y738.GetActorRef().Enable()

	;move all the citizens
	SetupCitizens()

	;setup the factions
	SetupFactions()

	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	; register for faction kickout event
	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	initialized = true
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)
	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		if GetStageDone(10) && !GetStageDone(150) && akNewLoc == DiamondCityLocation
	    	; player has arrived in Diamond City
	   		SetStage(150)
	   		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
		endif
	endif

EndEvent

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)
	if kickoutFactionNumber == MQ301Faction.GetValueInt()
		; if I'm kicked out of the Brotherhood and I'm also doing this quest with the brotherhood, let me know
		If kickoutFactionNumber == 1
			KickedOutBoS = 1
		EndIf
		; failsafe - you must now do this quest with the Minutemen
		MQ301Faction.SetValueInt(2)
	endif
EndEvent

function CheckForMinutemenRadio()
	if Game.IsPlayerListening(MinutemenCentralQuest.MinutemenRadioFrequency)
		SetStage(100)
	endif
endFunction

Location Property DiamondCityLocation Auto Const

MinutemenCentralScript property MinutemenCentralQuest auto const

MQ00Script property MQ00 auto const

group Globals
	GlobalVariable Property MQ301Faction Auto const
	{ which faction is the player working with:
		0 = no faction chosen
		1 = Brotherhood
		2 = Minutemen
		3 = Railroad
	}
endGroup

group DmndCitizenProperties
	RefCollectionAlias Property Citizens Auto
	ReferenceAlias Property CitizenOverrideAlias Auto
endGroup

Function SetupCitizens()

	;grab each citizen, apply the data on the override reference so they pickup the right packages, then clear everything
	int icount = Citizens.GetCount()
	int iindex = 0
	while (iindex < icount)
	  CitizenOverrideAlias.ApplyToRef(Citizens.GetAt(iindex))
	  ;move this citizen to their editor location
	  Citizens.GetAt(iindex).MoveToMyEditorLocation()
	  iindex = iindex + 1
	endwhile

	;clear out the ref collection so we don't have actors persisting
	Citizens.RemoveAll()

EndFunction

group FactionProperties
	RefCollectionAlias Property BosSoldiers Auto
	RefCollectionAlias Property Minuteman Auto
	ReferenceAlias Property CurrentLeader Auto
	ReferenceAlias Property PrestonGarvey Auto
	ReferenceAlias Property PaladinDanse Auto
	Faction Property CurrentCompanionFaction Auto
	ObjectReference Property MQ301LeaderMeetMarker Auto
endGroup

Function SetupFactions()
	;Brotherhood setup
	If MQ301Faction.GetValueInt() == 1
		;disable the Minutemen
		int iMinuteCount = Minuteman.GetCount()
		int iMinuteIndex = 0
		While (iMinuteIndex < iMinuteCount)
			Minuteman.GetAt(iMinuteIndex).Disable()
			iMinuteIndex = iMinuteIndex + 1
		endwhile
		Actor DanseREF = PaladinDanse.GetActorRef()
		;make Danse the current leader of all the allies
		CurrentLeader.ForceRefTo(DanseREF)

		;if not loaded and not current companion, move Danse to the marker
		If (!DanseREF.IsInFaction(CurrentCompanionFaction)) && (!DanseREF.Is3DLoaded())
			DanseREF.EvaluatePackage()
			DanseREF.Moveto(MQ301LeaderMeetMarker)
		endif
	Else
		;disable the Brotherhood
		int iBoSCount = BosSoldiers.GetCount()
		int iBoSIndex = 0
		While (iBoSIndex < iBoSCount)
			BosSoldiers.GetAt(iBoSIndex).Disable()
			iBoSIndex = iBoSIndex + 1
		endwhile
		Actor PrestonGarveyREF = PrestonGarvey.GetActorRef()
		;make Danse the current leader of all the allies
		CurrentLeader.ForceRefTo(PrestonGarveyREF)

		;if not loaded and not current companion, move Danse to the marker
		If (!PrestonGarveyREF.IsInFaction(CurrentCompanionFaction)) && (!PrestonGarveyREF.Is3DLoaded())
			PrestonGarveyREF.EvaluatePackage()
			PrestonGarveyREF.Moveto(MQ301LeaderMeetMarker)
		endif
	endif
EndFunction

;Function to clean up the Synths in Diamond City
Function CheckSynths(Actor akSynth)
	;if Synth isn't dead, trigger teleport FX then disable
	If akSynth.IsDead() == false
		akSynth.DisableNoWait()
	endif
EndFunction