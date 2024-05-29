Scriptname DLC04:DLC04RaidChaseOffScript extends DLC04:DLC04RaidParentScript Conditional

LocationAlias Property myLocationResTest Auto Const Mandatory
{Alias to check if this spot's location has been reserved}

ReferenceAlias Property WorkshopResTest Auto Const Mandatory
{Alias to check if this workshop is reserved}

ReferenceAlias Property NearbyRaiderWorkshop Auto Const Mandatory
{Reference to a Raider workshop without a radio beacon (used as an objective)}

LocationAlias Property NearbyRaiderSettlement Auto Const Mandatory
{Reference to a Raider workshop location without a radio beacon (used as an objective)}

LocationAlias Property MQ04InitialRaiderSettlementLocation Auto Const Mandatory
{Alias to hold player's first raider settlement location}

ReferenceAlias Property MQ04InitialRaiderSettlement Auto Const Mandatory
{Alias to hold player's first raider settlement workshop}

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

RefCollectionAlias Property Disciples Auto Const Mandatory
{Alias collection of Disciple gangers} 

RefCollectionAlias Property Operators Auto Const Mandatory
{Alias collection of Operators gangers} 

RefCollectionAlias Property Zoo Auto Const Mandatory
{Alias collection of Zoo gangers} 

RefCollectionAlias Property PermanentActors Auto Const Mandatory
{Alias collection of permanent workshop actors on WorkshopPermanentActor script} 

RefCollectionAlias Property Attackers Auto Const Mandatory
{Alias collection for attacking Raiders} 

RefCollectionAlias Property ChasedOffNPCs Auto Const Mandatory
{Ref collection on ChaseOffDisable quest that successfully cleared off NPCs are shoved into}

Faction Property HasBeenCompanionFaction Auto Const Mandatory
{Faction used to check if anyone at the settlement is a companion}

Faction Property CurrentCompanionFaction Auto Const Mandatory
{Faction used to check if anyone at the settlement is the player's current companion}

Faction Property DLC04RaidWipeOutNPCFaction Auto Const Mandatory
{Defender NPC faction}

Keyword Property WorkshopType02Vassal Auto Const Mandatory
{Workshop vassal keyword}

bool Property bEssentialNPCPresent = false Auto Conditional
{Boolean to shut down quest if there are essential NPCs present at target settlement}

bool Property bCompanionPresent = false Auto Conditional
{Boolean to shut down quest if there are companion NPCs present at target settlement}

bool Property bNoGangChosen = false Auto Conditional
{Boolean to shut down quest if player didn't choose a gang}

bool Property bNoPopulation = false Auto Conditional
{Boolean to handle if there are no settlers at target location}

bool Property bLocationRequiresUnlock = false Auto Conditional
{Boolean to handle if this location requires player unlock (so don't start quest)}

bool Property bTeleporterPresent = false Auto Conditional
{Boolean to handle if this location has the MQ206 teleporter (so don't start quest)}

bool Property bWorkshopReserved = false Auto Conditional
{Boolean to handle if this workshop is reserved (so don't start quest)}

bool Property bNoSpokesperson = false Auto Conditional
{Boolean to handle if this location has no spokesperson (so don't start quest)}

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

bool Property bRaiderSettlersEnabled = false Auto Conditional
{Bool to know if the Raider settlers for this location have been enabled}

bool Property bCallforShutdown = false Auto Conditional
{Boolean to shut down quest if invalid targets are present}

bool Property bOutpostWithoutBeacon = false Auto Conditional
{Boolean to manage if there's an outpost without a beacon nearby}

GlobalVariable Property DLC04OperatorsToolsConversationComplete Auto Const Mandatory
{Used to watch if the player has already completed the tools conversation with Lizzie}

ReferenceAlias Property MQ04RaiderSpokesperson Auto Const Mandatory
{Reference alias for the spokesperson we hand off to MQ04 once a location is claimed}

int property BuildFlagStage = 105 auto const 
{ stage to set when player builds raider flag }

RefCollectionAlias Property ToBeDeletedNPCs Auto Const Mandatory
{Ref collection to handle cleaning up attackers if quest is failed}

RefCollectionAlias Property WorkshopSafetyObjects Auto Const Mandatory
{Ref collection to grab local turrets}

GlobalVariable Property DLC04MQ04FirstOutpostHadPopulation Auto Const Mandatory
{Global used to know if the player's first settlement had population (change up some lines from Shank)}

Quest Property DLC04MQ04TutorialQuest Auto Const Mandatory
{DLC04 tutorial quest}

int Property iFailSafeTimerLength = 15 Auto Const
{Length of failsafe timer (check to make sure spokeperson hasn't become disabled)}

Message Property DLC04RaidChaseOffSettlementSpokespersonUnavailable Auto Const Mandatory
{Message to inform player settlement spokesperson has gone missing}

;Local vars
bool bChoseGangOnce = false
int iFailSafeID = 1 const
int iStartUpFailSafeTimerID = 2 const

Event OnQuestInit()
	debug.trace("DLC04 Chase Off: Quest init'ed.")

	;Set var to begin processing start up.
	bProcessingStartup = true
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
			;Set the gang value for the quest
			iChosenGang = aiValue1

			;Set the current raid index
			iCurrentRaidIndex = 1

			;Run the start up
			Startup()
		else
			;Fail safe. If player has not specified what gang they're going to use, shut down quest now
			bNoGangChosen = true
			TriggerShutdown()
		endif
	endif
EndEvent

Function Startup()
	;Check player ownership, unlock status to ensure the quests' okay to start here
	ObjectReference WorkshopRef = Workshop.GetRef()
	WorkshopScript myShop = (WorkshopRef as WorkshopScript)

	debug.trace("DLC04 Chase Off: Eval'ing settlement.")

	if MQ206.IsRunning()
		;Check to see if we're targeting the teleporter location. If so, shut it down.
		Location TargetLoc = myLocation.GetLocation()

		if TargetLoc == TeleporterLocation.GetLocation() || MQ206FactionLeader.GetRef().IsInLocation(TargetLoc) || MQ206FactionScientist.GetRef().IsInLocation(TargetLoc) || MQ206FactionEndNPC.GetRef().IsInLocation(TargetLoc)
			debug.trace("DLC04 Chase Off: Targeting teleport location. Shut it down. Location:" + TargetLoc)
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

	;If this place has no settlment spokesperson, shut it down
	elseif SettlementSpokesperson.GetRef() == none
		debug.trace("DLC04 Chase Off: No spokesperson available. Location:" + Workshop)
		bNoSpokesperson = true
		TriggerShutdown()
		return

	elseif WorkshopRef.getBaseValue(WorkshopRatingPopulation) <= 0
		;No population. Let's call it a day.
		bNoPopulation = true
		TriggerShutdown()
		return

	else

		if WorkshopRef.GetValue(WorkshopParent.WorkshopPlayerLostControl) > 0
			debug.trace("DLC04 Chase Off: Player lost control of this settlement at some point. Ok to proceed.")
			;If the player has lost control of this location, then we're good to proceed

		else 
			if myShop.OwnedByPlayer == 1
				debug.trace("DLC04 Chase Off: Player owns this location. Ok to proceed.")
				bLocationPlayerOwned = true
				;If the player owns this place, we're good
			else
				if !myShop.EnableAutomaticPlayerOwnership 
					debug.trace("DLC04 Chase Off: Player does not own this location and it requires unlock. STOP!")
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
	debug.trace("DLC04 Chase Off: Eval'ing settlers.")
	if SettlementLeader.GetRef() != none
		debug.trace("DLC04 Chase Off: Adding settlement leader.")
		SettlementTargets.AddRef(SettlementLeader.GetRef())
	endif

	if SettlementRobots.GetCount() > 0
		debug.trace("DLC04 Chase Off: Adding settlement robots.")
		; first get rid of non-valid actors (bad loc ref type data)
		VerifyRefCollection(SettlementRobots)
		SettlementTargets.AddRefCollection(SettlementRobots)
	endif

	if Settlers.GetCount() > 0
		debug.trace("DLC04 Chase Off: Adding settlers.")
		; first get rid of non-valid actors (bad loc ref type data)
		VerifyRefCollection(Settlers)
		SettlementTargets.AddRefCollection(Settlers)
	endif

	;Run through permanent actors list and ensure none of them are at this location
	if PermanentActors.GetCount() > 0
		debug.trace("DLC04 Chase Off: Eval'ing permanent workshop actors.")

		int i = 0
		int iCount = PermanentActors.GetCount()
		int iTargetWorkshopID = (Workshop.GetRef() as WorkshopScript).GetWorkshopID()

		while i < iCount
			Actor act = (PermanentActors.GetAt(i) as Actor)
			debug.trace("DLC04 Chase Off: Checking permanent actor location: " + act)
			int iActorWorkshopID = (act as WorkshopNPCScript).GetWorkshopID()

			if iActorWorkshopID == iTargetWorkshopID
				debug.trace("DLC04 Chase Off: Adding permanent actors to settlement targets: " + act)
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

	;Otherwise, check everyone who is there and mark sure there's not some other reason for us to shut the quest down
	while i < iCount
		Actor act = (SettlementTargets.GetAt(i) as Actor)
		debug.trace("DLC04 Chase Off: Checking for essential NPCs/companions. Checking: " + act)

		if act.IsEssential() && act.IsInFaction(HasBeenCompanionFaction) == 0
			debug.trace("DLC04 Chase Off: Found essential NPC: " + act)
			bEssentialNPCPresent = true
		endif

		if act.IsInFaction(HasBeenCompanionFaction)
			if DLC01WorkshopRobotFaction == NONE || act.IsInFaction(DLC01WorkshopRobotFaction) == false
				debug.trace("DLC04 Chase Off: Found companion: " + act)
				bCompanionPresent = true
			else
				; is this Ada?
				if DLC01Ada && act.GetActorBase() == DLC01Ada
					debug.trace("DLC04 Chase Off: Found companion: " + act)
					bCompanionPresent = true
				else 
					debug.trace("DLC04 Chase Off: Found DLC01 robot : " + act + " - ignoring")
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

	;Mark bool to let quest know if there's a beacon nearby
	if CheckForNearbyRaiderBeacons() == false
		ObjectReference RaiderOutpost = GetNearbyOutpostWithoutBeacons()

		if RaiderOutpost != none
			bOutpostWithoutBeacon = true
			NearbyRaiderWorkshop.ForceRefTo(RaiderOutpost)
			NearbyRaiderSettlement.ForceLocationTo(RaiderOutpost.GetCurrentLocation())
		endif
	endif

	bProcessingStartup = false

	;Processing complete. Start up shut down timer
	StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
	debug.trace("DLC04 Raid Chase Off: Start-up failsafe timer on!")

	;If nothing's prevented this from starting, begin next hunk of set up
	if !bCallforShutdown

		;Check player ownership of location  or vassal state to see if we should throw ownership scene
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

Event Location.OnLocationLoaded(Location akSender)
	if akSender == myLocation.GetLocation()
		;Add any new pop to the defenders collection
		if !GetStageDone(100) && !GetStageDone(850) && !GetStageDone(860)
			AddPopulationResourceToDefenders(SettlementTargets)
		endif
	endif
EndEvent

Function SetUpRaid()
	if !bCallforShutdown

		;Mark this location as approved
		bLocationApproved = true

		;Register location for On Location Loaded Event
		RegisterForRemoteEvent(myLocation.GetLocation(), "OnLocationLoaded")

		;Get the Raider Settlement Count var set
		iRaiderSettlementCount = NearbyRaiderWorkshops.GetCount()

		;If MQ04 is still active, set var that we've started an attack quest
		if DLC04MQ04.IsRunning()
			(DLC04MQ04 as DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(true)
		endif

		;Get everyone in the area into the Settlers collection (needed in case DLC folks are here)
		AddPopulationResourceToDefenders(SettlementTargets)

		;Check to see if we need to add Arlen Glass of the Slog
		CheckAddArlenGlassToNPCCollections(SettlementTargets)

		;Set all the intimdation values locally
		SetIntimidationValues()

		;Start up completed
		bStartUpComplete = true

		;If quest hasn't failed...
		if !GetStageDone(850)

			;Attempt to teleport spokesperson to home
			TryToSendHome(SettlementSpokesperson.GetActorRef())

			;Mark this quest active if this quest hasn't already been failed
			;And start its failsafe timer
			if !GetStageDone(860) && !GetStageDone(1000)
				bRaidActive = true
				StartTimer(iFailSafeTimerLength, iFailSafeID)
			endif

			;Let's get this party started. Point player towards target to convince
			debug.trace("DLC04 Chase Off: Set up complete. Throw objectives!")
			SetStage(20)

			;Check to see if we should throw additional objectives
			if DLC04OperatorsToolsConversationComplete.GetValue() > 0
				SetStage(21)
			endif
		else
			;Otherwise, shut it down
			ChaseOffFailShutdown()
		endif 
	endif
EndFunction

Function WrapUpQuest()
	;Let system know we don't care about additional intimidation system messages
	bIntimidationResolved = true

	;Remove all settlers as local population
	debug.trace("DLC04 Chase Off: Begin wrap up sequence.")

	int i = 0
	int iCount = SettlementTargets.GetCount()

	while i < iCount
		Actor act = (SettlementTargets.GetAt(i) as Actor)
		WorkshopNPCScript wNPC = act as WorkshopNPCScript

		;Remove actor from workshop
		WorkshopParent.RemoveActorFromWorkshopPUBLIC(wNPC)

		i += 1
	EndWhile

	;Kill Arlen's scene if he's active
	if bArlenGlassActive
		DN154_Arlen_000_WorkingLoop.Stop()
	endif

	;Add all the settlers to the chase off quest ref collection
	ChasedOffNPCs.AddRefCollection(SettlementTargets)
	ChasedOffNPCs.EvaluateAll()

	debug.trace("DLC04 Chase Off: Get new raiders settlers set up. Chosen Gang: " + iChosenGang)

	;Prevent this location from being lost due to unhappiness events
	WorkshopScript workshopRef = Workshop.GetRef() as WorkshopScript

	;Give player new workshop location
	(DLC04WorkshopParent as DLC04:DLC04WorkshopParentScript).SetRaiderSettlement(Workshop.GetRef() as WorkshopScript, iChosenGang)

	;Set up gangs and clean out unused gang aliases
	if iChosenGang == 1
		SetUpRaiderSettlers(Disciples, Operators, Zoo)
	elseif iChosenGang == 2
		SetUpRaiderSettlers(Operators, Disciples, Zoo)
	elseif iChosenGang == 3
		SetUpRaiderSettlers(Zoo, Disciples, Operators)
	endif

	;Assign any living Raiders to workshop or spawn in a couple new ones
	i = 0
	iCount = Attackers.GetCount()

	while i < iCount
		Actor act = Attackers.GetAt(i) as Actor
		WorkshopNPCScript wrkShp = Attackers.GetAt(i) as WorkshopNPCScript
		debug.trace("DLC04 Chase Off: Eval'ins Raiders for workshop assignment: " + act)

		if !act.IsDead() 
			debug.trace("DLC04 Chase Off: Adding Raiders to workshop: " + wrkShp)
			DLC04WorkshopParent.AddRaiderToWorkshop(wrkShp, workshopRef)
		endif
		i += 1
	endwhile

	;Get all the safety objects at this location and add them to the gang's crime faction
	MakeSafetyResourceHostile(WorkshopSafetyObjects, none, false)
	AssignFactionToSafetyObjects(WorkshopSafetyObjects, none)

	;Show "Clearing Raider Outposts" tutorial
	if !DLC04MQ04TutorialQuest.GetStageDone(20)
  		DLC04MQ04TutorialQuest.SetStage(20)
	endif

	;Let system know that the NPCs have been set up as expected
	bRaiderSettlersEnabled = true
EndFunction

Function Shutdown()
	;Set raid index var on MQ04
	if DLC04MQ04.IsRunning()
		(DLC04MQ04 as DLC04MQ04QuestScript).iInitialRaidIndex = 1
	endif

	;If we're at the portion of MQ04 where we're claiming new settlements, update that global now
	if DLC04MQ04.GetStageDone(305) && !DLC04MQ04.GetStageDone(500)
  		UpdateMQ04OutpostCount()
	endif

	;Nab a living Raider and pass it to MQ04 and point the player towards them. If we can't, point them to Shank
	if !DLC04MQ04.GetStageDone(70)

		;Assign my location and workshop reference to aliases in MQ04
		MQ04InitialRaiderSettlementLocation.ForceLocationTo(myLocation.GetLocation())
		MQ04InitialRaiderSettlement.ForceRefTo(Workshop.GetRef())

		if GetLivingRaiderForMQ04()
			DLC04MQ04.SetStage(80)
		else
			DLC04MQ04.SetStage(90)
		endif

		;Mark var to let game know this location had population
		DLC04MQ04FirstOutpostHadPopulation.SetValue(1)
	endif

	;Shut it all down
	SetStage(1000) 
EndFunction

Function SetUpRaiderSettlers(RefCollectionAlias aiAttackers, RefCollectionAlias aiToDelete01, \
	RefCollectionAlias aiToDelete02)
	;Enable appropriate collection, delete other two
	SetupAttackersRefColl(aiAttackers, true)
	SetupAttackersRefColl(aiToDelete01, false)
	SetupAttackersRefColl(aiToDelete02, false)
EndFunction

Function UnstartedQuestCleanUp()
	;Quest wasn't able to start. Clear out all ref collections

	CleanUpRefCollection(Disciples)
	CleanUpRefCollection(Operators)
	CleanUpRefCollection(Zoo)

	;Shut it down!
	SetStage(1000)

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
				debug.trace("DLC04 Chase Off: Setting up attacker: " + Obj)
			else
				debug.trace("DLC04 Chase Off: Deleting attacker: " + i)
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
	debug.trace("DLC04 Raid Chase Off: Start-up failsafe timer on!")
EndFunction

Function IncrementIntimidationSuccesses()

	;Increase the player's number of intimidation successes here and recalc the value
	iIntimidateSuccesses =  iIntimidateSuccesses + 1
	CalculateIntimidationValue()

EndFunction

int Function GetNearbyRaiderSettlements()
	int i = 0
	int iCount = DLC04WorkshopParent.raiderWorkshops.length
	int iSettlementTotal = 0
	ObjectReference targetShop = Workshop.GetRef()

	;Loop through all raider settlements and see if they're in range of the target location
	while i < iCount
		ObjectReference myShop = DLC04WorkshopParent.raiderWorkshops[i]
		float iDistance = myShop.GetDistance(targetShop)
		debug.trace("DLC04 Chase Off: Workshop " + myShop + "is " + iDistance + " from " + targetShop)

		;Is the workshop in range (and in the same world?)
		if iDistance > 0 && iDistance <= DLC04RaidVassalDistance.GetValue()
			iSettlementTotal += 1
			debug.trace("DLC04 Chase Off: Workshop " + myShop + "is valid. Count: " + iSettlementTotal)
		endif

		i += 1
	endWhile

	;Only provide an additional intimidation bonus if there's more than one raider settlement nearby
	if iSettlementTotal > 0
		return iSettlementTotal - 1
	else 
		return 0
	endif
EndFunction	

bool Function GetLivingRaiderForMQ04()
	if DLC04MQ04.IsRunning()
		int i = 0
		int iCount = Attackers.GetCount()

		while i < iCount
			ObjectReference obj = Attackers.GetAt(i)
			debug.trace("DLC04 Chase Off: Evaluating MQ04 Raiderspokesperson: " + obj)

			if !(obj as Actor).IsDead()
				debug.trace("DLC04 Chase Off: Raiderspokesperson chosen: " + obj)
				MQ04RaiderSpokesperson.ForceRefTo(obj)
				return true
			endif

			i += 1
		endwhile
	endif

	;If we didn't get a raider, let the game know
	return false
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
				if NewRefs[i].GetLinkedRef(WorkshopItemKeyword) == WorkshopRef
					aiRefCollection.AddRef(NewRefs[i])
				endif
				i += 1
			endwhile
		endif
	endif
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

Function UpdateRadioBeaconObjective()
	;Player has built a radio beacon. Update the appropriate stage.
	SetStage(32)
EndFunction

Function UpdateNewRaiderSettlementVar(bool bIncrement = true)
	;Increment or decrement the Raider settlement count. 
	if bIncrement
		iRaiderSettlementCount += 1
	else
		iRaiderSettlementCount -= 1
	endif
EndFunction

Function UpdateNewRaiderBeaconVar(bool bIncrement = true)
	;Increment or decrement the Raider settlement count. 
	if bIncrement
		iRaiderRadioBeaconCount += 1
	else
		iRaiderRadioBeaconCount -= 1
	endif
EndFunction

Function ChaseOffFailShutdown()
	;If the raiders have been enabled, throw them in quest to clear them...
	if bRaiderSettlersEnabled
		ToBeDeletedNPCs.AddRefCollection(Attackers)
	else
		;Otherwise, just delete them
		CleanUpRefCollection(Attackers)
	endif

	SetStage(1000)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == iFailSafeID
		;If the spokesperson for this location has become disabled
		;shut down quest if player hasn't already progressed past
		;needing them
		;Don't want to check death here (handled on their alias)
		;And need to make sure that it doesn't interfere with the ChasedOffDisable quest
		;(Which it shouldn't as no NPCs get added to that until stage 100, at which point
		;this won't fire)
		if !GetStageDone(100) && !GetStageDone(90)
			if SettlementSpokesperson.GetActorRef().IsDisabled()
				DLC04RaidChaseOffSettlementSpokespersonUnavailable.Show()
				Utility.Wait(2.0)
				SetStage(860)
			else
				StartTimer(iFailSafeTimerLength, iFailSafeID)
			endif
		endif
	elseif aiTimerID == iStartUpFailSafeTimerID
		;If the location has not yet been approved
		if !bLocationApproved && !GetStageDone(760)
			debug.trace("DLC04 Raid Chase Off: Start-up failsafe timer. Location still not approved.")

			CheckStartUpFailSafe()

			;If the location still isn't approved, start timer again
			StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
		endif
	endif
EndEvent