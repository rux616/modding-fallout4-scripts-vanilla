Scriptname DLC04:DLC04MQ04RaiderAttackScript extends Quest Conditional

int Property iSettlementGang = 0 Auto Conditional
{int used to store gang index of player's settlement}

ReferenceAlias Property RaiderSettlement Auto Const Mandatory
{Reference alias to the location of the player's Raider settlement}

ReferenceAlias Property DiscipleSpokesperson Auto Const Mandatory
{Reference alias for spawned Disciple spokesperson}

ReferenceAlias Property OperatorSpokesperson Auto Const Mandatory
{Reference alias for spawned Oeprator spokesperson}

ReferenceAlias Property PackSpokesperson Auto Const Mandatory
{Reference alias for spawned Pack spokesperson}

ReferenceAlias Property RaiderSpokesperson Auto Const Mandatory
{Reference alias the chosen gang spokesperson is forced into}

ReferenceAlias Property RaiderSpokepersonTravelMarker Auto Const Mandatory
{Reference alias for spokeperson's travel marker}

ReferenceAlias Property Sinner Auto Const Mandatory
{Enemy gang boss}

ReferenceAlias Property CenterMarker Auto Const Mandatory
{Alias for center marker}

RefCollectionAlias Property SinnerGang Auto Const Mandatory
{Collection containing actual gameplay functionality for enemy gang}

RefCollectionAlias Property SinnerGangRegulars Auto Const Mandatory
{Ref collection of standard enemy raiders}

RefCollectionAlias Property SinnerGangPowerArmor Auto Const Mandatory
{Ref collection of Power Armor'ed enemy raiders}

RefCollectionAlias Property SettlementRaiders Auto Const Mandatory
{Ref collection of raiders at friendly settlement}

RefCollectionAlias Property ToBeDeletedNPCs Auto Const Mandatory
{Ref collection to delete attackers once quest is completed}

Faction Property DLC04MQ04SinnerGangFaction Auto Const Mandatory
{Quest faction to make enemy gang hostile to player, local gang}

Faction Property DLC04MQ04SettlementGangFaction Auto Const Mandatory
{Quest faction for friendly Raider gang}

Faction Property PlayerFaction Auto Const Mandatory
{Player factioj}

GlobalVariable Property DLC04MQ04SinnerSceneStartDistance Auto Const Mandatory
{Global to trigger enemy boss' looping scene as Sinner approaches location}

GlobalVariable Property DLC04MQ04SinnerPlayerSceneStartDistance Auto Const Mandatory
{Global to trigger enemy boss' looping scene as player approaches Sinner}

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory
{DLC04 Workshop Parent script}

Quest Property DLC04MQ04 Auto Const Mandatory
{DLC04MQ04 quest}

Faction[] Property FactionsToFriend Auto Const Mandatory
{Array for factions to make friends with Sinners faction on start up}

int Property iFailsafeTimerLength = 90 Auto Const
{Length of time before we automatically throw the QT over Sinner's head}

;Local vars
int iFailSafeTimerID = 1

Function StartUp()
	debug.trace("DLC04MQ04 Raider Attack: Start up.")
	;Store the gang index for the targeted settlement
	iSettlementGang = DLC04WorkshopParent.GetRaiderGangValue(RaiderSettlement.GetRef() as WorkshopScript)
	debug.trace("DLC04MQ04 Raider Attack: Target settlement: "+ RaiderSettlement.GetRef() + ". Gang: " + iSettlementGang)

	;Set up spokesperson
	SetUpSpokepersonAlias()

	;Set up spokesperson, clear up unused ones
	if iSettlementGang == 1
		CleanupGangSpokepersonAliases(2)
		CleanupGangSpokepersonAliases(3)
	elseif iSettlementGang == 2
		CleanupGangSpokepersonAliases(1)
		CleanupGangSpokepersonAliases(3)
	elseif iSettlementGang == 3
		CleanupGangSpokepersonAliases(1)
		CleanupGangSpokepersonAliases(2)
	endif

	;Add all Sinner's gangers to the main ref collection
	SinnerGang.AddRefCollection(SinnerGangRegulars)
	SinnerGang.AddRefCollection(SinnerGangPowerArmor)

	;Set up friendship status between Sinner and the baddies of the Commonwealth
	SetSinnerFactionFriends()

EndFunction

Function EnableandEvalNPCs()
	;Enable and eval all the attackers
	Actor Boss = Sinner.GetActorRef()
	Boss.Enable()
	Boss.EvaluatePackage()
	SinnerGang.EnableAll()
	SinnerGang.EvaluateAll()

	;Get the locals in the right spot
	SettlementRaiders.EvaluateAll()

	;Register Sinner for distance event with center marker
	RegisterForDistanceLessThanEvent(CenterMarker.GetRef(), Boss, DLC04MQ04SinnerSceneStartDistance.GetValue())

	;Register Sinner for distance event with player
	RegisterForDistanceLessThanEvent(Game.GetPlayer(), Boss, DLC04MQ04SinnerPlayerSceneStartDistance.GetValue())

EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	;Once player comes within appropriate distance, begin scene
	Actor Boss = Sinner.GetActorRef()
	ObjectReference CMRef = CenterMarker.GetRef()
	ObjectReference PlayerRef = Game.GetPlayer()

	if akObj1 == PlayerRef || akObj2 == PlayerRef
		if !GetStageDone(150)
			SetStage(70)
		endif
	endif

	if akObj2 == CMRef || akObj1 == CMRef
		if !GetStageDone(70) && !GetStageDone(150)
			SetStage(50)
		endif
	endif
EndEvent

Function BeginAttack()
	;Pull protection from Sinner's gang
	Actor act = Sinner.GetActorRef()
	act.SetProtected(false)
	ToggleCollectionProtected(SinnerGang, false)

	;Set Sinner's gang enemy to player and defenders
	DLC04MQ04SinnerGangFaction.SetEnemy(PlayerFaction)
	DLC04MQ04SinnerGangFaction.SetEnemy(DLC04MQ04SettlementGangFaction)
	DLC04MQ04SinnerGangFaction.SetPlayerEnemy()

	;Get enemy gang moving
	act.EvaluatePackage()
	act.StartCombat(Game.GetPlayer())
	SinnerGang.EvaluateAll()

	;Set objective stage if it hasn't been already set
	if !GetStageDone(20)
		SetStage(20)
	endif
EndFunction

Function SetUpSpokepersonAlias()

	;Only set up the Raider spokesperson if the player hasn't bypassed the vassal part of the quest
	if !DLC04MQ04.GetStageDone(140)
		ObjectReference obj

		;Figure out which spokesperson we want
		if iSettlementGang == 1
			obj = DiscipleSpokesperson.GetRef()
		elseif iSettlementGang == 2
			obj = OperatorSpokesperson.GetRef()
		elseif iSettlementGang == 3
			obj = PackSpokesperson.GetRef()
		endif

		debug.trace("DLC04MQ04 Raider Attack: Setting up Raider Spokesperson: " +obj)

		;Now get target set up
		RaiderSpokesperson.ForceRefTo(obj)
		obj.Enable()

		;And move the Raider to their target marker if the player doesn't have line of sight
		Actor PlayerRef = Game.GetPlayer()
		ObjectReference MarkerRef = RaiderSpokepersonTravelMarker.GetRef()

		if !PlayerRef.HasDirectLOS(MarkerRef) && !PlayerRef.HasDetectionLOS(MarkerRef)
			obj.MoveTo(MarkerRef)
		endif
	else
		;If the player has bypassed the vassal section of MQ04, delete the Raider spokesperson
		RaiderSpokesperson.GetRef().Delete()
		RaiderSpokesperson.Clear()
	endif
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
		PackSpokesperson.GetRef().Delete()
		PackSpokesperson.Clear()
	endif
EndFunction

Function AddAttackersToDeletionCollection()
	ToBeDeletedNPCs.AddRefCollection(SinnerGang)
	ToBeDeletedNPCs.Addref(Sinner.GetRef())
EndFunction

Function ToggleCollectionProtected(RefCollectionAlias aiCollection, bool bSetProtected)
	int i = 0
	int iCount = aiCollection.GetCount()

	while i < iCount
		Actor act = aiCollection.GetAt(i) as Actor
		ActorBase AB = act.GetLeveledActorBase()
		debug.trace("DLC04 Raider Attack: Processing protected NPC: " + act)

		if bSetProtected
			if !AB.IsProtected()
				debug.trace("DLC04 Raider Attack: Adding protection to: " + act)
				Act.SetProtected(true)
			endif
		else
			if AB.IsProtected()
				debug.trace("DLC04 Raider Attack: Removing protection from: " + act)
				Act.SetProtected(false)
			endif
		endif
		i += 1
	endwhile
EndFunction

Function StartFailsafeTimer()
	StartTimer(iFailsafeTimerLength, iFailSafeTimerID)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == iFailSafeTimerID
		SetStage(30)
	endif
EndEvent

Function SetSinnerFactionFriends()
	;Roll through all the factions in the FactionsToFriend array and make them friends with Sinners Gang
	int i = 0
	int iCount = FactionsToFriend.Length

	while i < iCount
		DLC04MQ04SinnerGangFaction.SetAlly(FactionsToFriend[i], true, true)
		debug.trace(self + "DLC04MQ04 Raider Attack: Sinner's gang now friends with: " + FactionsToFriend[i])

		i += 1
	endwhile
EndFunction