Scriptname DLC04:DLC04RaidCoerceScript extends DLC04:DLC04RaidParentScript Conditional

LocationAlias Property myLocationResTest Auto Const Mandatory
{Alias to check if this spot's location has been reserved}

ReferenceAlias Property WorkshopResTest Auto Const Mandatory
{Alias to check if this workshop is reserved}

ReferenceAlias Property NearbyRaiderWorkshop Auto Const Mandatory
{Reference to a Raider workshop without a radio beacon (used as an objective)}

LocationAlias Property NearbyRaiderSettlement Auto Const Mandatory
{Reference to a Raider workshop location without a radio beacon (used as an objective)}

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

RefCollectionAlias Property PermanentActors Auto Const Mandatory
{Alias collection of permanent workshop actors on WorkshopPermanentActor script} 

Faction Property HasBeenCompanionFaction Auto Const Mandatory
{Faction used to check if anyone at the settlement is a companion}

Faction Property CurrentCompanionFaction Auto Const Mandatory
{Faction used to check if anyone at the settlement is the player's current companion}

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

bool Property bLocationApproved = false Auto Conditional
{Bool used to determine if player has approved attack on this location (so they don't have to go through the approve attack scene multiple times)}

bool Property bOutpostWithoutBeacon = false Auto Conditional
{Boolean to manage if there's an outpost without a beacon nearby}

bool Property bProcessingStartup = false Auto Conditional
{Boolean to prevent quest from proceeding until start up is completed}

bool Property bStartUpComplete = false Auto Conditional
{Boolean to know if all start up has been completed. Want to let the quest finish starting up before shutting it down}

bool Property bCallforShutdown = false Auto Conditional
{Boolean to shut down quest if invalid targets are present}

GlobalVariable Property DLC04OperatorsToolsConversationComplete Auto Const Mandatory
{Used to watch if the player has already completed the tools conversation with Lizzie}

Quest Property GenericBrawl const auto mandatory

Quest Property DLC04CollectVassalIncomeMiscQuest Auto Const Mandatory
{Quest that points player to first vassal income collection}

Keyword Property DLC04RaidVassalRewardKeyword Auto Const Mandatory
{Keyword used to start the vassal reward quest}

int Property iFailSafeTimerLength = 15 Auto Const
{Length of failsafe timer (check to make sure spokeperson hasn't become disabled)}

Message Property DLC04RaidCoerceSettlementSpokespersonUnavailable Auto Const Mandatory
{Message to inform player settlement spokesperson has gone missing}

;Local vars
bool bChoseGangOnce = false
int iFailSafeID = 3 const
int iStartUpFailSafeTimerID = 4 const
int iStartUpFailsafeCount = 0

Event OnQuestInit()
	debug.trace("DLC04 Coerce: Quest init'ed.")

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
			iCurrentRaidIndex = 3

			;Get the start up running
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

	debug.trace("DLC04 Coerce: Eval'ing settlement.")
	if MQ206.IsRunning()
		;Check to see if we're targeting the teleporter location. If so, shut it down.
		Location TargetLoc = myLocation.GetLocation()

		if TargetLoc == TeleporterLocation.GetLocation() || MQ206FactionLeader.GetRef().IsInLocation(TargetLoc) || MQ206FactionScientist.GetRef().IsInLocation(TargetLoc) || MQ206FactionEndNPC.GetRef().IsInLocation(TargetLoc)
			debug.trace("DLC04 Coerce: Targeting teleport location. Shut it down. Location:" + TargetLoc)
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
			debug.trace("DLC04 Coerce: Player lost control of this settlement at some point. Ok to proceed.")
			;If the player has lost control of this location, then we're good to proceed

		else 
			if myShop.OwnedByPlayer == 1
				debug.trace("DLC04 Coerce: Player owns this location. Ok to proceed.")
				bLocationPlayerOwned = true
				;If the player owns this place, we're good
			else
				if !myShop.EnableAutomaticPlayerOwnership 
					debug.trace("DLC04 Coerce: Player does not own this location and it requires unlock. STOP!")
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
	debug.trace("DLC04 Coerce: Eval'ing settlers.")
	if SettlementLeader.GetRef() != none
		debug.trace("DLC04 Coerce: Adding settlement leader.")
		SettlementTargets.AddRef(SettlementLeader.GetRef())
	endif

	if SettlementRobots.GetCount() > 0
		debug.trace("DLC04 Coerce: Adding settlement robots.")
		; first get rid of non-valid actors (bad loc ref type data)
		VerifyRefCollection(SettlementRobots)
		SettlementTargets.AddRefCollection(SettlementRobots)
	endif

	if Settlers.GetCount() > 0
		debug.trace("DLC04 Coerce: Adding settlers.")
		; first get rid of non-valid actors (bad loc ref type data)
		VerifyRefCollection(Settlers)
		SettlementTargets.AddRefCollection(Settlers)
	endif

	;Run through permanent actors list and ensure none of them are at this location
	if PermanentActors.GetCount() > 0
		debug.trace("DLC04 Coerce: Eval'ing permanent workshop actors.")

		int i = 0
		int iCount = PermanentActors.GetCount()
		int iTargetWorkshopID = (Workshop.GetRef() as WorkshopScript).GetWorkshopID()

		while i < iCount
			Actor act = (PermanentActors.GetAt(i) as Actor)
			debug.trace("DLC04 Coerce: Checking permanent actor location: " + act)
			int iActorWorkshopID = (act as WorkshopNPCScript).GetWorkshopID()

			if iActorWorkshopID == iTargetWorkshopID
				debug.trace("DLC04 Coerce: Adding permanent actors to settlement targets: " + act)
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
		debug.trace("DLC04 Coerce: Checking for essential NPCs/companions. Checking: " + act)

		if act.IsInFaction(HasBeenCompanionFaction)
			if DLC01WorkshopRobotFaction == NONE || act.IsInFaction(DLC01WorkshopRobotFaction) == false
				debug.trace("DLC04 Coerce: Found companion: " + act)
				bCompanionPresent = true
			else
				; is this Ada?
				if DLC01Ada && act.GetActorBase() == DLC01Ada
					debug.trace("DLC04 Coerce: Found companion: " + act)
					bCompanionPresent = true
				else 
					debug.trace("DLC04 Coerce: Found DLC01 robot : " + act + " - ignoring")
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

	;Processing complete. Start up failsafe timer!
	StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
	debug.trace("DLC04 Raid Coerce: Start-up failsafe timer on!")

	;If nothing's prevented this from starting, begin next hunk of set up
	if !bCallforShutdown
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

		;Mark this location as approved
		bLocationApproved = true

		;Get the Raider Settlement Count var set
		iRaiderSettlementCount = NearbyRaiderWorkshops.GetCount()

		;If MQ04 is still active, set var that we've started an attack quest
		if DLC04MQ04.IsRunning()
			(DLC04MQ04 as DLC04MQ04QuestScript).ToggleMQ04ClaimQuestVar(true)
		endif

		;Set all the intimdation values locally
		SetIntimidationValues()

		;Start up's all done
		bStartUpComplete = true

		;if the quest hasn't yet failed...
		if !GetStageDone(850)

			;Attempt to teleport spokesperson to home
			TryToSendHome(SettlementSpokesperson.GetActorRef())

			;Mark this quest active if this quest hasn't already been failed
			if !GetStageDone(860) && !GetStageDone(1000)
				bRaidActive = true
				StartTimer(iFailSafeTimerLength, iFailSafeID)
			endif

			;Let's get this party started. Point player towards target to convince
			debug.trace("DLC04 Coerce: Set up complete. Throw objectives!")
			SetStage(20)

			;Check to see if we should throw additional objectives
			if DLC04OperatorsToolsConversationComplete.GetValue() > 0
				SetStage(21)
			endif
		else
			;Otherwise, shut it down
			CoerceFailShutdown()
		endif
	endif
EndFunction

Function WrapUpQuest()
	;Let system know we don't care about additional intimidation system messages
	bIntimidationResolved = true

	debug.trace("DLC04 Coerce: Begin wrap up sequence.")

	;Give player new workshop location
	(DLC04WorkshopParent as DLC04:DLC04WorkshopParentScript).SetVassalSettlement(Workshop.GetRef() as WorkshopScript, iChosenGang)

	;Set raid index var on MQ04
	if DLC04MQ04.IsRunning() && !DLC04MQ04.GetStageDone(150)
		DLC04MQ04.SetStage(150)
		(DLC04MQ04 as DLC04MQ04QuestScript).iSecondRaidIndex = 3
	endif

	;Start up Vassal Reward Quest
	DLC04RaidVassalRewardKeyword.SendStoryEventAndWait(none, Workshop.GetRef())

	;Shut it all down
	SetStage(1000) 

EndFunction

Function UnstartedQuestCleanUp()
	;Shut it down!
	SetStage(1000)

EndFunction

Function TriggerShutdown()
	;Delete all spawned NPCs and mark up all the vars for shutdown
	SetStage(750)
	bCallforShutdown = true
	bProcessingStartup = false

	;Processing complete. Start up failsafe timer!
	StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
	debug.trace("DLC04 Raid Coerce: Start-up failsafe timer on!")
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
		debug.trace("DLC04 Coerce: Workshop " + myShop + "is " + iDistance + " from " + targetShop)

		;Is the workshop in range (and in the same world?)
		if iDistance > 0 && iDistance <= DLC04RaidVassalDistance.GetValue()
			iSettlementTotal += 1
			debug.trace("DLC04 Coerce: Workshop " + myShop + "is valid. Count: " + iSettlementTotal)
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

; watch for these from brawl quest
Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)

	if akSender == GenericBrawl && auiStageID == (GenericBrawl as GenericBrawlScript).PlayerWinsStage
		debug.trace(self + "OnStageSet: stage=" + auiStageID + ", item=" + auiItemID)
		SetStage(70)
	endif


	if akSender == GenericBrawl && auiStageID == (GenericBrawl as GenericBrawlScript).PlayerDefeatedStage
		debug.trace(self + "OnStageSet: stage=" + auiStageID + ", item=" + auiItemID)
		SetStage(75)
	endif


	if akSender == GenericBrawl && auiStageID == (GenericBrawl as GenericBrawlScript).QuestDoneStage
		debug.trace(self + "OnStageSet: stage=" + auiStageID + ", item=" + auiItemID)
		SetStage(80)
	endif
EndEvent

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

Function CoerceFailShutdown()
	SetStage(1000)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == iFailSafeID
		;If the spokesperson for this location has become disabled
		;shut down quest if player hasn't already progressed past
		;needing them
		;Don't want to check death here (handled on their alias)
		if !GetStageDone(100) && !GetStageDone(90)
			if SettlementSpokesperson.GetActorRef().IsDisabled()
				DLC04RaidCoerceSettlementSpokespersonUnavailable.Show()
				Utility.Wait(2.0)
				SetStage(860)
			else
				StartTimer(iFailSafeTimerLength, iFailSafeID)
			endif
		endif
	elseif aiTimerID == iStartUpFailSafeTimerID
		;If the location has not yet been approved
		if !bLocationApproved && !GetStageDone(760)
			debug.trace("DLC04 Raid Coerce: Start-up failsafe timer. Location still not approved.")

			CheckStartUpFailSafe()

			;If the location still isn't approved, start timer again
			StartTimer(iStartupFailSafeTimerLength, iStartUpFailSafeTimerID)
		endif
	endif
EndEvent