Scriptname DLC04:DLC04RaidWipeOutScript extends DLC04:DLC04RaidParentScript Conditional

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
{Alias collection that actually handles all the combat functionality for these quests} 

RefCollectionAlias Property WorkshopSafetyObjects Auto Const Mandatory
{Alias collection for all the defense objects at the location (turrets, etc.)} 

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

ReferenceAlias Property EdgeMarker Auto Const Mandatory
{Alias for settlement Edge marker}

Quest Property MinutemenCentralQuest Auto Const Mandatory
{Quest used to check which defenders we should be spawning in}

Keyword Property WorkshopType02Vassal Auto Const Mandatory
{Workshop vassal keyword}

Faction Property HasBeenCompanionFaction Auto Const Mandatory
{Faction used to check if anyone at the settlement is a companion}

Faction Property CurrentCompanionFaction Auto Const Mandatory
{Faction used to check if anyone at the settlement is the player's current companion}

Faction Property MinutemenFaction Auto Const Mandatory
{Minutemen faction}

bool Property bEssentialNPCPresent = false Auto Conditional
{Boolean to shut down quest if there are essential NPCs present}

bool Property bCompanionPresent = false Auto Conditional
{Boolean to shut down quest if there are essential NPCs present}

bool Property bNoGangChosen = false Auto Conditional
{Boolean to shut down quest if player didn't choose a gang}

bool Property bNoDefenders = false Auto Conditional
{Boolean to handle if there are no settlement defenders at this location}

bool Property bLocationHostile = false Auto Conditional
{Boolean to handle if this location is hostile to the player (so don't spawn in defenders)}

bool Property bLocationRequiresUnlock = false Auto Conditional
{Boolean to handle if this location requires player unlock (so don't start quest)}

bool Property bTeleporterPresent = false Auto Conditional
{Boolean to handle if this location has the MQ206 teleporter (so don't start quest)}

bool Property bWorkshopReserved = false Auto Conditional
{Boolean to handle if this workshop is reserved (so don't start quest)}

bool Property bLocationPlayerOwned = false Auto Conditional
{Boolean to handle if this location is player owned (so we can offer the player the choice of another spot)}

bool Property bLocationPlayerVassal = false Auto Conditional
{Boolean to handle if this location is a player vassal (so we can offer the player the choice of another spot)}

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

int property BuildFlagStage = 105 auto const 
{ stage to set when player builds raider flag }

RefCollectionAlias Property ToBeDeletedNPCs Auto Const Mandatory
{Ref collection to handle cleaning up attackers if quest is failed}

ActorBase Property DLC04WorkshopDisciple Auto Const Mandatory
{Used to spawn in actor at end of quest if necessary}

ActorBase Property DLC04WorkshopOperator Auto Const Mandatory
{Used to spawn in actor at end of quest if necessary}

ActorBase Property DLC04WorkshopPack Auto Const Mandatory
{Used to spawn in actor at end of quest if necessary}

ReferenceAlias[] Property SpawnMarkers Auto Const Mandatory
{Possible spawn locations for spawned in raider}

ReferenceAlias Property SettlementAttackMarker Auto Const Mandatory
{Settlement attack marker. Used as fallback for spawning NPC}

float Property iFailSafeTimerLength = 15.0 Auto Const
{How long failsafe timer should wait between checks}

;Local vars
bool bChoseGangOnce = false
int iFailsafeTimerID = 2 const
int iStartUpFailSafeTimerID = 3 const

Event OnQuestInit()
	debug.trace("DLC04 Wipe Out: Quest init'ed.")

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
			iCurrentRaidIndex = 2

			;Get this thang started
			Startup()
		else
			;Fail safe. If player has not specified what gang they're going to use, shut down quest now
			bNoGangChosen = true
			TriggerShutdown()
		endif
	endif
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == iFailsafeTimerID
		if !GetStageDone(100) 
			;If all the defenders are dead, set the appropriate stage. Otherwise, restart the timer.
			if AllDefendersDead(Defenders)
				SetStage(100)
			else
				StartFailSafeTimer()
			endif
		endif
	elseif aiTimerID == iStartUpFailSafeTimerID
		;If the location has not yet been approved
		if !bLocationApproved && !GetStageDone(760)
			debug.trace("DLC04 Raid Wipe Out: Start-up failsafe timer. Location still not approved.")

			CheckStartUpFailSafe()

			;If the location still isn't approved, start timer again
			StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
		endif
	endif
EndEvent

Event Location.OnLocationLoaded(Location akSender)
	debug.trace("DLC04 Wipe Out: Location loaded event go!")

	if akSender == myLocation.GetLocation()
		debug.trace("DLC04 Wipe Out: Target location loaded.")
		;If the player hasn't already finished the fight...
		if !GetStageDone(100)
			;Make the local ownership faction enemies of the player if the quest hasn't yet finished
			fcSettlementFaction.SetPlayerEnemy()
			debug.trace("DLC04 Wipe Out: Make local ownership faction enemies.")

			if bMinutemenDefender
				MinutemenFaction.SetPlayerEnemy()
			endif

			;Add any new pop to the defenders collections
			AddPopulationResourceToDefenders(Defenders)
			AddPopulationResourceToDefenders(SettlementTargets)

			;Check to see if settlement targets number if below threshold for triggering the defenders reduce stage
			if Defenders.GetCount() < DLC04RaidDefenderQTThreshold.GetValue()
				SetStage(60)
			endif

			MakeSafetyResourceHostile(WorkshopSafetyObjects, fcSettlementFaction)

			;And teleport any far off defenders back home
			MoveDistantRefsToMarker(Defenders, EdgeMarker.GetRef())
		endif
	endif
EndEvent

Function Startup()
	;Check player ownership, unlock status to ensure the quests' okay to start here
	ObjectReference WorkshopRef = Workshop.GetRef()
	WorkshopScript myShop = (WorkshopRef as WorkshopScript)

	debug.trace("DLC04 Wipe Out: Eval'ing settlement.")
	if MQ206.IsRunning()
		;Check to see if we're targeting the teleporter location. If so, shut it down.
		Location TargetLoc = myLocation.GetLocation()

		if TargetLoc == TeleporterLocation.GetLocation() || MQ206FactionLeader.GetRef().IsInLocation(TargetLoc) || MQ206FactionScientist.GetRef().IsInLocation(TargetLoc) || MQ206FactionEndNPC.GetRef().IsInLocation(TargetLoc)
			debug.trace("DLC04 Wipe Out: Targeting teleport location. Shut it down. Location:" + TargetLoc)
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

	elseif WorkshopRef.GetValue(WorkshopParent.WorkshopPlayerLostControl) > 0
		debug.trace("DLC04 Wipe Out: Player lost control of this settlement at some point. Ok to proceed.")
		;If the player has lost control of this location, then we're good to proceed

	else 

		if myShop.OwnedByPlayer == 1
			debug.trace("DLC04 Wipe Out: Player owns this location. Ok to proceed.")
			bLocationPlayerOwned = true
			;If the player owns this place, we're good
		else
			if !myShop.EnableAutomaticPlayerOwnership 
				debug.trace("DLC04 Wipe Out: Player does not own this location and it requires unlock. STOP!")
				;If the player doesn't own this location and it requires unlock to proceed,
				;shut this thang down
				bLocationRequiresUnlock = true
				TriggerShutdown()
				return
			elseif workshopRef.GetValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingPopulation].resourceValue) as int <= 0
				debug.trace("DLC04 Wipe Out: Player does not own this location but it has enemies. Don't spawn defenders.")
				;If this location starts hostile, don't spawn in any defenders
				bLocationHostile = true
			endif
		endif

	endif 

	;Get all "targets" in target collection
	debug.trace("DLC04 Wipe Out: Eval'ing settlers.")
	if SettlementLeader.GetRef() != none
		debug.trace("DLC04 Wipe Out: Adding settlement leader.")
		SettlementTargets.AddRef(SettlementLeader.GetRef())
	endif

	if SettlementRobots.GetCount() > 0
		debug.trace("DLC04 Wipe Out: Adding settlement robots.")
		; first get rid of non-valid actors (bad loc ref type data)
		VerifyRefCollection(SettlementRobots)
		SettlementTargets.AddRefCollection(SettlementRobots)
	endif

	if Settlers.GetCount() > 0
		debug.trace("DLC04 Wipe Out: Adding settlers.")
		; first get rid of non-valid actors (bad loc ref type data)
		VerifyRefCollection(Settlers)
		SettlementTargets.AddRefCollection(Settlers)
	endif

	;Run through permanent actors list and ensure none of them are at this location
	if PermanentActors.GetCount() > 0
		debug.trace("DLC04 Wipe Out: Eval'ing permanent workshop actors.")

		int i = 0
		int iCount = PermanentActors.GetCount()
		int iTargetWorkshopID = (Workshop.GetRef() as WorkshopScript).GetWorkshopID()

		while i < iCount
			Actor act = (PermanentActors.GetAt(i) as Actor)
			debug.trace("DLC04 Wipe Out: Checking permanent actor location: " + act)
			int iActorWorkshopID = (act as WorkshopNPCScript).GetWorkshopID()

			if iActorWorkshopID == iTargetWorkshopID
				debug.trace("DLC04 Wipe Out: Adding permanent actors to location list: " + act)
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
		debug.trace("DLC04 Wipe Out: No defenders present at location.")
		bNoDefenders = true
	else
		;Otherwise, check everyone who is there and mark sure there's not some other reason for us to shut the quest down
		while i < iCount
			Actor act = (SettlementTargets.GetAt(i) as Actor)
			debug.trace("DLC04 Wipe Out: Checking for essential NPCs/companions. Checking: " + act)

			if act.IsEssential() && act.IsInFaction(HasBeenCompanionFaction) == 0
				debug.trace("DLC04 Wipe Out: Found essential NPC: " + act)
				bEssentialNPCPresent = true
			endif

			if act.IsInFaction(HasBeenCompanionFaction)
				if DLC01WorkshopRobotFaction == NONE || act.IsInFaction(DLC01WorkshopRobotFaction) == false
					debug.trace("DLC04 Wipe Out: Found companion: " + act)
					bCompanionPresent = true
				else
					; is this Ada?
					if DLC01Ada && act.GetActorBase() == DLC01Ada
						debug.trace("DLC04 Wipe Out: Found companion: " + act)
						bCompanionPresent = true
					else 
						debug.trace("DLC04 Wipe Out: Found DLC01 robot : " + act + " - ignoring")
					endif
				endif
			endif

			;If there are either essential NPCs or Companions present, shut this down
			if bEssentialNPCPresent || bCompanionPresent
				TriggerShutdown()
				return
			endif

			i += 1
		EndWhile

	endif

	bProcessingStartup = false

	;Processing complete. Start up shut down timer
	StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
	debug.trace("DLC04 Raid Wipe Out: Start-up failsafe timer on!")

	;If nothing's prevented this from starting, begin next hunk of set up
	if !bCallforShutdown
		;Get the workshop ownership faction for this location
		fcSettlementFaction = (Workshop.GetRef() as WorkshopScript).SettlementOwnershipFaction

		;Check player ownership of location or vassal state to see if we should throw ownership scene
		if bLocationPlayerOwned == false && bLocationPlayerVassal == false
			if myShop.OwnedByPlayer == true
				bLocationPlayerOwned = true			
			elseif myShop.myLocation.GetKeywordData(WorkshopType02Vassal) > 0
				bLocationPlayerVassal = true
			else
				SetUpRaid()
			endif
		endif
	endif
EndFunction

Function SetUpRaid()
	if !bCallforShutdown
		debug.trace("DLC04 Wipe Out: Set up attack. Chosen Gang: " + iChosenGang)

		;Mark this location as approved
		bLocationApproved = true

		;Add map marker and block fast travel to it
		ToggleMapMarkerFastTravel(true)

		;Register location for On Location Loaded Event
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
		if !bNoDefenders && !bLocationHostile
			if !bMinutemenDefender
				SetUpDefenders(MercDefenders, Defenders, fcSettlementFaction, true, true)
				SetUpDefenders(MinutemenDefenders, Defenders, fcSettlementFaction, false, false)
			else
				SetUpDefenders(MercDefenders, Defenders, fcSettlementFaction, false, false)
				SetUpDefenders(MinutemenDefenders, Defenders, fcSettlementFaction, true, false)
			endif
		else
			;No settlers present or location hostile. Delete everyone
			CleanUpRefCollection(MercDefenders)
			CleanUpRefCollection(MinutemenDefenders)
		endif

		;Now move everyone from the "Settlement Targets" ref collection into the Defenders collection
		Defenders.AddRefCollection(SettlementTargets)
		
		;Add any additional pop to defenders
		AddPopulationResourceToDefenders(Defenders)
		AddPopulationResourceToDefenders(SettlementTargets)

		;Check to see if we need to add Arlen Glass of the Slog
		CheckAddArlenGlassToNPCCollections(Defenders, SettlementTargets)

		;Check to see if location is loaded. If so, and defender count is low enough, throw obj stage
		if myLocation.GetLocation().IsLoaded()
			if Defenders.GetCount() < DLC04RaidDefenderQTThreshold.GetValue()
				SetStage(60)
			endif
		endif

		;Make local turrets hostile
		MakeSafetyResourceHostile(WorkshopSafetyObjects, fcSettlementFaction)

		;Let quest know that start up is complete
		bStartUpComplete = true

		;If the quest hasn't been failed, start up. Otherwise, shut down.
		if !GetStageDone(850)
			;Mark this quest active if this quest hasn't already been failed
			if !GetStageDone(1000)
				bRaidActive = true
			endif

			debug.trace("DLC04 Wipe Out: Set up complete. Throw objectives!")
			SetStage(20)
		else 
			WipeOutFailShutdown()
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
		debug.trace("DLC04 Raid Wipe Out: Toggle Ignore Friendly Hits on: " + aiAttackers)
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

Function ToggleDefenderProtected(bool bSetProtected)
	int i = 0
	int iCount = Defenders.GetCount()

	while i < iCount
		Actor act = Defenders.GetAt(i) as Actor
		ActorBase AB = act.GetActorBase()
		debug.trace("DLC04 Wipe Out: Processing protected NPC: " + act)

		if bSetProtected
			;#96830 - TO ADD - This needs to be more exact. Only certain NPCs should be returned to protected (not the defenders, but the settlers, robots, leader, etc.)			
		else
			if AB.IsProtected()
				debug.trace("DLC04 Wipe Out: Removing protection from: " + act)
				AB.SetProtected(false)
			endif
		endif
		i += 1
	endwhile
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
				debug.trace("DLC04 Wipe Out: Setting up attacker: " + Obj)
			else
				debug.trace("DLC04 Wipe Out: Deleting attacker: " + i)
				aiCollection.GetAt(i).Delete()
			endif

			i += 1
		endwhile 

	;If we're deleting folks, clear the collection when finished
	if !bInitialize
		aiCollection.RemoveAll()
	endif
EndFunction

Function AssignRaidersToWorkshop()
	;clear player enemy status of the local ownership faction
	fcSettlementFaction.SetPlayerEnemy(false)

	;Assign any living Raiders to workshop or spawn in a couple new ones
	bool bLivingRaiders = false
	int i = 0
	int iCount = Attackers.GetCount()
	WorkshopScript workshopRef = Workshop.GetRef() as WorkshopScript

	while i < iCount
		Actor act = Attackers.GetAt(i) as Actor
		WorkshopNPCScript wrkShp = Attackers.GetAt(i) as WorkshopNPCScript
		debug.trace("DLC04 Wipe Out: Eval'ins Raiders for workshop assignment: " + act)

		if !act.IsDead() 
			debug.trace("DLC04 Wipe Out: Adding Raiders to workshop: " + wrkShp)
			DLC04WorkshopParent.AddRaiderToWorkshop(wrkShp, workshopRef)

			;Mark that one of the Raiders remains
			if !bLivingRaiders
				bLivingRaiders = true
			endif
		endif
		i += 1
	endwhile

	if !bLivingRaiders

		;If there are no living raiders, spawn a new Raider and assign them to the workshop
		Actor SpawnedRaider = SpawnRaiderSettler(iChosenGang)
		WorkshopNPCScript wrkShp = SpawnedRaider as WorkshopNPCScript
		DLC04WorkshopParent.AddRaiderToWorkshop(wrkShp, workshopRef)
	endif

EndFunction

Function TriggerShutdown()
	;Delete all spawned NPCs and mark up all the vars for shutdown
	SetStage(750)
	bCallforShutdown = true
	bProcessingStartup = false

	;Processing complete. Start up shut down timer
	StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
	debug.trace("DLC04 Raid Wipe Out: Start-up failsafe timer on!")
EndFunction

Function AddPopulationResourceToDefenders(RefCollectionAlias aiRefCollection)
	;This function grabs all the population at a given workshop and adds it to the defenders collection (if loaded)
	if myLocation.getLocation().IsLoaded()
		;When this location loads in, get all the population in this area again in case anyone's showed up
		ObjectReference WorkshopRef = Workshop.GetRef()
		ObjectReference[] NewRefs = WorkshopRef.GetWorkshopResourceObjects(WorkshopRatingPopulation)

		if NewRefs != none
			int i = 0
			int iCount = NewRefs.Length

			;Loop through everyone we got, confirm they're at the proper workshop, and add them to the defenders collection
			while i < iCount
				Actor currentRef = (NewRefs[i] as Actor)
				debug.trace("DLC04 Raid Wipe Out: Checking actor " + currentRef)
				if currentRef.GetLinkedRef(WorkshopItemKeyword) == WorkshopRef && !currentRef.IsChild() && !currentRef.IsDead() && !currentRef.IsDisabled() && !currentRef.IsEssential()
					debug.trace("DLC04 Raid Wipe Out: Adding actor " + currentRef + " to collection " + aiRefCollection)
					aiRefCollection.AddRef(NewRefs[i])
				endif
				i += 1
			endwhile
		endif
	endif

	;Now update the total defenders count
	iTotalDefenders = aiRefCollection.GetCount()
	debug.trace("DLC04 Raid Wipeout: Total defenders = " + iTotalDefenders + " in collection: " + aiRefCollection)

EndFunction

bool Function GetLivingRaiderForMQ04()
	if DLC04MQ04.IsRunning()
		int i = 0
		int iCount = Attackers.GetCount()

		while i < iCount
			ObjectReference obj = Attackers.GetAt(i)
			debug.trace("DLC04 Wipe Out: Evaluating MQ04 Raiderspokesperson: " + obj)

			if !(obj as Actor).IsDead()
				debug.trace("DLC04 Wipe Out: Raiderspokesperson chosen: " + obj)
				MQ04RaiderSpokesperson.ForceRefTo(obj)
				return true
			endif

			i += 1
		endwhile
	endif

	;If we didn't get a raider, let the game know
	return false
EndFunction

; track building flag
function StartFlagTracking(bool bStart = true)
	WorkshopScript workshopRef = Workshop.GetRef() as WorkshopScript
	if bStart
		; check actor value right here
		if workshopRef.GetValue(DLC04WorkshopParent.DLC04WorkshopRatingRaiderFlag) > 0
			SetStage(BuildFlagStage)
		else 
			; otherwise, watch for it to be built
			RegisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
		endif
	else 
		UnregisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
	endif
endFunction

Event ObjectReference.OnWorkshopObjectPlaced(ObjectReference akSource, ObjectReference akReference)
	; check if this is a totem
	if akReference is DLC04:WorkshopRaiderBeaconScript
		SetStage(BuildFlagStage)
		StartFlagTracking(false)
	endif
endEvent

;Function to add Raiders to ref collection to be deleted on unload 
;if they haven't already been assigned to workshop
Function WipeOutFailShutdown()
	if bStartUpComplete && !GetStageDone(100)
		ToBeDeletedNPCs.AddRefCollection(Attackers)
	endif

	SetStage(1000)
EndFunction

Actor Function SpawnRaiderSettler(int iGangValue)
	int i = 0
	int iCount = SpawnMarkers.Length
	ObjectReference ValidMarker
	Actor SpawnedActor
	bool bFoundMarker = false

	;Find a spawn marker
	while i < iCount && !bFoundMarker
		ObjectReference obj = SpawnMarkers[i].GetRef()
		Actor PlayerRef = Game.GetPlayer()

		if !PlayerRef.HasDirectLOS(obj) && !PlayerRef.HasDetectionLOS(obj)
			bFoundMarker = true
			ValidMarker = obj
		endif

		i += 1
	endwhile

	;If no marker was found, use the settlement attack marker as fall back
	if !bFoundMarker
		ValidMarker = SettlementAttackMarker.GetRef()
	endif

	;Now spawn our new NPC
	if iGangValue == 1
		SpawnedActor = ValidMarker.PlaceActorAtMe(DLC04WorkshopDisciple, 1, Workshop.GetRef().GetEncounterZone())
	elseif iGangValue == 2
		SpawnedActor = ValidMarker.PlaceActorAtMe(DLC04WorkshopOperator, 1, Workshop.GetRef().GetEncounterZone())
	elseif iGangValue == 3
		SpawnedActor = ValidMarker.PlaceActorAtMe(DLC04WorkshopPack, 1, Workshop.GetRef().GetEncounterZone())
	endif

	return SpawnedActor
EndFunction

Function StartFailSafeTimer()
	if !GetStageDone(100)
		debug.trace("DLC04 Raid Wipe Out: Starting failsafe timer.")
		StartTimer(iFailSafeTimerLength, iFailsafeTimerID)
	endif
EndFunction

Function CheckRaiderWorkshopAssignment(RefCollectionAlias aiCollection)
	int i = 0
	int iCount = aiCollection.GetCount()
	WorkshopScript WorkshopRef = Workshop.GetRef() as WorkshopScript
	int iTargetWorkshopID = (WorkshopRef as WorkshopScript).GetWorkshopID()

	while i < iCount
		Actor act = aiCollection.GetAt(i) as Actor

		;If this guy isn't dead...
		if !act.IsDead()
			;Check the workshop ID of this NPC...
			WorkshopNPCScript wrkShp = aiCollection.GetAt(i) as WorkshopNPCScript
			int iActorWorkshopID = wrkShp.GetWorkshopID()
			debug.trace("DLC04 Wipe Out: Adding Raiders to workshop: " + wrkShp + ". Workshop ID: " + iActorWorkshopID)

			;If this NPC's not currently assigned to this location, do it now
			if iActorWorkshopID != iTargetWorkshopID
				DLC04WorkshopParent.AddRaiderToWorkshop(wrkShp, WorkshopRef)
			endif
		endif

		i += 1
	EndWhile
EndFunction