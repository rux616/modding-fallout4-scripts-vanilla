Scriptname DLC04:DLC04RaidSubdueScript extends DLC04:DLC04RaidParentScript Conditional

LocationAlias Property myLocationResTest Auto Const Mandatory
{Alias to check if this spot's location has been reserved}

ReferenceAlias Property WorkshopResTest Auto Const Mandatory
{Alias to check if this workshop is reserved}

LocationAlias Property TeleporterLocation Auto Const Mandatory
{Location alias for MQ206 teleporter (no raids goin' there!)}

ReferenceAlias Property MQ206FactionScientist Auto Const Mandatory
{Alias for the Scientitst NPC in MQ206}

ReferenceAlias Property MQ206FactionLeader Auto Const Mandatory
{Alias for the Leader NPC in MQ206}

ReferenceAlias Property MQ206FactionEndNPC Auto Const Mandatory
{Alias for the Wrap up NPC in MQ206}

Quest Property MQ206 Auto Const Mandatory
{MQ206 quest (used to check for teleporter)}

ReferenceAlias Property SettlementLeader Auto Const Mandatory
{Alias for leader who gets added to settler's ref collection}

RefCollectionAlias Property SettlementChildren Auto Const Mandatory
{Alias collection of settlement children} 

RefCollectionAlias Property Settlers Auto Const Mandatory
{Alias collection of settlers with Boss loc ref type (can also grab enemies)} 

RefCollectionAlias Property SettlementRobots Auto Const Mandatory
{Alias collection of all settlement robots} 

RefCollectionAlias Property SettlementTargets Auto Const Mandatory
{Holding collection for everyone at this location while they're being eval'd} 

RefCollectionAlias Property Defenders Auto Const Mandatory
{Alias collection containing combat functionality for settlers at location} 

RefCollectionAlias Property WorkshopSafetyObjects Auto Const Mandatory
{Alias collection for all the defense objects at the location (turrets, etc.)} 

RefCollectionAlias Property SpawnedDefenders Auto Const Mandatory
{Alias collection containing combat functionality for all spawned defenders} 

RefCollectionAlias Property Disciples Auto Const Mandatory
{Alias collection of Disciple gangers} 

RefCollectionAlias Property Operators Auto Const Mandatory
{Alias collection of Operators gangers} 

RefCollectionAlias Property Zoo Auto Const Mandatory
{Alias collection of Zoo gangers} 

RefCollectionAlias Property PermanentActors Auto Const Mandatory
{Alias collection of permanent workshop actors on WorkshopPermanentActor script} 

ReferenceAlias Property DiscipleSpokesperson Auto Const Mandatory
{Alias for Disciples spokesperson}

ReferenceAlias Property OperatorSpokesperson Auto Const Mandatory
{Alias for Operator spokesperson}

ReferenceAlias Property ZooSpokesperson Auto Const Mandatory
{Alias for Zoo spokesperson}

RefCollectionAlias Property Attackers Auto Const Mandatory
{Alias collection for attacking Raiders} 

RefCollectionAlias Property MercDefenders Auto Const Mandatory
{Alias collection for defending mercs} 

RefCollectionAlias Property MinutemenDefenders Auto Const Mandatory
{Alias collection for defending Minutemen} 

ReferenceAlias Property RaiderSpokesperson Auto Const Mandatory
{Alias for spokesperson Raider}

ReferenceAlias Property SettlerSpokesperson Auto Const Mandatory
{Alias for spokesperson Settler}

ReferenceAlias Property EdgeMarker Auto Const Mandatory
{Alias for settlement Edge Marker}

Quest Property MinutemenCentralQuest Auto Const Mandatory
{Quest used to check which defenders we should be spawning in}

Faction Property HasBeenCompanionFaction Auto Const Mandatory
{Faction used to check if anyone at the settlement is a companion}

Faction Property CurrentCompanionFaction Auto Const Mandatory
{Faction used to check if anyone at the settlement is the player's current companion}

Faction Property MinutemenFaction Auto Const Mandatory
{Minutemen faction}

Faction Property DLC04RaidWipeOutNPCFaction Auto Const Mandatory
{Defender NPC faction}

bool Property bEssentialNPCPresent = false Auto Conditional
{Boolean to shut down quest if there are essential NPCs present}

bool Property bCompanionPresent = false Auto Conditional
{Boolean to shut down quest if there are essential NPCs present}

bool Property bNoGangChosen = false Auto Conditional
{Boolean to shut down quest if player didn't choose a gang}

bool Property bNoDefenders = false Auto Conditional
{Boolean to handle if there are no settlement defenders at this location}

bool Property bLocationRequiresUnlock = false Auto Conditional
{Boolean to handle if this location requires player unlock (so don't start quest)}

bool Property bNoPopulation = false Auto Conditional
{Boolean to handle if this location has no population (so don't start quest)}

bool Property bTeleporterPresent = false Auto Conditional
{Boolean to handle if this location has the MQ206 teleporter (so don't start quest)}

bool Property bWorkshopReserved = false Auto Conditional
{Boolean to handle if this workshop is reserved (so don't start quest)}

bool Property bLocationPlayerOwned = false Auto Conditional
{Boolean to handle if this location is player owned (so we can offer the player the choice of another spot)}

bool Property bLocationApproved = false Auto Conditional
{Bool used to determine if player has approved attack on this location (so they don't have to go through the approve attack scene multiple times)}

bool Property bProcessingStartup = false Auto Conditional
{Boolean to prevent quest from proceeding until start up is completed}

bool Property bStartUpComplete = false Auto Conditional
{Boolean to know if all start up has been completed. Want to let the quest finish starting up before shutting it down}

bool Property bCallforShutdown = false Auto Conditional
{Boolean to shut down quest if invalid targets are present}

bool Property bMinutemenDefender = false Auto Conditional
{Boolean to track if Minutemen are local defenders}

int Property iTotalDefenders = 0 Auto Conditional
{int to track how many defenders there are total at this location}

ReferenceAlias Property MQ04RaiderSpokesperson Auto Const Mandatory
{Reference alias for the spokesperson we hand off to MQ04 once a location is claimed}

RefCollectionAlias Property ToBeDeletedNPCs Auto Const Mandatory
{Ref collection to handle cleaning up attackers once this is finished}

float Property iFailSafeTimerLength = 15.0 Auto Const
{How long bleedout failsafe timer should wait between checks}

float Property iSceneFailSafeTimerLength = 15.0 Auto Const
{How long scene failsafe timer should wait between checks}

Message Property DLC04RaidSubdueSettlementSpokespersonUnavailable Auto Const Mandatory
{Message informing player that settlement spokesperson has become unavailable}

;Local vars
bool bChoseGangOnce = false
bool bHasPreventedRecovery = false
bool bProcessingBleedOut = false
bool bAnyEssentialDefendersPresent = false
int iFailsafeTimerID = 4 const
int iSceneFailSafeTimerID = 5 const
int iStartUpFailSafeTimerID = 6 const
Actor LoneEssentialNPC = none

Event OnQuestInit()
	debug.trace("DLC04 Subdue: Quest init'ed.")

	;Set var to begin processing start up.
	bProcessingStartup = true

	;Check to see if the player has progressed the Minutemen sufficently to spawn in Minutemen defenders
	if MinutemenCentralQuest.GetStageDone(200)
		bMinutemenDefender = true
	endif
EndEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
; aiValue1: 1 = Disciples
;			2 = Operators
;			3 = Zoo Gang
	debug.trace(self + " OnStoryScript: akLocation=" + akLocation + " aiValue1=" + aiValue1)

	if !bChoseGangOnce
		bChoseGangOnce = true

		if aiValue1 > 0
			;Set the gang index
			iChosenGang = aiValue1

			;Set the current raid index
			iCurrentRaidIndex = 4

			;Get the start-up running
			Startup()
		else
			;Fail safe. If player has not specified what gang they're going to use, shut down quest now
			bNoGangChosen = true
			TriggerShutdown()
		endif
	endif
EndEvent

Event Location.OnLocationLoaded(Location akSender)
	if akSender == myLocation.GetLocation()
		;If player hasn't already finished fight...
		if !GetStageDone(95) && !GetStageDone(850)
			;Make the local ownership faction enemies of the player
			fcSettlementFaction.SetPlayerEnemy()

			;Add any new pop to the defenders collection
			AddPopulationResourceToDefenders(Defenders)

			;Add any new pop to Settlement targets collection
			AddPopulationResourceToDefenders(SettlementTargets)

			;Now mark "No Bleedout Recovery" on that group (if the quest hasn't already been marked to fail)
			if !GetStageDone(850) && !GetStageDone(1000)
				ToggleDefenderNoBleedOutRecovery(true)

				;#101206 - Check the settlement defenders for essential.
				;If none of them are essential after being added to the defenders alias, save them one
				;out and mark them essential
				if !bAnyEssentialDefendersPresent && LoneEssentialNPC == none
					CheckRefCollectionForEssentialNPCs(Defenders)
				endif
			endif

			;Check to see if settlement targets number if below threshold for triggering the defenders reduce stage
			if SettlementTargets.GetCount() < DLC04RaidDefenderQTThreshold.GetValue()
				SetStage(60)
			endif

			;Make local turrets foes
			MakeSafetyResourceHostile(WorkshopSafetyObjects, fcSettlementFaction)

			;And teleport any far off defenders back home
			MoveDistantRefsToMarker(SettlementTargets, EdgeMarker.GetRef())

			;If the local enemies are minutemen, make that faction the enemy of the player
			if bMinutemenDefender
				MinutemenFaction.SetPlayerEnemy()
			endif
		endif

	endif
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == iFailsafeTimerID
		if !GetStageDone(70) 
			;If all the defenders are in bleedout, set the appropriate stage. Otherwise, restart the timer.
			if AllDefendersBleedingOut(Defenders)
				SetStage(70)
			else
				StartFailSafeTimer()

				;If the proper objective stage has yet to be set...
				if !GetStageDone(60)
					;Check how many NPCs are in the "Defender" collection
					;And how many of those defenders are bleeding out
					int iDefendersCount = 0
					int iBleedoutCount = 0

					iDefendersCount = Defenders.GetCount()
					debug.trace("DLC04 Subdue: Checking defender numbers. Defenders count: " + iDefendersCount)
					iBleedoutCount = GetNumBleedoutInCollection(Defenders)
					debug.trace("DLC04 Subdue: Checking defender bleedout numbers. Bleedout count: " + iBleedoutCount)

					debug.trace("DLC04 Subdue: How many NPCs left not bleeding out: " + (iDefendersCount - iBleedoutCount))

					;If there are two or fewer in there who aren't bleeding out
					;Mark the correct objective stage on the quest
					if iDefendersCount - iBleedoutCount <= 2
						debug.trace("DLC04 Subdue: Enough NPCs bleedout out. Set stage! ")
						SetStage(60)
					endif
				endif
			endif
		endif
	elseif aiTimerID == iSceneFailSafeTimerID
		;If the quest isn't already wrapping up or failed
		if !GetStageDone(100) && !GetStageDone(850)
			;If the settler spokesperson has become disabled
			;Go ahead and start timer to wrap up quest
			if SettlerSpokesperson.GetActorRef().IsDisabled()
				ObjectReference WorkshopRef = Workshop.GetRef()
				SetStage(100)
			else
				StartSceneFailSafeTimer()
			endif
		endif
	elseif aiTimerID == iStartUpFailSafeTimerID
		;If the location has not yet been approved
		if !bLocationApproved && !GetStageDone(760)
			debug.trace("DLC04 Raid Subdue: Start-up failsafe timer. Location still not approved.")

			CheckStartUpFailSafe()

			;If the location still isn't approved, start timer again
			StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
		endif
	endif
EndEvent

Function Startup()
	;Check player ownership, unlock status to ensure the quests' okay to start here
	ObjectReference WorkshopRef = Workshop.GetRef()
	WorkshopScript myShop = (WorkshopRef as WorkshopScript)

	debug.trace("DLC04 Subdue: Eval'ing settlement.")
	if MQ206.IsRunning()
		;Check to see if we're targeting the teleporter location. If so, shut it down.
		Location TargetLoc = myLocation.GetLocation()

		if TargetLoc == TeleporterLocation.GetLocation() || MQ206FactionLeader.GetRef().IsInLocation(TargetLoc) || MQ206FactionScientist.GetRef().IsInLocation(TargetLoc) || MQ206FactionEndNPC.GetRef().IsInLocation(TargetLoc)
			debug.trace("DLC04 Subdue: Targeting teleport location. Shut it down. Location:" + TargetLoc)
			bTeleporterPresent = true
			TriggerShutdown()
			return
		endif
	endif

	;If the workshop or its location are reserved, shut quest down and let player know
	if WorkshopResTest.GetRef() == none || myLocationResTest.GetLocation() == none
		debug.trace("DLC04 Chase Off: This workshop is reserved. Shut down. Location:" + Workshop)
		bWorkshopReserved = true
		TriggerShutdown()
		return

	elseif WorkshopRef.getBaseValue(WorkshopRatingPopulation) <= 0
		;No population. Let's call it a day.
		debug.trace("DLC04 Subdue: No population. Can't target this spot.")
		bNoPopulation = true
		TriggerShutdown()
		return
	else
		if WorkshopRef.GetValue(WorkshopParent.WorkshopPlayerLostControl) > 0
			debug.trace("DLC04 Subdue: Player lost control of this settlement at some point. Ok to proceed.")
			;If the player has lost control of this location, then we're good to proceed

		else 
			if myShop.OwnedByPlayer == 1
				debug.trace("DLC04 Subdue: Player owns this location. Ok to proceed.")
				bLocationPlayerOwned = true
				;If the player owns this place, we're good
			else
				if !myShop.EnableAutomaticPlayerOwnership 
					debug.trace("DLC04 Subdue: Player does not own this location and it requires unlock. STOP!")
					;If the player doesn't own this location and it requires unlock to proceed,
					;shut this thang down
					bLocationRequiresUnlock = true
					TriggerShutdown()
					return
				endif
			endif
		endif 
	endif
	;Get all "targets" in target collection
	debug.trace("DLC04 Subdue: Eval'ing settlers.")
	if SettlementLeader.GetRef() != none
		debug.trace("DLC04 Subdue: Adding settlement leader.")
		SettlementTargets.AddRef(SettlementLeader.GetRef())
	endif

	if SettlementRobots.GetCount() > 0
		debug.trace("DLC04 Subdue: Adding settlement robots.")
		; first get rid of non-valid actors (bad loc ref type data)
		VerifyRefCollection(SettlementRobots)
		SettlementTargets.AddRefCollection(SettlementRobots)
	endif

	if Settlers.GetCount() > 0
		debug.trace("DLC04 Subdue: Adding settlers.")
		; first get rid of non-valid actors (bad loc ref type data)
		VerifyRefCollection(Settlers)
		SettlementTargets.AddRefCollection(Settlers)
	endif

	;Run through permanent actors list and ensure none of them are at this location
	if PermanentActors.GetCount() > 0
		debug.trace("DLC04 Subdue: Eval'ing permanent workshop actors.")

		int i = 0
		int iCount = PermanentActors.GetCount()
		int iTargetWorkshopID = (Workshop.GetRef() as WorkshopScript).GetWorkshopID()

		while i < iCount
			Actor act = (PermanentActors.GetAt(i) as Actor)
			debug.trace("DLC04 Subdue: Checking permanent actor location: " + act)
			int iActorWorkshopID = (act as WorkshopNPCScript).GetWorkshopID()

			if iActorWorkshopID == iTargetWorkshopID
				debug.trace("DLC04 Subdue: Adding permanent actors to location list: " + act)
				SettlementTargets.AddRef(Act)
			endif
			i += 1
		endwhile
	endif

	;Check to see if we have any disqualifying NPCs at this location
	int i = 0
	int iCount = SettlementTargets.GetCount()

	Faction DLC01WorkshopRobotFaction = DLC04WorkshopParent.DLC01WorkshopRobotFaction
	ActorBase DLC01Ada = DLC04WorkshopParent.DLC01Ada

	if iCount == 0 && WorkshopRef.getBaseValue(WorkshopRatingPopulation) <= 0
		debug.trace("DLC04 Subdue: No defenders present at location.")
		bNoDefenders = true
	else
		;Otherwise, check everyone who is there and mark sure there's not some other reason for us to shut the quest down
		while i < iCount
			Actor act = (SettlementTargets.GetAt(i) as Actor)
			debug.trace("DLC04 Subdue: Checking for essential NPCs/companions. Checking: " + act)

			if act.IsInFaction(HasBeenCompanionFaction)
				if DLC01WorkshopRobotFaction == NONE || act.IsInFaction(DLC01WorkshopRobotFaction) == false
					debug.trace("DLC04 Subdue: Found companion: " + act)
					bCompanionPresent = true
				else
					; is this Ada?
					if DLC01Ada && act.GetActorBase() == DLC01Ada
						debug.trace("DLC04 Subdue: Found companion: " + act)
						bCompanionPresent = true
					else 
						debug.trace("DLC04 Subdue: Found DLC01 robot : " + act + " - ignoring")
					endif
				endif
			endif

			;If there are either essential NPCs or Companions present, shut this down
			if bCompanionPresent
				TriggerShutdown()
				return
			endif

			i += 1
		EndWhile

	endif

	bProcessingStartup = false

	;Processing complete. Start up shut down timer
	StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
	debug.trace("DLC04 Raid Subdue: Start-up failsafe timer on!")

	;If nothing's prevented this from starting, begin next hunk of set up
	if !bCallforShutdown
		;Get the workshop ownership faction for this location
		fcSettlementFaction = (Workshop.GetRef() as WorkshopScript).SettlementOwnershipFaction
		debug.trace("DLC04 Subdue: Settlement ownership faction nabbed: " + fcSettlementFaction)

		;Check player ownership of location to see if we should throw ownership scene
		if bLocationPlayerOwned == false
			if myShop.OwnedByPlayer == false
				SetUpRaid()
			else
				bLocationPlayerOwned = true
			endif
		endif
	endif
EndFunction

Function SetUpRaid()
	if !bCallforShutdown
		debug.trace("DLC04 Subdue: Set up attack. Chosen Gang: " + iChosenGang)

		;Mark this location as approved
		bLocationApproved = true

		;Add map marker and block fast travel to it
		ToggleMapMarkerFastTravel(true)

		;Register player for On Location Changed Event
		debug.trace("DLC04 Subdue: Registering location for location loaded.")
		RegisterForRemoteEvent(myLocation.GetLocation(), "OnLocationLoaded")

		;If MQ04 is still active, set var that we've started an attack quest
		if DLC04MQ04.IsRunning()
			(DLC04MQ04 as DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(true)
		endif

		;Set up gangs and clean out unused gang aliases
		if iChosenGang == 1
			SetUpAttackers(DiscipleSpokesperson, Disciples, Operators, Zoo)
		elseif iChosenGang == 2
			SetUpAttackers(OperatorSpokesperson, Operators, Disciples, Zoo)
		elseif iChosenGang == 3
			SetUpAttackers(ZooSpokesperson, Zoo, Disciples, Operators)
		endif

		;Only activate defenders if there are settlers here to defend and the location isn't hostile
		if !bMinutemenDefender
			SetUpDefenders(MercDefenders, SpawnedDefenders, fcSettlementFaction, true, true)
			SetUpDefenders(MinutemenDefenders, SpawnedDefenders, fcSettlementFaction, false, false)
		else
			SetUpDefenders(MercDefenders, SpawnedDefenders, fcSettlementFaction, false, false)
			SetUpDefenders(MinutemenDefenders, SpawnedDefenders, fcSettlementFaction, true, false)
		endif

		;Now add everyone in the "Settlement Targets" ref collection into the Defenders collection
		;#98361 - Unlike the wipe out quest, we want to keep folks in both, as we use Settlement Targets to readd 
		;bleedout recovery.
		Defenders.AddRefCollection(SettlementTargets)

		;Add any additional pop to defenders/settlement targets
		AddPopulationResourceToDefenders(Defenders)
		AddPopulationResourceToDefenders(SettlementTargets)

		;Check to see if we need to add Arlen Glass of the Slog
		CheckAddArlenGlassToNPCCollections(Defenders, SettlementTargets)

		;Check to see if location is loaded. If so, and settlement targets count is low enough, throw obj stage
		if myLocation.GetLocation().IsLoaded()
			if SettlementTargets.GetCount() < DLC04RaidDefenderQTThreshold.GetValue()
				SetStage(60)
			endif
		endif

		;Make any Safety resources nearby hostile
		MakeSafetyResourceHostile(WorkshopSafetyObjects, fcSettlementFaction)

		;Start up processing is complete
		bStartUpComplete = true

		;Finish set up if we haven't already failed the quest
		if !GetStageDone(850)
			ToggleDefenderNoBleedOutRecovery(true)

			;#101206 - Check the settlement defenders for essential.
			;If none of them are essential after being added to the defenders alias, save them one
			;out and mark them essential
			if !bAnyEssentialDefendersPresent && LoneEssentialNPC == none
				CheckRefCollectionForEssentialNPCs(Defenders)
			endif

			;Mark this quest active if this quest hasn't already been failed
			if !GetStageDone(1000)
				bRaidActive = true
			endif

			;Everyone's set up. Let's get this party started. Point player towards spokesperson
			debug.trace("DLC04 Subdue: Set up complete. Throw objectives!")
			SetStage(20)
		else
			;Otherwise, shut her down
			SubdueFailShutdown()
		endif
	endif
EndFunction

Function SetUpAttackers(ReferenceAlias aiSpokesperson, RefCollectionAlias aiAttackers, \
	RefCollectionAlias aiToDelete01, RefCollectionAlias aiToDelete02)
	;Set up Raider spokesperson
	ObjectReference obj = aiSpokesperson.GetRef()

	obj.Enable()
	RaiderSpokesperson.ForceRefTo(obj)
	Attackers.AddRef(obj)

	;Enable appropriate collection, delete other two
	SetupAttackersRefColl(aiAttackers, true)
	SetupAttackersRefColl(aiToDelete01, false)
	SetupAttackersRefColl(aiToDelete02, false)

	;If the quest hasn't failed, mark the attackers to Ignore Friendly Hits
	if !GetStageDone(1000)
		debug.trace("DLC04 Raid Subdue: Toggle Ignore Friendly Hits on: " + aiAttackers)
		ToggleIgnoreFriendlyHitsOnRefColl(Attackers, true)
	endif

	;Clean up unused spokespeople
	if iChosenGang == 1
		CleanupGangSpokepersonAliases(2)
		CleanupGangSpokepersonAliases(3)
	elseif iChosenGang == 2
		CleanupGangSpokepersonAliases(1)
		CleanupGangSpokepersonAliases(3)
	elseif iChosenGang == 3
		CleanupGangSpokepersonAliases(1)
		CleanupGangSpokepersonAliases(2)
	endif
EndFunction

Function UnstartedQuestCleanUp()
	;Quest wasn't able to start. Clear out all ref collections

	CleanUpRefCollection(Disciples)
	CleanUpRefCollection(Operators)
	CleanUpRefCollection(Zoo)
	CleanUpRefCollection(MercDefenders)
	CleanUpRefCollection(MinutemenDefenders)

	;Shut it down!
	SetStage(1000)

EndFunction

Function CleanupGangSpokepersonAliases(int iGangIndex)
	;Clean up the aliases of the given gang
	if iGangIndex == 1
		DiscipleSpokesperson.GetRef().Delete()
		DiscipleSpokesperson.Clear()
	elseif iGangIndex == 2
		OperatorSpokesperson.GetRef().Delete()
		OperatorSpokesperson.Clear()
	elseif iGangIndex == 3
		ZooSpokesperson.GetRef().Delete()
		ZooSpokesperson.Clear()
	endif
EndFunction

Function SetupAttackersRefColl(RefCollectionAlias aiCollection, bool bInitialize)
		int i = 0
		int iCount = aiCollection.GetCount()

		while i < iCount
			;If the player chose this gang, enable them now and add them to attackers collection. Otherwise, delete
			if bInitialize
				ObjectReference Obj = aiCollection.GetAt(i)
				Obj.Enable()
				Attackers.AddRef(Obj)
				debug.trace("DLC04 Subdue: Setting up attacker: " + Obj)
			else
				debug.trace("DLC04 Subdue: Deleting attacker: " + i)
				aiCollection.GetAt(i).Delete()
			endif

			i += 1
		endwhile 

	;If we're deleting folks, clear the collection when finished
	if !bInitialize
		aiCollection.RemoveAll()
	endif
EndFunction

Function TriggerShutdown()
	;Delete all spawned NPCs and mark up all the vars for shutdown
	SetStage(750)
	bCallforShutdown = true
	bProcessingStartup = false

	StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
	debug.trace("DLC04 Raid Subdue: Start-up failsafe timer on!")
EndFunction

Function AddPopulationResourceToDefenders(RefCollectionAlias aiRefCollection)
	;debug.trace("DLC04 Raid Subdue: Attempting to add defenders to ref collections.")
	;This function grabs all the population at a given workshop and adds it to the defenders collection (if loaded)
	if myLocation.getLocation().IsLoaded()
		;When this location loads in, get all the population in this area again in case anyone's showed up
		ObjectReference WorkshopRef = Workshop.GetRef()
		ObjectReference[] NewRefs = WorkshopRef.GetWorkshopResourceObjects(WorkshopRatingPopulation)
		;debug.trace("DLC04 Raid Subdue: Nabbed all the new local populace. Get them in the right ref collections.")

		if NewRefs != none
			int i = 0
			int iCount = NewRefs.Length
			;debug.trace("DLC04 Raid Subdue: Number of new refs to be added: " + iCount)

			;Loop through everyone we got, confirm they're at the proper workshop, and add them to the defenders collection
			while i < iCount
				Actor currentRef = (NewRefs[i] as Actor)
				debug.trace("DLC04 Raid Subdue: Checking actor " + currentRef)
				if currentRef.GetLinkedRef(WorkshopItemKeyword) == WorkshopRef && !currentRef.IsChild() && !currentRef.IsBleedingOut() && !currentRef.IsDead() && !currentRef.IsDisabled()
					debug.trace("DLC04 Raid Subdue: Adding actor " + currentRef + " to collection " + aiRefCollection)
					aiRefCollection.AddRef(NewRefs[i])
				endif
				i += 1
			endwhile
		endif
	endif

	;Now, update the total numer of defenders
	iTotalDefenders = aiRefCollection.GetCount() + SpawnedDefenders.GetCount()
	debug.trace("DLC04 Raid Subdue: Total defenders = " + iTotalDefenders + " in collection: " + aiRefCollection)

EndFunction

Function ToggleDefenderNoBleedOutRecovery(bool bPreventRecovery)
	
	while bProcessingBleedOut
		Utility.Wait(1.0)
	endwhile
		bProcessingBleedOut = true

		int i = 0
		int iCount = SettlementTargets.GetCount()

		while (i < iCount)
			Actor act = SettlementTargets.GetAt(i) as Actor

			act.SetNoBleedoutRecovery(bPreventRecovery)
			i += 1
		endwhile

	bProcessingBleedOut = false
EndFunction

Function HaltSubdueCombat()
	;Stop combat alarm on everyone involved in this 
	fcSettlementFaction.SetPlayerEnemy(false)
	StopCombatAlarmOnRefColl(Attackers)
	StopCombatAlarmOnRefColl(Defenders)
	StopCombatAlarmOnRefColl(SettlementTargets)
	StopCombatAlarmOnRefColl(SettlementRobots)
	StopCombatAlarmOnRefColl(SettlementChildren)
	Game.GetPlayer().StopCombatAlarm()
	StopCombatAlarmOnRefColl(SpawnedDefenders)
EndFunction

Function StopCombatAlarmOnRefColl(RefCollectionAlias aiRefCollection)
	;Roll through ref collection and call "stop combat alarm" on everyone in it
	int i = 0
	int iCount = aiRefCollection.GetCount()

	while (i < iCount)
		Actor act = (aiRefCollection.GetAt(i) as Actor)
		act.StopCombatAlarm()
		i += 1
	endwhile
EndFunction

Function AddAttackerRaidersToDeletionColl()
	;Move all the attackers into the "To Be Deleted" ref collection on the wrap up quest
	ToBeDeletedNPCs.AddRefCollection(Attackers)
EndFunction

Function SubdueFailShutdown()
	;If start up has completed, make sure that everyone's bleed out recovery is turned back on
	if bStartUpComplete
		ToggleDefenderNoBleedOutRecovery(false)
	endif

	SetStage(1000)
EndFunction

Function StartFailSafeTimer()
	if !GetStageDone(70)
		debug.trace("DLC04 Raid Subdue: Starting bleedout failsafe timer.")
		StartTimer(iFailSafeTimerLength, iFailsafeTimerID)
	endif
EndFunction

Function StartSceneFailSafeTimer()
	if !GetStageDone(100) && !GetStageDone(850)
		debug.trace("DLC04 Raid Subdue: Starting scene failsafe timer.")
		StartTimer(iSceneFailSafeTimerLength, iSceneFailSafeTimerID)
	endif	
EndFunction

Function CheckRefCollectionForEssentialNPCs(RefCollectionAlias aiCollection)
	;Roll through all the NPCs in a ref collection
	;If they are all unessential, pick one to make essential so the quest can finish

	int i = 0
	int iCount = aiCollection.GetCount()

	while i < iCount && !bAnyEssentialDefendersPresent
		Actor act = aiCollection.GetAt(i) as Actor

		if act.IsEssential()
			bAnyEssentialDefendersPresent = true
		endif

		i += 1
	endwhile

	;If there are no essential NPCs in the ref collection, loop through it until
	;we find one and add them to the LoneEssential NPC actor var
	if !bAnyEssentialDefendersPresent
		i = 0

		while (i < iCount) && LoneEssentialNPC == none
			Actor act = aiCollection.GetAt(i) as Actor

			if act != none
				LoneEssentialNPC = act
				LoneEssentialNPC.SetEssential(true)
			endif

			i += 1
		endwhile
	endif
EndFunction

Function ClearLoneEssentialNPC()
	;This function is used to clear out the Lone Essential NPC is there is one
	;And set them back to being unessential
	if LoneEssentialNPC != none
		if LoneEssentialNPC.IsEssential()
			LoneEssentialNPC.SetEssential(false)
		endif
		LoneEssentialNPC = none
	endif
EndFunction

