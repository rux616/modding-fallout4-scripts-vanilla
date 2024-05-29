Scriptname ArenaScript extends Quest conditional


Group GlobalEnums

GlobalVariable Property Arena_FightOn const auto
GlobalVariable Property Arena_FightOver const auto
GlobalVariable Property Arena_FightWaiting const auto

EndGroup

Group Auofilled

ReferenceAlias Property Ringmaster const auto
{Holds reference of the Ringmaster}

ReferenceAlias Property AnnounceMarker const auto
{Holds reference of the reference where the Ringmaster speaks from}

ReferenceAlias Property StageController const auto
{Holds reference of the reference that controls the lights}

ReferenceAlias Property CageDoor const auto
{Holds reference of the reference to the arena door which will be locked/unlocked during/after matches}

ReferenceAlias Property WagerContainer const auto
{Holds reference for the container to store the wager in}

ReferenceAlias Property Combatant1 const auto
{Holds combatant #1}

ReferenceAlias Property Combatant2 const auto
{Holds combatant #2}

ReferenceAlias Property CombatantSpawn const auto
{Holds reference to spawn generic Combatants at}

ReferenceAlias Property Corner1 const auto
{Holds reference for Corner1 marker}

ReferenceAlias Property Corner2 const auto
{Holds reference for Corner1 marker}

ReferenceAlias Property PlayerEntranceTrigger const auto
{Holds reference for PlayerEntranceTrigger}

ReferenceAlias Property AnnouncerHeadtrackMarker1 const auto
ReferenceAlias Property AnnouncerHeadtrackMarker2 const auto
ReferenceAlias Property AnnouncerHeadtrackMarker3 const auto
ReferenceAlias Property AnnouncerHeadtrackMarker4 const auto
ReferenceAlias Property AnnouncerHeadtrackMarker5 const auto

Spell Property Arena_PacifyCombatant const auto
{Holds a calm ability to put on combatants to make sure they are passive while waiting to attack each other}

Faction Property Arena_Fight_Faction const auto
{Holds faction that makes combatants want to fight each other}

Faction Property Arena_Rank_Faction const auto
{Holds faction that holds the Arena Rank of the player and NPCs}

MiscObject Property Caps001 const auto
{}

Scene Property Arena_Announcement_Pre const auto
{the scene that plays when the battle is setup and waiting to take wagers}

Scene Property Arena_Announcement_StartFight const auto
{the scene that plays to announce the start of the fight
This scene also must call the StartFight() function when it completes}

Scene Property Arena_Announcement_Post const auto
{Scene that plays after someone loses the fight}

Idle Property IdleFightWinner const auto

GlobalVariable Property CZPlayerFoughtCait conditional auto
{Has the player already fought Cait?}

GlobalVariable Property CZMaxRank conditional auto
{Max rank player can achieve in the arena}

ActorValue Property Health const auto

Keyword Property WeaponTypeMelee1H const auto
Keyword Property WeaponTypeMelee2H const auto


EndGroup

ActorBase[] Property Combatants const auto
{Array of combatants to spawn. 
Index reflects "Rank" 
More difficult opponents should go last.}

bool IsCombatant1Spawned ;is this a newly created actor ref? As opposed to an existing actor like a companion or the player
bool IsCombatant2Spawned ;is this a newly created actor ref? As opposed to an existing actor like a companion or the player

bool IsCombatant1Player conditional ;is this the player?
bool IsCombatant2Player conditional ;is this the player?
bool IsPlayerCombatant conditional ;IsCombat1Player || IsCombatant2Player

bool HasPlayerFoughtBefore conditional

bool property IsPlayerInRing auto conditional hidden ;set by PlayerInEntranceTrigger() -- is Property because it's needed by ArenaSceneScipt

Actor PlayerRef

int[] PrizesByRank ;set in OnInit()
int prize conditional ;in caps


ReferenceAlias BackedCombatant ;1 - Combatant1, 2 - Combatant2, set by PlaceBet()
int Wager ;in caps, set by place Wager
float Odds = 2.0 ;in the future this might be set by a function if the match isn't even

int MaxWager = 500



bool WaitingForWagerContainer

int Earnings conditional ;set by WagerWon

float FightState conditional ; uses the "GlobalEnums" above


;objectives - "enums" for various quest objects
int objPlaceWager = 100 const
int objCollectEarnings = 200 const
int objCollectPrize = 300 const
int objEnterRing = 500 const
int objPlayerGoToCorner = 600 const


;TIMER IDS
int iTimer_PlayerGoToCorner = 1
int iInterval_PlayerGoToCorner = 1
;/
Event OnInit()
	PlayerRef = game.GetPlayer()
	PlayerRef.AddToFaction(Arena_Rank_Faction)

	PrizesByRank = New Int[3]

	PrizesByRank[0] = 100
	PrizesByRank[1] = 200
	PrizesByRank[2] = 300

EndEvent
/;
Event OnTimer(int aiTimerID)

	;PLAYER GO TO CORNER TIMER:
	if aiTimerID == iTimer_PlayerGoToCorner && FightState == Arena_FightWaiting.value
		if IsCombatant1Player && PlayerRef.GetDistance(Corner1.GetReference()) < 150
			setObjectiveCompleted(objPlayerGoToCorner)

		elseif IsCombatant2Player && PlayerRef.GetDistance(Corner2.GetReference()) < 150
			setObjectiveCompleted(objPlayerGoToCorner)

		endif

		startTimer(iInterval_PlayerGoToCorner, iTimer_PlayerGoToCorner)
	endif

EndEvent

;Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
;  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
  ;Debug.Trace(akTarget + " was hit by " + akAggressor)

  ;Only active if the player is the combatant, handled in ToggleRegistrationForRemoteEvents
;	if FightState == Arena_FightWaiting.value && IsPlayerInRing
;		if akTarget.GetValue(Health) > 0
	  		;Trigger a bark from announcer chastizing player and start the fight
;	  		StartFight()
;		else
			;Trigger a bark from announcer chastizing player and  a crime
;		endif
;	elseif FightState == Arena_FightWaiting.value && !IsPlayerInRing
		;Trigger a bark from announcer chastizing player and  a crime
;	elseif FightState == Arena_FightOn.value
;		if akSource != WeaponTypeMelee1H || akSource != WeaponTypeMelee2H
			;Trigger a bark from announcement and a crime
;		endif
;	endif

;EndEvent

;**** REMOTE EVENTS
Event ReferenceAlias.OnDeath(ReferenceAlias akSender, Actor akKiller)
    CombatantDown(akSender)
EndEvent

Event ReferenceAlias.OnEnterBleedout(ReferenceAlias akSender)
    CombatantDown(akSender)
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	utility.wait(1)
	WaitingForWagerContainer = false
EndEvent

Event ReferenceAlias.OnTriggerEnter(ReferenceAlias akSender, ObjectReference akActionRef)
	debug.trace(self + "OnTriggerEnter() akSender:" + akSender + ", akActionRef:" +akActionRef)
	if akActionRef == PlayerRef
		PlayerInEntranceTrigger()
	endif
EndEvent


;**** END REMOTE EVENTS

int Function OpenWagerContainerAndGetAmount()
	ObjectReference ContainerRef = WagerContainer.GetReference()

	WaitingForWagerContainer = true

	RegisterForRemoteEvent(ContainerRef, "OnActivate")

	ContainerRef.Activate(PlayerRef)

	int waitingFor

	;first we have to wait until we are in menu mode
	waitingFor = 0
	while WaitingForWagerContainer
		waitingFor += 1
		utility.wait(1)
		debug.trace(self + "OpenWagerContainerAndGetAmount() waiting while WaitingForWagerContainer. Waiting for: " + waitingFor)

	endwhile

	UnregisterForRemoteEvent(ContainerRef, "OnActivate")

	;***NEED TO ADD LOGIC TO GIVE BACK PLAYER ANY OBJECTS THAT AREN'T CAPS001***
	;Hopefully we'll have code solution: TTP# 6078

	int amount = ContainerRef.getItemCount(Caps001)
	
	ContainerRef.RemoveAllItems()

	if amount > MaxWager
		PlayerRef.AddItem(Caps001, amount - MaxWager)
		amount = MaxWager
	endif

	return amount

EndFunction

Function PlaceWager(int Combatant)
	;BackedCombatant 1 = Combatant1, 2 = Combatant2

	if combatant == 1
		BackedCombatant = Combatant1
	else
		BackedCombatant = Combatant2
	endif

	wager = OpenWagerContainerAndGetAmount()

	debug.trace(self + "PlaceWager() Combatant:" + combatant + ", Wager:" + wager)

	setObjectiveCompleted(objPlaceWager)
	AnnounceFight()

EndFunction

Function AnnounceFight()
	;called by PlaceWager()
	;also called by Arena_Announcement_Pre scene if the player doesn't place a wager

	((self as Quest) as DefaultCrowdEventManager).CreateCrowdInLoadedArea()

	Arena_Announcement_Pre.stop() ;in case it's still running
	Arena_Announcement_StartFight.Start() ;this scene calls StartFight() when it conclues
EndFunction

Function CollectEarnings()
	PlayerRef.Additem(Caps001, Earnings)
	Earnings = 0
	setObjectiveCompleted(objCollectEarnings)
EndFunction

Function WagerWon()
	Earnings = (Wager * Odds) as int ;adding it incase the player hasn't picked up previous earnings
	debug.trace(self + "WagerWon() Earnings:" + Earnings + " = Wager: " + Wager + " * Odds:" + Odds)

	SetObjectiveDisplayed(objCollectEarnings, true, true)

EndFunction

Function WagerLost()
	debug.trace(self + "WagerLost()")

EndFunction

Function CollectPrize()
	PlayerRef.Additem(Caps001, Prize)
	Prize = 0
	setObjectiveCompleted(objCollectPrize)
EndFunction

Function PrizeWon(Actor WinningActor)
	Prize = PrizesByRank[WinningActor.GetFactionRank(Arena_Rank_Faction)]
	debug.trace(self + "PrizeWon() Prize:" + prize)

	setObjectiveDisplayed(objCollectPrize)
EndFunction

Function CombatantDown(ReferenceAlias DownedAlias) ;called by OnBleedout/OnDeath Events
	;this should only happen once per fight
	;this also functions to "thread safe" things in case both combatants die at the same time

	debug.trace(self + "CombatantDown():" + DownedAlias)

	Actor WinnerActor

	if DownedAlias == Combatant1
		WinnerActor = Combatant2.GetActorReference()
	else
		WinnerActor = Combatant1.GetActorReference()
	endif

	if IsPlayerCombatant && DownedAlias.GetActorReference() != PlayerRef
		;if CZPlayerFoughtCait.GetValue() == 1
			PrizeWon(PlayerRef)
		;endif

		if PlayerRef.GetFactionRank(Arena_Rank_Faction) < CZMaxRank.GetValue()
			PlayerRef.SetFactionRank(Arena_Rank_Faction, PlayerRef.GetFactionRank(Arena_Rank_Faction) + 1)
		endif

	endif

	if FightState == Arena_FightOn.value && Wager > 0 
		if  BackedCombatant == DownedAlias
			WagerLost()
		else
			WagerWon()
		endif
	endif

	if WinnerActor != Game.GetPlayer()
		;NOTE: has a while loop with a wait in it
		PlayTriumphantIdle(WinnerActor)
	endif


	StopFight()
EndFunction

Function StartFight()
	if FightState != Arena_FightOn.value

		FightState = Arena_FightOn.value
		Actor Combatant1Ref = Combatant1.GetActorReference()
		Actor Combatant2Ref = Combatant2.GetActorReference()

		if Combatant1Ref != PlayerRef
			Combatant1Ref.ResetHealthAndLimbs()
		endif

		if Combatant2Ref != PlayerRef
			Combatant2Ref.ResetHealthAndLimbs()
		endif

		Combatant1Ref.AddToFaction(Arena_Fight_Faction)
		Combatant2Ref.AddToFaction(Arena_Fight_Faction)

		Combatant1Ref.RemoveSpell(Arena_PacifyCombatant)
		Combatant2Ref.RemoveSpell(Arena_PacifyCombatant)
	endif

	setObjectiveDisplayed(objPlayerGoToCorner, false)
	setObjectiveCompleted(objPlayerGoToCorner, false)

EndFunction

Function StopFight()

	debug.trace(self + "StopFight() unlocking: " + CageDoor.GetReference())

	CageDoor.GetReference().lock(false)

	Combatant1.GetActorReference().AddSpell(Arena_PacifyCombatant)
	Combatant2.GetActorReference().AddSpell(Arena_PacifyCombatant)

	Combatant1.GetActorReference().stopCombat()
	Combatant2.GetActorReference().stopCombat()


	ToggleRegistrationForRemoteEvents(ShouldWatchForEvents = False)

	debug.trace(self + "StopFight() starting scene: " + Arena_Announcement_Post)
	Arena_Announcement_Post.Start()	;scene announcing the winner and reminding people to collect their bets	

EndFunction

Function SetUpMatch(Actor RingmasterActor, ObjectReference AnnounceMarkerRef, objectReference StageControllerRef, objectReference CageDoorRef, ObjectReference Corner1Ref, ObjectReference Corner2Ref, ObjectReference PlayerEntranceTriggerRef, ObjectReference SpawnMarker = None, int Rank = 0, Actor Combatant1Ref = None, Actor Combatant2Ref = None, ObjectReference AnnouncerHeadtrackMarker1Ref = none, ObjectReference AnnouncerHeadtrackMarker2Ref = none, ObjectReference AnnouncerHeadtrackMarker3Ref = none)
	;called by other scripts when they want to setup a new match

	;PlayerEntranceTriggerRef = where the player needs to stand to be be moved into the ring (moveto command until elevator is working)

	if SpawnMarker == None && (Combatant1Ref == None || Combatant2Ref == None)
		Game.Error(self + "WARNING: SetUpMatch() SpawnMarker param must be specified if Combatant1 or Combatant2 aren't!")
	endif

	ResetEarningsAndWagerObjectives()

	debug.trace(self + "SetUpMatch() Ringmaster:" + RingmasterActor)
	debug.trace(self + "SetUpMatch() Ringmaster:" + AnnounceMarkerRef)
	debug.trace(self + "SetUpMatch() StageControllerRef:" + StageControllerRef)
	debug.trace(self + "SetUpMatch() CageDoorRef:" + CageDoorRef)
	debug.trace(self + "SetUpMatch() Corner1:" + Corner1Ref)
	debug.trace(self + "SetUpMatch() Corner2:" + Corner2Ref)
	debug.trace(self + "SetUpMatch() CombatantSpawn:" + SpawnMarker)
	debug.trace(self + "SetUpMatch() PlayerEntranceTriggerRef:" + PlayerEntranceTriggerRef)

	Ringmaster.ForceRefTo(RingmasterActor)
	AnnounceMarker.ForceRefTo(AnnounceMarkerRef)
	StageController.ForceRefTo(StageControllerRef)
	CageDoor.ForceRefTo(CageDoorRef)

	;Rank = PlayerRef.GetFactionRank(Arena_Rank_Faction)

	Corner1.ForceRefTo(Corner1Ref)
	Corner2.ForceRefTo(Corner2Ref)
	CombatantSpawn.ForceRefTo(SpawnMarker)
	PlayerEntranceTrigger.ForceRefTo(PlayerEntranceTriggerRef)

	SetCombatantAliases(Rank, Combatant1Ref, Combatant2Ref)

	Combatant1.GetActorReference().AddSpell(Arena_PacifyCombatant)
	Combatant2.GetActorReference().AddSpell(Arena_PacifyCombatant)

	AnnouncerHeadtrackMarker1.ForceRefTo(AnnouncerHeadtrackMarker1Ref)
	AnnouncerHeadtrackMarker2.ForceRefTo(AnnouncerHeadtrackMarker2Ref)
	AnnouncerHeadtrackMarker3.ForceRefTo(AnnouncerHeadtrackMarker3Ref)

	IsCombatant1Player = False	
	IsCombatant2Player = False	
	IsPlayerCombatant = False
	IsPlayerInRing = False

	if Combatant1Ref == PlayerRef
		IsCombatant1Player = True
	elseif Corner2Ref == PlayerRef
		IsCombatant2Player = True
	endif

	;for convenience:
	IsPlayerCombatant = IsCombatant1Player || IsCombatant2Player

	ToggleRegistrationForRemoteEvents(ShouldWatchForEvents = True)
	
	FightState = Arena_FightWaiting.value


	if IsPlayerCombatant
		HasPlayerFoughtBefore = true
		SetObjectiveDisplayed(objEnterRing)
	endif	


	;ASSUME if the player is a combatant, he's not yet in the cage, so lock the door
	if IsPlayerCombatant
		CageDoor.GetReference().Lock()
	endif


	Arena_Announcement_Pre.start()
	;above scene handles various things including:
	;opening and closing wagers (calls SetPlaceWagerObjective())
	;watching for player combatant to hit his marks
	;starting the fight (calls StartFight() / canceling the fight if the player combatant wanders off


EndFunction

Function PlayerInEntranceTrigger()
	debug.trace(self + "PlayerInEntranceTrigger()")

	;*** LOCK PLAYER CONTROLS
	;*** MOVE ELEVATOR

	Ringmaster.GetActorReference().MoveTo(AnnounceMarker.GetReference())

	;playerRef.moveto(CombatantSpawn.GetReference()) ;SIMULATE ELEVATOR TRIP

	;utility.wait(1)


	setObjectiveCompleted(objEnterRing)

	IsPlayerInRing = True

	setObjectiveDisplayed(objPlayerGoToCorner)
	startTimer(iInterval_PlayerGoToCorner, iTimer_PlayerGoToCorner)

EndFunction

Function PlayerFailedToEnterRing()	; called by Phase Fragment in Arena_Announcement_Pre scene
	setObjectiveFailed(objEnterRing)
EndFunction

Function ResetEarningsAndWagerObjectives()
	;reset objective to collect earnings
	if IsObjectiveCompleted(objCollectEarnings) == false && IsObjectiveDisplayed(objCollectEarnings)
		setObjectiveFailed(objCollectEarnings)
	endif

	if IsObjectiveCompleted(objCollectPrize) == false && IsObjectiveDisplayed(objCollectPrize)
		setObjectiveFailed(objCollectPrize)
	endif

	SetObjectiveDisplayed(objCollectEarnings, false)
	setObjectiveCompleted(objCollectEarnings, false)
	SetObjectiveDisplayed(objCollectPrize, false)
	setObjectiveCompleted(objCollectPrize, false)
	SetObjectiveDisplayed(objPlaceWager, false)
	setObjectiveCompleted(objPlaceWager, false)
EndFunction

Function ToggleRegistrationForRemoteEvents(bool ShouldWatchForEvents)
	debug.trace(self + "ToggleRegistrationForRemoteEvents() ShouldWatchForEvents:" + ShouldWatchForEvents + ", IsPlayerCombatant:" + IsPlayerCombatant)

	if ShouldWatchForEvents
		RegisterForRemoteEvent(Combatant1, "OnDeath")
		RegisterForRemoteEvent(Combatant1, "OnEnterBleedout")
		RegisterForRemoteEvent(Combatant2, "OnDeath")
		RegisterForRemoteEvent(Combatant2, "OnEnterBleedout")
		
		if IsPlayerCombatant
			RegisterForRemoteEvent(PlayerEntranceTrigger, "OnTriggerEnter")
			;RegisterForHitEvent(Combatant1)
			;RegisterForHitEvent(Combatant2)
		endif

	else
		UnregisterForRemoteEvent(Combatant1, "OnDeath")
		UnregisterForRemoteEvent(Combatant1, "OnEnterBleedout")
		;UnregisterForHitEvent(Combatant1)
		UnregisterForRemoteEvent(Combatant2, "OnDeath")
		UnregisterForRemoteEvent(Combatant2, "OnEnterBleedout")
		UnregisterForRemoteEvent(PlayerEntranceTrigger, "OnTriggerEnter")
		;UnregisterForHitEvent(Combatant2)
	endif

EndFunction


Function SetPlaceWagerObjective(bool IsAcceptingWagers) ; called from scene phase
	if IsAcceptingWagers
		SetObjectiveDisplayed(objPlaceWager, true, true)
	
	elseif isObjectiveCompleted(objPlaceWager) == false
		setObjectiveFailed(objPlaceWager)

	endif
EndFunction

Function SetCombatantAliases(int Rank = 0, Actor Combatant1Ref = None, Actor Combatant2Ref = None)
	;Force Actors into aliases, if none, use GetCombatantActorBase() function to get an ActorBase to create
	;uses Rank to decide which CombatabtActorBase to grab

	if Combatant1Ref == None
		Combatant1Ref = CombatantSpawn.GetReference().PlaceActorAtMe(GetCombatantActorBase(Rank))
		IsCombatant1Spawned = true
	else
		IsCombatant1Spawned = false
	endif

	if Combatant2Ref == None
		Combatant2Ref = CombatantSpawn.GetReference().PlaceActorAtMe(GetCombatantActorBase(Rank))
		IsCombatant2Spawned = true
	else
		IsCombatant2Spawned = false
	endif

	debug.trace(self + "SetCombatantAliases() Combatant1 alias:" + Combatant1Ref)
	debug.trace(self + "SetCombatantAliases() Combatant2 alias:" + Combatant2Ref)

	Combatant1.ForceRefTo(Combatant1Ref)
	Combatant2.ForceRefTo(Combatant2Ref)
EndFunction

ActorBase Function GetCombatantActorBase(int Rank = 0)
	;returns the ActorBase to use for the combatant

	int i

	if Combatants.Length < Rank + 1
		debug.trace(self + "GetCombatantActorBase() Rank larger than Combatants array. Using Last Combatant  in array instead.")
		i = Combatants.Length
	endif

	return Combatants[i]

EndFunction

Function SpotlightCombatant1(bool turnOnLight)
	debug.trace(self + "Calling SpotlightCombatant1 on " + StageController.GetReference())
	(StageController.GetReference() as CZStageControllerScript).SpotlightCombatant1(turnOnLight)
EndFunction

Function SpotlightCombatant2(bool turnOnLight)
	debug.trace(self + "Calling SpotlightCombatant2 on " + StageController.GetReference())
	(StageController.GetReference() as CZStageControllerScript).SpotlightCombatant2(turnOnLight)
EndFunction

Function PlayTriumphantIdle(Actor ActorToTryToPlayIdle)

	int tries
	bool success
	
	while tries < 5 && success == false
		success = ActorToTryToPlayIdle.PlayIdle(IdleFightWinner)
		tries += 1

		if success == false
			utility.wait(0.2)
		endif
	endwhile

	
EndFunction