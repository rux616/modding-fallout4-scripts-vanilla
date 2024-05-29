Scriptname MQ206Script extends WorkshopEventsQuestScript Conditional

Int Property AmariRailroad Auto Conditional	; did Doctor Amari point the player to the Railroad? 0 = no, 1 = yes

Int Property DesExplainsChip Auto Conditional ; has Desdemona explained why they need the chip? 0 = no, 1 = yes

group Globals
	GlobalVariable Property PlayerBoS_KickedOut Auto const
	GlobalVariable Property PlayerRailroad_KickedOut Auto const
	GlobalVariable Property MQ206TeleporterFaction Auto const
	{ which faction is the player working with:
		0 = no faction chosen
		1 = Brotherhood
		2 = Minutemen
		3 = Railroad
	}
	GlobalVariable Property MQ206ScientistAtTeleporter Auto const
	{ set to 1 when scientist should travel to teleporter }

	GlobalVariable Property MQ206TeleporterBuildStage Auto const
	{ Tracks stage of building the teleporter - see BuildStageXX variables below:
		0 = haven't started
		1 = building platform 
		2 = talk to scientist
		3 = building rest of teleporter
		4 = powered up
		5 = ready to use
		6 = talked to faction leader
	}

	GlobalVariable Property MQ206BeamEmitterMisaligned Auto const
	{ TRUE when beam emitter isn't directly aligned with platform - used for dialogue condition }

	GlobalVariable Property MQ206ReadyToTeleport Auto const
	{ TRUE when "waiting to teleport" scene is running - used to condition quest target }

	GlobalVariable Property MQ206PlayerNearTeleporter Auto const
	{ TRUE when player is in TeleporterLocation }

endGroup

int BuildStage01_Platform = 1 const
int BuildStage02_Scientist = 2 const
int BuildStage03_All = 3 const
int BuildStage04_Power = 4 const
int BuildStage05_Ready = 5 const
int BuildStage06_FactionLeaderEnd = 6 const

ReferenceAlias property SI_ReflectorPlatform Auto Const
float minPlatformEmitterDistance = 200.0  	; minimum distance allowed between beam emitter and reflector platform (to ensure they're snapped together)

float MinPowerRequired = 26.0  ; minimum power required for teleporter - used to calculate how many power generators you'll need to build when giving out components
float PowerPerGenerator = 10.0  ; how much power does each generator provide

; struct to store data about a Signal Interceptor item
struct SI_Item
	ReferenceAlias itemAlias
	{ alias to put the built item in }

	Keyword itemKeyword
	{ keyword used to identify the item }

	GlobalVariable itemGlobal
	{ set global to 1 when built, set to 0 when destroyed - used to condition recipe }

	int itemObjective = -1
	{ Objective to roll back if this item is cleared }
endStruct

SI_Item[] property SI_Items Auto Const
{ the signal interceptor items - minus the initial item (platform) }

group aliases
	ReferenceAlias property FactionLeader Auto Const
	ReferenceAlias property FactionScientist Auto Const
	ReferenceAlias property FactionNPCEnd Auto Const
	ReferenceAlias property TeleporterMarker Auto Const
	ReferenceAlias property TeleporterTrigger Auto Const
	LocationAlias property TeleporterLocation Auto Const

	ReferenceAlias property SanctuaryWorkshop Auto Const
	ReferenceAlias property BostonAirportWorkshop Auto Const
	ReferenceAlias property MercerStationWorkshop Auto Const
	ReferenceAlias property RRR04Workshop Auto Const
	{ used to get MercerStationWorkshop }

	ReferenceAlias property FactionScientistHomeWorkshop Auto Const
	{ used to put Sturges back (and any other faction scientist who's a workshop actor)}

	; find item dungeon location aliases
	LocationAlias property BeamEmitterLocation Auto Const
	LocationAlias property ConsoleLocation Auto Const
	LocationAlias property RelayDishLocation Auto Const

	ReferenceAlias property BeamEmitterMapMarker Auto Const
	ReferenceAlias property ConsoleMapMarker Auto Const
	ReferenceAlias property RelayDishMapMarker Auto Const

	; Brotherhood NPCs
	ReferenceAlias property ElderMaxson Auto Const
	ReferenceAlias property ProctorIngram Auto Const

	; Railroad NPCs
	ReferenceAlias property TinkerTom Auto Const
	ReferenceAlias property Desdemona Auto Const

	; Minutemen NPCs
	ReferenceAlias property PrestonGarvey Auto Const
	ReferenceAlias property Sturges Auto Const

	ReferenceAlias Property SignalInterceptorPlans Auto
endGroup

Keyword property MQ206ReflectorPlatformKeyword Auto Const
Keyword property MQ206BeamEmitterKeyword Auto Const

ActorValue property MQ206Powered auto const mandatory
ActorValue property MQ206SharedGrid auto const mandatory

group objectiveNumbers
	int property ObjectiveGetHelp = 40 Auto const
	int Property ObjectiveGetPlansBack = 45 Auto const
	int property ObjectiveGetHelpBOS = 50 Auto const
	int property ObjectiveGetHelpMin = 60 Auto const
	int property ObjectiveGetHelpRR = 70 Auto const

	int property ObjectiveTalkToFactionScientist01 = 90 Auto const
	int property ObjectiveBuildReflectorPlatform = 100 Auto const
	int property ObjectiveEstablishFactionBaseRR = 105 Auto const
	int property ObjectiveTalkToFactionScientist02 = 110 Auto const
	int property ObjectiveBuildBeamEmitter = 120 Auto const
	int property ObjectiveBuildRelayDish = 130 Auto const
	int property ObjectiveBuildConsole = 140 Auto const
	int property ObjectiveFindBeamEmitter = 121 Auto const
	int property ObjectiveFindRelayDish = 131 Auto const
	int property ObjectiveFindConsole = 141 Auto const
	int property ObjectivePowerSignalInterceptor = 150 Auto const
	int property ObjectiveTalkToFactionNPCEnd = 200 Auto const
	int property ObjectiveUseSignalInterceptor = 250 Auto const
endGroup

group miscItems
	FormList property MQ206Items auto const
	{ form list for inventory event filter }
	MiscObject property BeamEmitterItem auto const
	MiscObject property RelayDishItem auto const
	MiscObject property ConsoleItem auto const

	LeveledItem property MQ206PlatformItems auto const mandatory
	LeveledItem property MQ206TeleporterItems auto const mandatory
	LeveledItem property MQ206GeneratorItems auto const mandatory
endGroup

MQ00Script Property MQ00 Auto const

Quest Property MQ206OptionalObjectives auto const
{ quest that holds optional objectives for finding items to build teleporter }

Quest Property RRR04 auto const
{ used to check for RR optional objective to PAM }

InputEnableLayer Property EnableLayer Auto
{ used to disable/enable player controls }

;Function to register for custom event when player gets kicked out of faction
Function RegisterForFactionKickout()
	RegisterForCustomEvent(MQ00, "MQFactionKickOut")
EndFunction

;custom event listen to handle the player getting kicked out of a faction
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	Int myFactionNumber = (akArgs[0] as Int)

	;player gets kicked out of the faction they're building the teleporter with
	If GetStageDone(200) == 1
		if myFactionNumber == MQ206TeleporterFaction.GetValueInt()
			;call reset function
			ResetFactionObjectives(myFactionNumber)
		endif
	;player gets kicked out of the Railroad when they need help analyzing the Courser Chip
	ElseIf (myFactionNumber == 3) && (GetStageDone(100) == 0) && (GetStageDone(65) == 0) && (GetStageDone(20) == 1)
		SetStage(65)
	EndIf

	;turn off optional objectives to see faction if you get kicked out of a faction
	If IsObjectiveDisplayed(50) == 1 && myFactionNumber == 1
		SetObjectiveDisplayed(50, abDisplayed=False)
	EndIf

	If IsObjectiveDisplayed(70) == 1 && myFactionNumber == 3
		SetObjectiveDisplayed(70, abDisplayed=False)
	EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    if akSender == Game.GetPlayer()
    	Location theLocation = TeleporterLocation.GetLocation()
    	if theLocation && akNewLoc == theLocation
    		MQ206PlayerNearTeleporter.SetValue(1)
    	else
    		MQ206PlayerNearTeleporter.SetValue(0)
    	endif
    endif
EndEvent

;Function to reset objectives in MQ206 if the player gets kicked out of faction
Function ResetFactionObjectives(int FactionNumber)
	;player is now working with no one
	MQ206TeleporterFaction.SetValueInt(0)
	;scientist leaves building site
	MQ206ScientistAtTeleporter.SetValueInt(0)
	; clear faction aliases
	FactionLeader.Clear()
	FactionScientist.Clear()
	FactionNPCEnd.Clear()

	;hide all the "building" objectives that were in progress
	int i = 0
	while i < WorkshopObjectives.Length
		;make sure there's a short delay between hiding the objective and removing the complete flag or else the objectives get displayed again
		SetObjectiveDisplayed(WorkshopObjectives[i].index, false)
		Utility.Wait(0.1)
		SetObjectiveCompleted(WorkshopObjectives[i].index, false)		
		i+=1
	endWhile

	; stop optional objectives quest
	MQ206OptionalObjectives.Stop()

	; update building stage
	UpdateBuildingStage()
	DisplayGetPlansObjective()
EndFunction

;Function to handle the Signal Interceptor Plans being given to faction
Function GiveSignalInterceptorPlans(Actor akFactionScientist)
	akFactionScientist.AddItem(SignalInterceptorPlans.GetRef())
	RegisterForRemoteEvent(SignalInterceptorPlans.GetRef(), "OnContainerChanged")
EndFunction

;Event for when the player gets the plans back`tgm
Event ObjectReference.OnContainerChanged(ObjectReference akSender, ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akSender == SignalInterceptorPlans.GetRef()
		If akNewContainer == Game.GetPlayer()
			UnRegisterForRemoteEvent(SignalInterceptorPlans.GetRef(), "OnContainerChanged")
			ReDisplayFactionObjectives()
		EndIf
	EndIf
EndEvent

;Tell the player to get the plans, unless he already has them
Function DisplayGetPlansObjective()
	If Game.GetPlayer().GetItemCount(SignalInterceptorPlans.GetRef()) == 1
		UnRegisterForRemoteEvent(SignalInterceptorPlans.GetRef(), "OnContainerChanged")
		ReDisplayFactionObjectives()
	Else
		SetObjectiveDisplayed(ObjectiveGetPlansBack, abForce=True)
	EndIf
EndFunction

;sub-function of ResetFactionObjectives() to redisplay the right objectives
Function ReDisplayFactionObjectives()
	;complete the get plans objective if it's up
	SetObjectiveCompleted(ObjectiveGetPlansBack)
	;show objective to get help building it
	SetObjectiveDisplayed(ObjectiveGetHelp, abForce=True)

	SetObjectiveDisplayed(ObjectiveGetHelpBOS, abDisplayed=(PlayerBoS_KickedOut.GetValueInt()==0), abForce=(PlayerBoS_KickedOut.GetValueInt()==0) ) 
	;show objective to Minutemen always
	SetObjectiveDisplayed(ObjectiveGetHelpMin, abForce=True)
	SetObjectiveDisplayed(ObjectiveGetHelpRR, abDisplayed=(PlayerRailroad_KickedOut.GetValueInt()==0), abForce=(PlayerRailroad_KickedOut.GetValueInt()==0) )
EndFunction

;Function to assign which faction the player is working with to build the Signal Interceptor
Function WorkingWithFaction(int FactionNumber)
	if FactionNumber < MQ00.Faction01_Brotherhood || FactionNumber > MQ00.Faction03_Railroad
		Game.Error(self + " WorkingWithFaction - invalid FactionNumber=" + FactionNumber)
		return
	endif

	debug.trace(self + " WorkingWithFaction " + FactionNumber)

	MQ206TeleporterFaction.SetValueInt(FactionNumber)

	;Brotherhood of Steel branch
	If FactionNumber == MQ00.Faction01_Brotherhood
		;Player is now globally working with the Brotherhood for MQ206

		; update faction aliases
		FactionLeader.ForceRefTo(ElderMaxson.GetRef())
		FactionScientist.ForceRefTo(ProctorIngram.GetRef())
		FactionNPCEnd.ForceRefTo(ElderMaxson.GetRef())

		;update MQ206 objectives, complete faction optional objective and hide others
		SetObjectiveCompleted(ObjectiveGetHelp)
		SetObjectiveCompleted(ObjectiveGetHelpBOS)
		SetObjectiveDisplayed(ObjectiveGetHelpMin, abDisplayed=False)
		SetObjectiveDisplayed(ObjectiveGetHelpRR, abDisplayed=False)

		;player has agreed to build the Signal Interceptor with a faction at least once
		SetStage(300)

	;Minuteman branch
	ElseIf FactionNumber == MQ00.Faction02_Minutemen
		;Player is now globally working with the Minutemen for MQ206

		; update faction aliases
		FactionLeader.ForceRefTo(PrestonGarvey.GetRef())
		FactionScientist.ForceRefTo(Sturges.GetRef())
		FactionNPCEnd.ForceRefTo(Sturges.GetRef())

		;update MQ206 objectives, complete faction optional objective and hide others
		SetObjectiveCompleted(ObjectiveGetHelp)
		SetObjectiveCompleted(ObjectiveGetHelpMin)
		SetObjectiveDisplayed(ObjectiveGetHelpBOS, abDisplayed=False)
		SetObjectiveDisplayed(ObjectiveGetHelpRR, abDisplayed=False)

		;player has agreed to build the Signal Interceptor with a faction at least once
		SetStage(300)

	;Railroad branch
	ElseIf FactionNumber == MQ00.Faction03_Railroad
		;Player is now globally working with the Railroad for MQ206

		; update faction aliases
		FactionLeader.ForceRefTo(Desdemona.GetRef())
		FactionScientist.ForceRefTo(TinkerTom.GetRef())
		FactionNPCEnd.ForceRefTo(Desdemona.GetRef())

		;update MQ206 objectives, complete faction optional objective and hide others
		SetObjectiveCompleted(ObjectiveGetHelp)
		SetObjectiveCompleted(ObjectiveGetHelpRR)
		SetObjectiveDisplayed(ObjectiveGetHelpBOS, abDisplayed=False)
		SetObjectiveDisplayed(ObjectiveGetHelpMin, abDisplayed=False)

		;player has agreed to build the Signal Interceptor with a faction at least once
		SetStage(300)
	EndIf
	; talk to faction scientist
	SetObjectiveDisplayed(ObjectiveTalkToFactionScientist01)
	; register for workshop events (parent script)
	RegisterForWorkshopEvents()	
	debug.trace(self + " WorkingWithFaction DONE")
EndFunction

; called when player gets the "build platform" objective for the first time
Function AddPlatformItems()
	ObjectReference workshopRef
	; which faction?
	int FactionNumber = MQ206TeleporterFaction.GetValue() as int
	if FactionNumber == MQ00.Faction01_Brotherhood
		workshopRef = BostonAirportWorkshop.GetRef()
	elseif FactionNumber == MQ00.Faction02_Minutemen
		workshopRef = SanctuaryWorkshop.GetRef()
	elseif FactionNumber == MQ00.Faction03_Railroad
		workshopRef = MercerStationWorkshop.GetRef()
	EndIf
	if workshopRef
		workshopRef.AddItem(MQ206PlatformItems)
	endif
endFunction

Function AddTeleporterItems()
	ObjectReference workshopRef = Alias_Workshop.GetRef()
	if workshopRef
		workshopRef.AddItem(MQ206TeleporterItems)
		; give enough to build 3 generators even if player already has power
		workshopRef.AddItem(MQ206GeneratorItems, 3)
	endif
endFunction

function AssignFactionScientistToTeleporterWorkshop(bool bAssign)
	; if not a workshop NPC, don't need to do anything
	WorkshopNPCScript workshopScientist = FactionScientist.GetActorRef() as WorkshopNPCScript
	if workshopScientist
		if bAssign
			; make sure assigned to teleporter workshop
			WorkshopScript scientistWorkshop = WorkshopParent.GetWorkshop(workshopScientist.GetWorkshopID())
			WorkshopScript teleporterWorkshop = Alias_Workshop.GetRef() as WorkshopScript
			if scientistWorkshop != teleporterWorkshop
				; assign scientist to teleporter, first save out this workshop
				FactionScientistHomeWorkshop.ForceRefTo(scientistWorkshop)
				WorkshopParent.AddActorToWorkshopPUBLIC(workshopScientist, teleporterWorkshop)
			endif
			; turn off workshop state for the duration
			workshopScientist.SetWorkshopStatus(false)
		else
			; assign back to original workhop
			WorkshopScript scientistWorkshop = WorkshopParent.GetWorkshop(workshopScientist.GetWorkshopID())
			WorkshopScript homeWorkshop = FactionScientistHomeWorkshop.GetRef() as WorkshopScript
			if scientistWorkshop != homeWorkshop && homeWorkshop ; 83587: make sure homeWorkshop exists
				; assign scientist back to home workshop
				WorkshopParent.AddActorToWorkshopPUBLIC(workshopScientist, homeWorkshop)
			endif
			; turn workshop state back on
			workshopScientist.SetWorkshopStatus(true)
			; 83587: if Sturges, make sure allow command/move is turned back on:
			if workshopScientist == Sturges.GetActorRef()
				workshopScientist.SetCommandable(true)
				workshopScientist.SetAllowMove(true)
			endif
		endif
	endif
endFunction

Function BeginBuilding()
	; complete "talk to scientist"
	SetObjectiveCompleted(ObjectiveTalkToFactionScientist01)
	; turn on building platform
	UpdateBuildingStage()
endFunction

Function FinishBuilding()
	debug.trace("FINISH BUILDING!!!!!!")
	; complete "talk to faction NPC at end"
	SetObjectiveCompleted(ObjectiveTalkToFactionNPCEnd)
	; turn on building platform
	UpdateBuildingStage()
endFunction

Function ReadyToTeleport(bool bReady)
	; FAILSAFE: complete "talk to faction NPC at end"
	SetObjectiveCompleted(ObjectiveTalkToFactionNPCEnd)
	; update building stage - more failsafe
	UpdateBuildingStage()
	; for now just set global
	MQ206ReadyToTeleport.SetValueInt(bReady as int)
endFunction

bool updateBuildingStageBusy = false ; set to true if someone is in function
bool updateBuildingStageWaiting = false ; set to true if someone is waiting
function UpdateBuildingStage()
	debug.trace(self + " UpdateBuildingStage: START")

	if updateBuildingStageBusy
		if updateBuildingStageWaiting == false
			updateBuildingStageWaiting = true

			; wait until our turn to go
			int waitCount = 0
			while updateBuildingStageBusy == true && waitCount <= 10
				debug.trace(self + " UpdateBuildingStage busy - waiting... " + waitcount)
				waitcount += 1
				utility.wait(0.5)
			endWhile
			; clear waiting flag
			updateBuildingStageWaiting = false
		else
			; bail - only need 1 waiting thread
			debug.trace(self + " UpdateBuildingStage - already a thread waiting, bail")

			return
		endif
	EndIf

	; lock function
	updateBuildingStageBusy = true

	; disable trigger
	TeleporterTrigger.GetRef().Disable()

	; clear dialogue globals
	MQ206BeamEmitterMisaligned.SetValueInt(0)

	; clear build stage
	if MQ206TeleporterFaction.GetValueInt() == 0
		; can't build until a faction is assigned
		MQ206TeleporterBuildStage.SetValueInt(0)
		debug.trace(self + "	UpdateBuildingStage: no faction - building stage = 0")
		return
	else
		debug.trace(self + "	UpdateBuildingStage: faction chosen: building stage = 1")
		MQ206TeleporterBuildStage.SetValueInt(BuildStage01_Platform)
		SetObjectiveDisplayed(ObjectiveBuildReflectorPlatform)
	endif

	; stage 01:
	; if platform is built - complete objective
	if SI_ReflectorPlatform.GetRef()
		debug.trace(self + "	UpdateBuildingStage: platform built: building stage = 2")
		SetObjectiveCompleted(ObjectiveBuildReflectorPlatform) ; in case we're restarting with a new faction
		MQ206TeleporterBuildStage.SetValueInt(BuildStage02_Scientist)
		SetObjectiveDisplayed(ObjectiveTalkToFactionScientist02)
	else
		; if Railroad, turn on objective to PAM if appropriate
		if MQ206TeleporterFaction.GetValueInt() == MQ00.Faction03_Railroad && RRR04.GetStageDone(100) == false
			SetObjectiveDisplayed(ObjectiveEstablishFactionBaseRR)
		endif
	endif

	; stage 02:
	if MQ206TeleporterBuildStage.GetValueInt() == BuildStage02_Scientist && IsObjectiveCompleted(ObjectiveTalkToFactionScientist02)
		debug.trace(self + "	UpdateBuildingStage: reported to scientist: building stage = 3")
		MQ206TeleporterBuildStage.SetValueInt(BuildStage03_All)
		SetObjectiveDisplayed(ObjectiveBuildConsole)
		SetObjectiveDisplayed(ObjectiveBuildRelayDish)
		SetObjectiveDisplayed(ObjectiveBuildBeamEmitter)
		MQ206ScientistAtTeleporter.SetValueInt(1) ; scientist should travel to building site now
		; make sure scientist is assigned to teleporter workshop if appropriate
		AssignFactionScientistToTeleporterWorkshop(true)
	endif

	; if we're at stage03, check for further progress:
	if MQ206TeleporterBuildStage.GetValueInt() == BuildStage03_All
		int i = 0
		bool bPowered = true
		bool bAllBuilt = true
		ObjectReference testItem  ; use this to check for shared power grid with the other pieces
		debug.trace(self + "		UpdateBuildingStage: checking SI_Items array: " + SI_Items.Length + " items")
		while i < SI_Items.Length
			ObjectReference theItem = SI_Items[i].itemAlias.GetRef()
			debug.trace(self + "		item " + i + "=" + theItem)
			if !theItem
				bAllBuilt = false
				debug.trace(self + "		MISSING ITEM")
			elseif theItem.GetValue(WorkshopParent.PowerRequired) > 0
				; pick a test item that uses power
				if !testItem
					debug.trace(self + " 	picking " + theItem + " as power grid test item")
					testItem = theItem
				endif
				if (CheckPowered(theItem) == false)
					bPowered = false
					debug.trace(self + "		" + theItem +" NOT POWERED")
				elseif CheckSharedGrid(theItem, testItem) == false
					bPowered = false
					debug.trace(self + "		" + theItem +" NOT ON SHARED POWER GRID")
				endif
			endif

			if theItem && theItem.HasKeyword(MQ206BeamEmitterKeyword)
				; check if beam emitter is close enough to platform
				if theItem.GetDistance(SI_ReflectorPlatform.GetRef()) > minPlatformEmitterDistance
					bPowered = false
					MQ206BeamEmitterMisaligned.SetValueInt(1)
					debug.trace(self + "		" + theItem +" TOO FAR FROM REFLECTOR PLATFORM")
				endif
			endif

			i += 1
		endWhile

		; stage 03: is everything built?
		if bAllBuilt
			debug.trace(self + "	UpdateBuildingStage: built everything: building stage = 4")
			; make sure all "build" objectives are completed (could happen if we switch factions partway through building)
			SetObjectiveCompleted(ObjectiveBuildConsole)
			SetObjectiveCompleted(ObjectiveBuildRelayDish)
			SetObjectiveCompleted(ObjectiveBuildBeamEmitter)

			MQ206TeleporterBuildStage.SetValueInt(BuildStage04_Power)
			SetObjectiveDisplayed(ObjectivePowerSignalInterceptor)
		endif

		if bAllBuilt && bPowered
			debug.trace(self + "	UpdateBuildingStage: powered up: building stage = 5")
			;play the one-time music and soundFX
			SetStage(375)
			;set objectives and variables
			SetObjectiveCompleted(ObjectivePowerSignalInterceptor)	; make sure completed (in case switching factions during building)
			MQ206TeleporterBuildStage.SetValueInt(BuildStage05_Ready)
			SetObjectiveCompleted(ObjectivePowerSignalInterceptor)
			SetObjectiveDisplayed(ObjectiveTalkToFactionNPCEnd)
		else
			SetObjectiveCompleted(ObjectivePowerSignalInterceptor, false)	; rollback objective if not powered
		endif

		; stage 06:
		if MQ206TeleporterBuildStage.GetValueInt() == BuildStage05_Ready && IsObjectiveCompleted(ObjectiveTalkToFactionNPCEnd)
			debug.trace(self + "	UpdateBuildingStage: reported to faction leader: building stage = 6")
			MQ206TeleporterBuildStage.SetValueInt(BuildStage06_FactionLeaderEnd)
			SetObjectiveCompleted(ObjectiveTalkToFactionNPCEnd)
			SetObjectiveDisplayed(ObjectiveUseSignalInterceptor)

			;WJS - make sure we always move the teleport trigger to where the platform is currently
			TeleporterMarker.GetRef().MoveTo(SI_ReflectorPlatform.GetRef())
			TeleporterTrigger.GetRef().MoveTo(SI_ReflectorPlatform.GetRef())

			; enable trigger
			TeleporterTrigger.GetRef().Enable()
		endif

		; optional objectives to find build components - only if we are still at Build Stage 3 (meaning all are not built yet):
		if MQ206TeleporterBuildStage.GetValueInt() == BuildStage03_All

			; start optional objectives quest, which fills aliases on MQ206
			MQ206OptionalObjectives.Start()
			; add inventory event filter and register for events
			AddInventoryEventFilter(MQ206Items)
			RegisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")

			; "find item" objectives
			Actor player = Game.GetPlayer()
			ObjectReference workshopRef = Alias_Workshop.GetRef()

			if player.GetItemCount(ConsoleItem) == 0 && workshopRef.GetItemCount(ConsoleItem) == 0 && ConsoleLocation.GetLocation() != NONE
				SetObjectiveDisplayed(ObjectiveFindConsole)
				ConsoleMapMarker.GetRef().AddToMap()
			EndIf
			if player.GetItemCount(RelayDishItem) == 0 && workshopRef.GetItemCount(RelayDishItem) == 0 && RelayDishLocation.GetLocation() != NONE
				SetObjectiveDisplayed(ObjectiveFindRelayDish)
				RelayDishMapMarker.GetRef().AddToMap()
			EndIf
			if player.GetItemCount(BeamEmitterItem) == 0 && workshopRef.GetItemCount(BeamEmitterItem) == 0 && BeamEmitterLocation.GetLocation() != NONE
				SetObjectiveDisplayed(ObjectiveFindBeamEmitter)
				BeamEmitterMapMarker.GetRef().AddToMap()
			EndIf
		endif

	endif

	; unlock function
	updateBuildingStageBusy = false
	debug.trace(self + " UpdateBuildingStage DONE")
endFunction

bool function CheckPowered(ObjectReference objectToCheck)
	bool bIsPowered = false

	if objectToCheck.Is3DLoaded()
		bIsPowered = objectToCheck.IsPowered()
	else
		bIsPowered = objectToCheck.GetValue(MQ206Powered) > 0
	EndIf
	; store out powered state in actor value on object
	objectToCheck.SetValue(MQ206Powered, bIsPowered as int)
	return bIsPowered
endFunction

bool function CheckSharedGrid(ObjectReference objectToCheck, ObjectReference testObject)
	bool bIsShared = false

	if objectToCheck.Is3DLoaded() && testObject.Is3DLoaded()
		bIsShared = testObject.HasSharedPowerGrid(objectToCheck)
	else
		bIsShared = objectToCheck.GetValue(MQ206SharedGrid) > 0
	EndIf
	; store out powered state in actor value on object
	objectToCheck.SetValue(MQ206SharedGrid, bIsShared as int)
	return bIsShared
endFunction

; receive item added events from player
Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akSender == Game.GetPlayer()
		debug.trace(self + " OnItemAdded to player: " + akBaseItem)
		; complete objective if currently displayed
		if akBaseItem == BeamEmitterItem && IsObjectiveDisplayed(ObjectiveFindBeamEmitter) && IsObjectiveCompleted(ObjectiveFindBeamEmitter) == false
			SetObjectiveCompleted(ObjectiveFindBeamEmitter)
		EndIf
		if akBaseItem == RelayDishItem && IsObjectiveDisplayed(ObjectiveFindRelayDish) && IsObjectiveCompleted(ObjectiveFindRelayDish) == false
			SetObjectiveCompleted(ObjectiveFindRelayDish)
		EndIf
		if akBaseItem == ConsoleItem && IsObjectiveDisplayed(ObjectiveFindConsole) && IsObjectiveCompleted(ObjectiveFindConsole) == false
			SetObjectiveCompleted(ObjectiveFindConsole)
		EndIf
		
	endif
EndEvent

;************ WorkshopEventsQuestScript ********************

; override WorkshopEventsQuestScript parent events 
Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WORKSHOP EVENT: WorkshopActorAssignedToWork")
	UpdateObjective(akArgs)		
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WORKSHOP EVENT: WorkshopActorUnassigned")
	UpdateObjective(akArgs)		
EndEvent

Event WorkshopParentScript.WorkshopObjectDestructionStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WORKSHOP EVENT: WorkshopObjectDestructionStageChanged")
	UpdateObjective(akArgs)		
EndEvent

Event WorkshopParentScript.WorkshopObjectRepaired(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WORKSHOP EVENT: WorkshopObjectRepaired")
	UpdateObjective(akArgs)		
EndEvent

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WORKSHOP EVENT: WorkshopObjectPowerStageChanged")
	UpdateObjective(akArgs)		
EndEvent


Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WORKSHOP EVENT: WorkshopObjectBuilt")
	UpdateObjective(akArgs, 1)		
EndEvent

Event WorkshopParentScript.WorkshopObjectMoved(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WORKSHOP EVENT: WorkshopObjectMoved")
	; for now treat same as built - update aliases, move markers, etc.
	UpdateObjective(akArgs)		
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + "WORKSHOP EVENT: WorkshopObjectDestroyed")
	UpdateObjective(akArgs, 2)		
EndEvent

Event ObjectReference.OnWorkshopMode(ObjectReference akSender, bool aStart)
	; update build objective when we exit workshop mode at the build workshop
	if akSender == Alias_Workshop.GetRef() && aStart == false
		UpdateBuildingStage()
	endif
EndEvent

function HandleWorkshopPlayerOwnershipChanged(bool bPlayerOwned)
	debug.trace(self + " HandleWorkshopPlayerOwnershipChanged")
	WorkshopScript workshopRef = Alias_workshop.GetRef() as WorkshopScript

	if workshopRef && workshopRef.OwnedByPlayer == false
		; if current workshop is not player owned, roll back all building objectives (same as if you destroy the platform)
		debug.trace(self + "	current workshop unowned - clear workshop location and uncomplete objective")
		; clear workshop location and platform alias
		Alias_Workshop.Clear()
		SI_ReflectorPlatform.Clear()
		TeleporterLocation.Clear()
		; NOTE: don't move marker here - scientist will stay at current marker until new platform built
		SetObjectiveCompleted(ObjectiveBuildReflectorPlatform, false)
		; unregister for workshop menu event from this workshop
		if workshopRef
			UnregisterForRemoteEvent(workshopRef, "OnWorkshopMode")
		endif

		UpdateBuildingStage()
	EndIf

endFunction


bool updateObjectiveBusy = false ; set to true if someone is in function
bool updateObjectiveWaiting = false ; set to true if someone is waiting

; buildState:
; 0 = state change (moved, powered, etc.)
; 1 = built
; 2 = removed
function UpdateObjective(Var[] akArgs, int buildState = 0)
	debug.trace(self + " UpdateObjective buildState=" + buildState + " updateObjectiveBusy=" + updateObjectiveBusy)
	if (akArgs.Length < 2)
		debug.trace(self + " UpdateObjective - invalid args", 2)
		return
	endif

	if updateObjectiveBusy
		if updateObjectiveWaiting == false
			updateObjectiveWaiting = true

			; wait until our turn to go
			int waitCount = 0
			while updateObjectiveBusy == true && waitCount <= 10
				debug.trace(self + " UpdateObjective busy - waiting... " + waitcount)
				waitcount += 1
				utility.wait(0.5)
			endWhile
			; clear waiting flag
			updateObjectiveWaiting = false
		else
			; bail - only need 1 waiting thread
			debug.trace(self + " UpdateObjective - already a thread waiting, bail")
			return
		endif
	EndIf

	; lock function
	updateObjectiveBusy = true

	WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
	WorkshopScript workshopRef = akArgs[1] as WorkshopScript

	; wait for recalc to finish
	workshopRef.WaitForWorkshopResourceRecalc()

	bool bUpdateBuildingStage = false

	debug.trace(self + " UpdateObjective: newObject=" + newObject + ", workshopRef=" + workshopRef + ", buildState=" + buildState + " updateObjectiveBusy=" + updateObjectiveBusy)

	; check for platform being built or destroyed:
	if newObject && newObject.HasKeyword(MQ206ReflectorPlatformKeyword)
		; workshop location being selected or cleared
		if buildState == 1 && newObject.GetLinkedRef(WorkshopParent.WorkshopItemKeyword) ; MAKE SURE OBJECT STILL EXISTS - if deleted, won't have keyword, so treat as "gone"
			debug.trace(self + "	platform built - set workshop location and complete objective")
			; if new workshop, unregister for events from that location
			WorkshopScript currentWorkshop = Alias_Workshop.GetRef() as WorkshopScript
			if currentWorkshop && currentWorkshop != workshopRef
				UnregisterForRemoteEvent(currentWorkshop, "OnWorkshopMode")
			endif
			; set workshop location
			Alias_Workshop.ForceRefTo(workshopRef)
			; set platform alias
			SI_ReflectorPlatform.ForceRefTo(newObject)
			; move marker and trigger to platform
			TeleporterMarker.GetRef().MoveTo(newObject)
			TeleporterTrigger.GetRef().MoveTo(newObject)
			; get location and set alias
			TeleporterLocation.ForceLocationTo(workshopRef.myLocation)
			; complete objective
			SetObjectiveCompleted(ObjectiveBuildReflectorPlatform)
			; register for workshop menu event
			RegisterForRemoteEvent(workshopRef, "OnWorkshopMode")
			; check if platform is at different workshop than other pieces - if so, clear them

			int j = 0
			while j < SI_Items.Length
				SI_Item theItem = SI_Items[j]
				WorkshopObjectScript itemRef = theItem.itemAlias.GetRef() as WorkshopObjectScript
				if itemRef
					if itemRef.workshopID != workshopRef.GetWorkshopID()
						debug.trace(self + "	" + itemRef + " at different workshop location than platform - clear alias and rollback objective")
						; clear alias, global, and rollback objective
						theItem.itemAlias.Clear()
						theItem.itemGlobal.SetValueInt(0)
						if theItem.itemObjective > -1
							SetObjectiveCompleted(theItem.itemObjective, false)
						endif
					endif
				endif
				j += 1
			endWhile
			bUpdateBuildingStage = true
		elseif buildState == 2
			debug.trace(self + "	platform removed - check if this is the current platform")

			WorkshopObjectScript currentPlatform = SI_ReflectorPlatform.GetRef() as WorkshopObjectScript
			if currentPlatform && currentPlatform == newObject
				debug.trace(self + "	platform removed - clear workshop location and uncomplete objective")
				; clear workshop location and platform alias
				Alias_Workshop.Clear()
				SI_ReflectorPlatform.Clear()
				TeleporterLocation.Clear()
				; NOTE: don't move marker here - scientist will stay at current marker until new platform built
				SetObjectiveCompleted(ObjectiveBuildReflectorPlatform, false)
				; unregister for workshop menu event from this workshop
				if workshopRef
					UnregisterForRemoteEvent(workshopRef, "OnWorkshopMode")
				endif
				bUpdateBuildingStage = true
			endif
		else
			; some kind of state change
			bUpdateBuildingStage = true			
		endif
	endif

	if newObject && workshopRef && workshopRef == Alias_Workshop.GetRef()
		; check for objectives being completed
		int i = 0
		while (i < WorkshopObjectives.Length)
			WorkshopParentScript:WorkshopObjective theObjective = WorkshopObjectives[i]
			if GetStageDone(theObjective.startStage) && !GetStageDone(theObjective.doneStage)
				debug.trace(self + "	valid objective: " + theObjective)
				; check for keywords
				if theObjective.requiredKeyword && newObject.HasKeyword(theObjective.requiredKeyword)
					; find the alias of the item
					int siIndex = -1
					int j = 0
					while j < SI_Items.Length
						if SI_Items[j].itemKeyword == theObjective.requiredKeyword
							debug.trace("	 object " + newObject + " has matching keyword " + theObjective.requiredKeyword)
							siIndex = j
							j = SI_Items.Length
						endif
						j += 1
					endWhile

					if buildState == 1 
						debug.trace(self + "	built - set alias and complete objective")
						; set global
						SI_Items[siIndex].itemGlobal.SetValueInt(1)
						; set the correct alias...
						SI_Items[siIndex].itemAlias.ForceRefTo(newObject)
						; complete the objective
						SetObjectiveCompleted(theObjective.index)
						; also complete "find item" objective - failsafe
						SetObjectiveCompleted(theObjective.index + 1)
						; set ownership to faction scientist
						newObject.AssignActorOwnership(FactionScientist.GetActorRef())
						debug.trace(self + "	actor ref owner=" + newObject.GetActorRefOwner())
					elseif buildState == 2
						debug.trace(self + "	destroyed - clear alias and uncomplete objective")
						; set global
						SI_Items[siIndex].itemGlobal.SetValueInt(0)
						; clear the correct alias...
						SI_Items[siIndex].itemAlias.Clear()
						; uncomplete the objective
						SetObjectiveCompleted(theObjective.index, false)
					endif
					bUpdateBuildingStage = true
				endif
			endif
			i += 1
		endwhile
	endif

	if bUpdateBuildingStage
		debug.trace(self + " UpdateObjective - call UpdateBuildingStage")
		UpdateBuildingStage()
	EndIf

	; unlock this function
	updateObjectiveBusy = false
	debug.trace(self + " UpdateObjective DONE")
endFunction

Function MoveFactionActorToBuildSite(Actor ActorToMove)
	;whenever the scientist/leader unloads, we need to warp him to the Platform in case it's on a navmesh island
	;do this whenever we reach the appropriate building stage (MQ206ScientistAtTeleporter variable)
	;don't do this if the player starts the teleport sequence (Stage 500)
	If (MQ206ScientistAtTeleporter.GetValueInt() == 1) && (GetStageDone(500) == 0)
		;don't move Preston or Elder Maxson since they aren't needed
		If (ActorToMove == ElderMaxson.GetActorRef()) || (ActorToMove == PrestonGarvey.GetActorRef())
			;do nothing
		Else
			ActorToMove.Moveto(SI_ReflectorPlatform.GetRef())
		EndIf
	EndIf
EndFunction

ObjectReference Property SanctuaryLocationCenterMarker Auto Const
ObjectReference Property DesdemonaHomeMarker Auto Const
ObjectReference Property TinkerHomeMarker Auto Const

Function MoveFactionActorsBackHome()
	;when the quest ends, we need to move anyone back that we warped previously in case we warped them on a navmesh island
	If MQ206TeleporterFaction.GetValueInt() == 1
		;Brotherhood of Steel
		;do nothing, there's already a warp inside MQ207 Stage 10
	ElseIf MQ206TeleporterFaction.GetValueInt() == 2
		;Minutemen
		;move to Sanctuary
		Sturges.GetActorRef().Moveto(SanctuaryLocationCenterMarker)
	ElseIf MQ206TeleporterFaction.GetValueInt() == 3
		;Railroad
		;move back to Railroad HQ
		TinkerTom.GetActorRef().MoveTo(DesdemonaHomeMarker)
		Desdemona.GetActorRef().MoveTo(TinkerHomeMarker)
	EndIf
EndFunction