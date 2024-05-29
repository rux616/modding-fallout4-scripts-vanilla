Scriptname DLC03:DLC03DialogueV118Script extends Quest Conditional

int Property Accusee = 0 Auto Conditional
{1 = Santiago
2 = Gilda
3 = Keith
4 = Julianna
5 = Bert}

ReferenceAlias Property Alias_IntroDoor Auto Const mandatory
RefCollectionAlias Property SecurityProtectrons Auto Const Mandatory
RefCollectionAlias Property Concierges Auto Const Mandatory

Group Factions	
	Faction Property DLC03Vault118_ResidentFaction Auto Const mandatory
	Faction Property DLC03Vault118_CombatFaction Auto Const mandatory
	Faction Property PlayerFaction Auto Const mandatory
	Faction Property DLC03Vault118_SecurityFaction Auto Const mandatory
	Faction Property DLC03Vault118_CrimeFaction Auto Const Mandatory
	Faction Property DLC03Vault118_TurretFaction Auto Const mandatory
EndGroup

ActorValue Property Aggression Auto Const Mandatory

Function DoInit()
	DLC03Vault118_CrimeFaction.SetAlly(PlayerFaction, false, false)
	DLC03Vault118_TurretFaction.SetAlly(PlayerFaction, true, true)
EndFunction	


Function SetUpConfrontationFight(referenceAlias myRefAlias)
	Actor myActor = myRefAlias.GetActorRef()
	myActor.SetCrimeFaction(none)
	myActor.RemoveFromFaction(DLC03Vault118_ResidentFaction)
	myActor.RemoveFromFaction(DLC03Vault118_CrimeFaction)
	myActor.AddToFaction(DLC03Vault118_CombatFaction)

EndFunction

Function EzraRevealed()
	Actor myActor = Julianna.GetActorRef()
	myActor.RemoveFromFaction(DLC03Vault118_ResidentFaction)
	myActor.RemoveFromFaction(DLC03Vault118_CrimeFaction)
	myActor.SetCrimeFaction(none)
	myActor.SetProtected(False)
	myActor.SetEssential(False)
	Accusee = 4
	SetStage(502)
EndFunction

bool Property AttackEzra = false auto conditional
Function VaultAttackEzra()
	Actor myActor = Julianna.GetActorRef()
	myActor.RemoveFromFaction(DLC03Vault118_ResidentFaction)
	myActor.AddToFaction(DLC03Vault118_CombatFaction)
	DLC03Vault118_CombatFaction.SetEnemy(DLC03Vault118_SecurityFaction)
	myActor.SetEssential(false)
	myActor.SetProtected(false)
	AttackEzra = true
EndFunction

DLC03:DLC03_V118_QuestScript Property DLC03_v118_Quest Auto Const Mandatory
Function StartConfrontationFight(referenceAlias myRefAlias, int myAccuseeInt)
	Actor myActor = myRefAlias.GetActorRef()
	myActor.SetCrimeFaction(none)
	DLC03Vault118_CombatFaction.SetEnemy(PlayerFaction)
	DLC03Vault118_CombatFaction.SetEnemy(DLC03Vault118_ResidentFaction)
	DLC03Vault118_CombatFaction.SetEnemy(DLC03Vault118_SecurityFaction)
	myActor.SetProtected(False)
	myActor.SetEssential(False)
	myActor.SetValue(Aggression, 2)
	myActor.StartCombat(game.GetPlayer())
	SetStage(820)

	Accusee = myAccuseeInt
	DLC03_v118_Quest.SetAccusee(myAccuseeInt)
EndFunction

Function SetJuliannaAccused()
	Accusee = 4
EndFunction


Function SetKickout()
	Debug.Trace(self + ": Starting SetKickOut")
	DLC03Vault118_ResidentFaction.SetEnemy(PlayerFaction)
	DLC03Vault118_SecurityFaction.SetEnemy(PlayerFaction)

	ObjectReference mydoor = Alias_IntroDoor.GetReference()
	myDoor.SetOpen()
	myDoor.Unlock()
	myDoor.SetLockLevel(0)

	UnlockLockdownDoors()
	Debug.Trace(self + ": Finished SetKickOut")


	SetActorForKickout(Gilda.GetActorRef())
	SetActorForKickout(Keith.GetActorRef())
	SetActorForKickout(Julianna.GetActorRef())
	SetActorForKickout(Santiago.GetActorRef())
	SetActorForKickout(Bert.GetActorRef())
	SetActorForKickout(Receptionist.GetActorRef())
	SetActorForKickout(Pearl.GetActorRef())

	SetActorGroupForKickout(SecurityProtectrons)
	SetActorGroupForKickout(Concierges)
EndFunction

Function SetActorForKickout(Actor myActor)
	myActor.SetProtected(false)
	myActor.SetEssential(false)
	myActor.SetValue(Aggression, 2)
EndFunction

Function SetActorGroupForKickout(RefCollectionAlias myCollection)
	Debug.Trace(self + ": SetActorGroupForKickout >> " + myCollection)
	Actor myActor
	int i = 0
	int count = myCollection.GetCount()
	Debug.Trace(self + ": Kickout Group Count == " + Count)
	while i <= count
		myActor = (myCollection.GetAt(i) as actor)
		SetActorForKickout(myActor)
		i += 1
	endWhile
EndFunction

bool Property ReceptionistTurnInAvailable = false Auto Conditional hidden
Function SetTurnInValid(bool canTurnIn = true)
	ReceptionistTurnInAvailable = canTurnIn
EndFunction

Function SetInTurnInState(bool turnInState = true)
	isInTurnInState = turnInState
