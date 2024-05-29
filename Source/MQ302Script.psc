Scriptname MQ302Script extends Quest Conditional



ReferenceAlias Property FactionLeader Auto Const
ReferenceAlias Property FactionScientist Auto Const

ReferenceAlias Property MQ302RelayTrigger Auto Const

;Minutemen Aliases
ReferenceAlias Property PrestonGarvey Auto Const
ReferenceAlias Property Sturges Auto Const

;Railroad Aliases
ReferenceAlias Property Desdemona Auto Const
ReferenceAlias Property TinkerTom Auto Const

;BoS Aliases
ReferenceAlias Property ElderMaxson Auto Const
ReferenceAlias Property PaladinDanse Auto Const
ReferenceAlias Property ProctorIngram Auto Const


MQ00Script property MQ00 auto const


Quest Property BOS302 Auto Const

ObjectReference Property DN169_PostInstRubbleMarker Auto Const
ObjectReference Property CITPreBoomMarker Auto Const
ObjectReference Property CITPostBoomMarker Auto Const

; supporting faction quests
Quest Property MQ302BoS Auto Const
Quest Property MQ302Min Auto Const
Quest Property MQ302RR Auto Const

MinutemenCentralScript Property MinutemenCentralQuest auto const

group Globals
	GlobalVariable Property MQ302Faction Auto const
	{ which faction is the player working with:
		0 = no faction chosen
		1 = Brotherhood
		2 = Minutemen
		3 = Railroad
	}
endGroup

InputEnableLayer Property EnableLayer Auto
{ used to disable/enable player controls }

bool Property initialized = false Auto

; called once by startup stage
function InitializeQuest()
	debug.trace(self + "InitializeQuest")
	if initialized
		return
	endif



	;  put the correct NPC into the FactionLeader alias
	; (among many other things...)

	int factionID = MQ302Faction.GetValueInt()
	debug.trace(self + "   factionID=" + factionID)
	if factionID == 1
		MQ302BoS.Start()
		; BOS
		;BoSKickOut.Stop() - Don't call stop on this quest, extremely dangerous
		FactionLeader.ForceRefTo(ElderMaxson.GetRef())

		FactionScientist.ForceRefTo(ProctorIngram.GetRef())
	elseif factionID == 2
		MQ302Min.Start()
		; Minutemen
		FactionLeader.ForceRefTo(PrestonGarvey.GetRef())
		FactionScientist.ForceRefTo(Sturges.GetRef())
	elseif factionID == 3
		MQ302RR.Start()
		; Railroad
		FactionLeader.ForceRefTo(Desdemona.GetRef())
		FactionScientist.ForceRefTo(TinkerTom.GetRef())
		;disable trigger to update quest
		MQ302RelayTrigger.GetReference().Disable()


	endif

	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	; register for faction kickout event
	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	; special handling:
	; Minutemen - if with another faction, cleanup MQ-related quests:
	if factionID != 2
		MinutemenCentralQuest.HandleAttackOnInstituteByOtherFaction()
	endif

	initialized = true
endFunction


;handle teleporting player's followers around

FollowersScript Property Followers Auto Const


Function TeleportFollowers(ObjectReference MarkerA, ObjectReference MarkerB)


Followers.TryToTeleportCompanion(MarkerA)
Followers.TryToTeleportCompanion(MarkerB)


endFunction

; centralized Fast Travel enable/disable for quest


InputEnableLayer Property MQ302FTLayer Auto


Function FastTravelToggle(int togglevalue)

	if togglevalue == 0

		MQ302FTLayer = InputEnablelayer.Create()
		MQ302FTLayer.EnableFastTravel(False)


	elseif togglevalue == 1

		MQ302FTLayer.EnableFastTravel(True)
		MQ302FTLayer.Delete()

	endif

endFunction


InputEnableLayer Property MQ302ControlLayer Auto

Function ControlToggle(int togglevalue)

	if togglevalue == 0
		MQ302ControlLayer=InputEnableLayer.Create()
		MQ302ControlLayer.DisablePlayerControls()

	elseif togglevalue==1
		MQ302ControlLayer.EnablePlayerControls()
		MQ302ControlLayer.Delete()
	endif

EndFunction

;Function for updating RR side of things

ReferenceAlias Property Shaun Auto Conditional

ReferenceAlias Property FathersQuartersDoor01 Auto Conditional

ReferenceAlias Property FathersQuartersDoor02 Auto Conditional

ObjectReference Property Inst305ReactorTerminalRef Auto Conditional

Quest Property MQ302Radio Auto Const

Int Property ShaunInBed Auto Conditional

Quest Property InstituteTeleportEffects Auto Const

Function CombatUpdate()

;called when we need to get the Institute into the state it's supposed to be in for combat portion of quest

	if MQ302Faction.GetValue()==3

;turn off fast travel
		FastTravelToggle(0)

;start failing any active quests that might be running
		if Inst306.IsRunning()
			Inst306.SetStage(1500)
		endif
		if InstM01.IsRunning()
			InstM01.SetStage(1500)
		endif
		if InstM02.IsRunning()
			InstM02.SetStage(2500)
		endif
		if InstM03.IsRunning()
			InstM03.SetStage(2500)
		endif
		if InstR01.IsRunning()
			InstR01.SetStage(1500)
		endif
		if InstR02.IsRunning()
			InstR02.SetStage(1500)
		endif
		if InstR03.IsRunning()
			InstR03.SetStage(1500)
		endif
		if InstR04.IsRunning()
			InstR04.SetStage(1500)
		endif
		if InstR05.IsRunning()
			InstR05.SetStage(1500)
		endif



	endif
	InstituteTeleportEffects.Stop()
	Shaun.GetActorReference().RemoveFromAllFactions()
	ShaunInBed=1
	Shaun.GetActorReference().EvaluatePackage()
	Shaun.GetReference().Disable()
	Utility.Wait(0.1)
	Shaun.GetReference().Enable()
	FathersQuartersDoor01.GetReference().Unlock()
	FathersQuartersDoor02.GetReference().Unlock()
	Inst305ReactorTerminalRef.Disable()
	MQ302Radio.Start()


	;make companions not care about murder in the location
	((self as quest) as CompanionMurderLocationToggleScript).OkayToMurderInInstitute()

EndFunction

;Enable/Disable whatever crater/other things we need to
Function SetPostInstituteExplosionState()
	;;;;NOTE: this is now handled by the InstNukeControl script.
	;Enable CIT Exterior Post Boom Marker
	;CITPostBoomMarker.Enable()
	
	;Disable CIT Exterior Pre Boom Marker
	;CITPreBoomMarker.Disable()
	
	;Enable the rubble in the InstituteTunnel01 Cell
	DN169_PostInstRubbleMarker.Enable()
EndFunction
Int Property PasswordGiven Auto Conditional

Int Property ShaunConvDone Auto Conditional

Quest Property InstM01 Auto Const Mandatory

Quest Property InstM02 Auto Const Mandatory

Quest Property InstM03 Auto Const Mandatory

Quest Property InstR01 Auto Const Mandatory

Quest Property InstR02 Auto Const Mandatory

Quest Property InstR03 Auto Const

Quest Property InstR04 Auto Const Mandatory

Quest Property InstR05 Auto Const Mandatory

Quest Property Inst306 Auto Const

Int Property KidConvStarted Auto Conditional