EndFunction

Function SetPostQuestState(bool isInPostQuest = true)
	isPostQuestState = isInPostQuest
EndFunction

Function SetInLockdownState(bool inLockdown = true)
	isInLockdownState = inLockdown
EndFunction

bool Property pearlBonus = false Auto Conditional hidden
Function SetPearlBonusActive()
	pearlBonus = true
EndFunction


float Property Quest2TimerDays = 24.0 Auto const
float Property Quest2RecheckTimer = 8.0 Auto Const
int Quest2TimerID = 100
Function StartQuest2Timer()

	StartTimerGameTime(Quest2TimerDays, Quest2TimerID)
EndFunction


Location Property DLC03Vault118Location Auto Const Mandatory
Event OnTimerGameTime(int aiTimerID)
	ObjectReference Player = Game.GetPlayer()
	if aiTimerID == Quest2TimerID
		;if the player is not currently in the cell, it is okay to proceed
		if !Player.IsInLocation(DLC03Vault118Location)
			SetStage(1300)
			BrainDeadPhase2HookActive = true
		else
			StartTimerGameTime(Quest2RecheckTimer, Quest2TimerID)
		endif
	endif
EndEvent

bool Property BrainDeadPhase2HookActive = false auto conditional hidden
{This is used by the radiant system for sending the 2nd messenger}
Function SetPhase2HookInactive()
	BrainDeadPhase2HookActive = false
EndFunction

bool Property isInTurnInState = false auto Conditional hidden
bool Property isPostQuestState = false auto Conditional hidden
bool Property isInLockdownState = false auto Conditional hidden

ObjectReference Property DLC03V118ConstructionAreaBlockerRef Auto Const mandatory
RefCollectionAlias Property LockdownDoors Auto Const mandatory

ReferenceAlias Property Gilda Auto Const mandatory
ReferenceAlias Property Keith Auto Const mandatory
ReferenceAlias Property Julianna Auto Const mandatory
ReferenceAlias Property Bert Auto Const mandatory
ReferenceAlias Property Santiago Auto Const mandatory
ReferenceAlias Property Receptionist Auto Const mandatory
ReferenceAlias Property Pearl Auto Const mandatory
ObjectReference Property V118_BertCorpseEnableMarker Auto Const Mandatory
ObjectReference Property V118HoldingCellMarker Auto Const Mandatory

Function SetupLockdownState()
	DLC03V118ConstructionAreaBlockerRef.Disable()

	Actor BertActor = Bert.GetActorRef()
	MoveToLockdownPosition(Gilda.GetActorRef())
	MoveToLockdownPosition(Keith.GetActorRef())
	MoveToLockdownPosition(Julianna.GetActorRef())
	;MoveToLockdownPosition(BertActor)
	MoveToLockdownPosition(Santiago.GetActorRef())
	MoveToLockdownPosition(Receptionist.GetActorRef())
	V118_BertCorpseEnableMarker.Enable()

	BertActor.MoveTo(V118HoldingCellMarker)
	;BertActor.kill()
	int i = 0
	int count = LockdownDoors.GetCount()
	while i < count
		LockdownDoors.GetAt(i).Lock()
		LockdownDoors.GetAt(i).SetLockLevel(75)
		i += 1		
	endWhile
EndFunction

Keyword Property LinkCustom10 Auto Const Mandatory
Function MoveToLockdownPosition(Actor myActor)
	if !myActor.IsDead()
		myActor.MoveTo(myActor.GetLinkedRef(LinkCustom10))
	endif
EndFunction

Function CleanUpFromMurder()

	DLC03_V118_CommentMarkerCorpse.Delete()
EndFunction

Function CleanUpPostQuest()

EndFunction

Function UnlockLockdownDoors()
	int i = 0
	int count = LockdownDoors.GetCount()
	while i < count
		LockdownDoors.GetAt(i).SetLockLevel(0)
		LockdownDoors.GetAt(i).UnLock()
		i += 1		
	endWhile

EndFunction

bool isMyCellAttached
bool Quest2TimerStarted
Function SetAttachTracker(bool attachState)
	isMyCellAttached = attachState
	if !Quest2TimerStarted && !isMyCellAttached && GetStageDone(900)
		Quest2TimerStarted = true
		SetStage(1200) 	;This starts the timer and is a stage I can track
	endif
EndFunction

bool EzraIsGone = false
Function EzraHasEscaped()
	if !escapeCancelled
		Julianna.GetRef().Disable()
		EzraIsGone = true
	endif
EndFunction

bool escapeCancelled = false
Function CancelEzraEscape()
	if EzraIsGone
		Julianna.GetRef().Enable()
	endif
	escapeCancelled = true
EndFunction

;Old No longer used vvvvvv


Group ValuablesProperties
	int Property ValuablesGathered = 0 Auto Conditional Hidden
	ReferenceAlias Property Valuables01 Auto Const Mandatory
	ReferenceAlias Property Valuables02 Auto Const Mandatory
	ReferenceAlias Property Valuables03 Auto Const Mandatory
EndGroup

Function GatherValuables()
	ValuablesGathered += 1
	If ValuablesGathered == 1
		game.GetPlayer().AddItem(Valuables01.GetReference())
	elseif  ValuablesGathered == 2
		game.GetPlayer().AddItem(Valuables02.GetReference())
	elseif  ValuablesGathered == 3
		game.GetPlayer().AddItem(Valuables03.GetReference())
	endif
EndFunction


ObjectReference Property DLC03_V118_CommentMarkerCorpse Auto Const Mandatory
