Scriptname DLC04:DLC04WorkshopParentScript extends WorkshopAddLocationsScript conditional

import WorkshopDataScript

WorkshopScript property DLC04NukaWorldWorkshopREF auto const mandatory
{ main raider base - automatically supply line linked to all raider settlements }

ObjectReference property DLC04_VassalCapsChestREF auto const mandatory 
{ container at Nuka World for vassal caps }

RefCollectionAlias Property PermanentActors Auto Const Mandatory
{Alias collection of permanent workshop actors on WorkshopPermanentActor script}

ReferenceAlias Property Alias_Shank auto const mandatory 
{ alias to Shank in DLC04RaiderKickout quest which is always running }

group quests
	MinutemenCentralScript property MinutemenCentralQuest auto const mandatory
	
	Quest property DLC04Kickout auto const mandatory

	REParentScript Property REParent Auto const mandatory

	Quest property DLC04CollectVassalIncomeMiscQuest auto const mandatory
endGroup

group actorValues
	ActorValue property DLC04WorkshopRaiderGangValue auto const mandatory
	{ 1 = Disciples, 2 = Operators, 3 = Pack}

	ActorValue property DLC04WorkshopRatingBooze auto const mandatory

	ActorValue property DLC04WorkshopRatingRaiderFlag auto const mandatory 
	{ all raider flags produce this rating, use to check if a flag has been built at a raider settlement }

	ActorValue property DLC04WorkshopRatingRaiderRadio auto const mandatory
	{ workshopRef.GetValue() > 0 indicates a raider radio transmitter exists in this settlement }

	ActorValue Property Safety Auto Const Mandatory
	{Workshop safety value}

	ActorValue Property DLC04WorkshopRaiderFirstTribute Auto Const Mandatory
	{ 0 if raider settlement has never delivered tribute, 1 after }
endGroup

group keywords 
	Keyword property WorkshopType02AlwaysExclude auto const mandatory 

	Keyword property DLC04WorkshopEventRaiderBeacon	auto const mandatory

	Keyword Property ObjectTypeAlcohol Auto Const mandatory

	Keyword property DLC04WorkshopRaiderGangValueKEYWORD	auto const mandatory
	{ used to set keyword data on raider settlement locations, since recipe conditions can't access workshop actor values }
endGroup

group factions 
	Faction Property WorkshopNPCFaction Auto const mandatory 

	Faction Property PlayerFaction Auto const mandatory 

	Faction[] Property RaiderGangFactions auto const
	{ array of raider gang factions - index = (gang value - 1)}

	Faction Property DLC04RaiderWorkshopNPCFaction Auto Const Mandatory
endGroup 

struct outpostMissingCount
	ActorValue valueToCheck
	GlobalVariable outpostCount
endStruct 

group globals 
	GlobalVariable property DLC04PlayerKickedOut auto const mandatory

	GlobalVariable property DLC04RaiderOutpostCount auto const mandatory 
	{ total number of raider outposts}

	GlobalVariable property DLC04EnemyGang auto const mandatory

	GlobalVariable[] property RaiderGangSettlementCount auto const 
	{ track each gang's settlement count, index matching DLC04WorkshopRaiderGangValue-1 }

	outpostMissingCount[] property RaiderSettlementMissingCounts auto const 
	{ array for updating globals which count how many outposts are missing one of the 4 happiness-related ratings }
endGroup

group specialCases 
	ReferenceAlias property SanctuaryWorkshop auto const mandatory 
	{ reserve Sanctuary until Min01 is over }

	Quest property Min01 auto const mandatory
	{ used to track Min01 state to clear Sanctuary reservation }

	int property Min01ReleaseReserveStage = 1500 auto const 
	{ release Sanctuary reservation when this stage of Min01 is done }

	WorkshopScript property FinchFarmWorkshopRef auto const mandatory 
	{ needs to be excluded until DN121 is running or complete }
	Quest property DN121 auto const mandatory 
endGroup 

group leveledItems
	; 100% production LVLs for vassal production
	LeveledItem Property DLC04WorkshopProduceFood Auto Const mandatory
	LeveledItem Property DLC04WorkshopProduceWater Auto Const mandatory
endGroup 
Perk[] property WastelandWarlordPerks auto const 
{ array of perks the player gets when building 1-3 raider outposts }

;PREVIOUS DLC QUESTS
; DLC01:
int iDLC01WorkshopBotRaiderAttack01 = 	0x0100FD17 const
int iDLC01WorkshopBotRaiderAttack02 = 	0x0100FD1B const
int iDLC01WorkshopRobotAttack01 = 		0x0100FD0D const
int iDLC01WorkshopRobotAttack02 = 		0x0100FD13 const

int iDLC01MechanistLairWorkshopRef = 	0x01000E4C const
; DLC01 faction
int iDLC01WorkshopRobotFaction = 		0x0100F47A const
Faction property DLC01WorkshopRobotFaction auto hidden 
{ this will get filled in when DLC01 loads }

; DLC01 Ada
int iDLC01Ada = 						0x0100FD5A const
ActorBase property DLC01Ada auto hidden 
{ this will get filled in when DLC01 loads }

; DLC02:
int iDLC02WorkshopDeathclawAttack01 = 	0x01000895 const
int iDLC02WorkshopDogAttack01 = 		0x01000831 const
int iDLC02WorkshopFeralGhoulAttack01 = 	0x01000CFB const
int iDLC02WorkshopGunnerAttack01 = 		0x01000896 const
int iDLC02WorkshopInsectAttack01 = 		0x01000CEC const
int iDLC02WorkshopMirelurkAttack01 = 	0x01000829 const
int iDLC02WorkshopMoleratAttack01 = 	0x01000838 const
int iDLC02WorkshopRadscorpionAttack01 = 0x01000897 const
int iDLC02WorkshopRaiderAttack01 = 		0x01000CEE const
int iDLC02WorkshopSuperMutantAttack01 = 0x01000898 const
int iDLC02WorkshopYaoGuaiAttack01 = 	0x0100090B const

int iDLC02WorkshopRatingArenaPlatform =	0x01000D11 const
ActorValue property DLC02WorkshopRatingArenaPlatform auto hidden 
{ this will get filled in when DLC02 loads }

int iDLC02WorkshopArenaCombatantFactionA =	0x0100085C const
Faction property DLC02WorkshopArenaCombatantFactionA auto hidden 
{ this will get filled in when DLC02 loads }
int iDLC02WorkshopArenaCombatantFactionB =	0x0100085D const
Faction property DLC02WorkshopArenaCombatantFactionB auto hidden 
{ this will get filled in when DLC02 loads }


; DLC03:
int iDLC03DaltonFarmWorkshopRef = 					0x01038EA8 const
int iDLC03LongfellowsCabinWorkshopRef = 			0x0102064C const
int iDLC03EchoLakeLumberWorkshopRef = 				0x0101C6AA const
int iDLC03NationalParkVisitorsCenterWorkshopRef = 	0x0100AB20 const


String sDLC01 = "DLCRobot.esm" const
String sDLC02 = "DLCWorkshop01.esm" const
String sDLC03 = "DLCCoast.esm" const

bool bDLC01EventsReady
bool bDLC02EventsReady
bool bDLC03EventsReady

FormList property BossLocRefTypeList auto const mandatory
LocationRefType property DLC04WorkshopRaiderRefType auto const mandatory 

ActorBase[] property WorkshopRaiders auto const 
{ array of workshop raiders - DLC04WorkshopRaiderGangValue-1 is the index }

Message property DLC04WorkshopVassalIncomeMessage auto const mandatory 
Message property DLC04WorkshopRaiderIncomeMessage auto const mandatory 
Message property DLC04WorkshopVassalIncomeMultipleMessage auto const mandatory 
Message property DLC04WorkshopRaiderIncomeMultipleMessage auto const mandatory 

LocationAlias property VassalLocation auto const mandatory 
{ alias for vassal income message name }

WorkshopScript[] Property RaiderWorkshops Auto
{ array of raider workshops in the Commonwealth. NOTE: NukaWorld is removed from this array }

WorkshopScript[] Property VassalWorkshops Auto
{ array of vassal workshops in the Commonwealth. }

WorkshopScript[] Property ExcludedWorkshops Auto const 
{ array of excluded workshops - used to init keyword}

bool Property bAllowRaiderRecruitment = false auto conditional 
{ set to TRUE to begin raider recruitment check on daily update (happens at end of MQ04) }

LeveledItem Property DLC04WorkshopProduceBooze Auto Const mandatory

FormList Property DLC04WorkshopAttackQuestList auto const mandatory 
{ list of workshop attack quests }

FormList Property DLC04WorkshopRaiderSettlementKeywordList auto const mandatory 
{ list of raider settlement keywords for assignment menu }

; custom event sent when raider settlement is created
CustomEvent DLC04WorkshopRaiderSettlementEvent

; custom event sent when vassal settlement is created
CustomEvent DLC04WorkshopVassalSettlementEvent

; custom event sent when raider radio transmitter is turned on/off
CustomEvent DLC04WorkshopRaiderTransmitterEvent

; custom event sent when raider radio transmitter is turned on/off
CustomEvent DLC04WorkshopVassalIncomeEvent

; recruiting NPC stuff
int iMaxSurplusNPCs = 5 const 						; for now, max number of unassigned NPCs - if you have this many or more, no new NPCs will arrive.
float attractNPCDailyChance = 0.1 const   			; for now, roll <= to this to attract an NPC each day, modified by happiness
int iMaxBonusAttractChancePopulation = 5 const 		; for now, there's a bonus attract chance until the total population reaches this value
int iBaseMaxNPCs = 10 const 							; base total NPCs that can be at a player's town - this is used in GetMaxWorkshopNPCs formula
float attractNPCHappinessMult = 0.5 const 			; multiplier on happiness to attraction chance

; vassal income
float vassalProductionMult = 0.5 const  			; percentage of base vassal production (food & water) that gets added to DLC04NukaWorldWorkshopREF on daily update
float vassalIncomePopulationMult = 3.0 const 		; multiplier on vassal population for daily caps income
int maxStoredFoodPerPopulation = 1 const 			; increase max for each population (TOTAL in all raider settlements)
float maxStoredWaterPerPopulation = 0.25 const 		; increase max for each population (ditto)
int minVassalFoodIncome = 4 const 					; minimum amount of food from any vassal
int maxStoredVassalIncome = 20000 const 			; once stored caps in DLC04_VassalCapsChestREF reaches this amount, don't add any more
float initialVassalIncomeMult = 5.0 const 			; multiplier on vassal income for caps added by SetVassalSettlement function
int maxStoredScavengeBase = 100 const 				; stop producing when we reach this amount stored
int maxStoredScavengePerPopulation = 5 const 		; increase max for each population

float raiderPopulationCapsMultiplier = 3.0 const 	; multiplier on total raider population for daily caps income
float raiderPopulationMinHappiness = 30.0 const  	; min happiness for raider population increase; also min happiness for caps multiplier
float raiderCapsIncomeFirstTributeMultiplier = 10.0 const ; mult on daily caps income for first delivery

; raider farming happiness penalty
float raiderFarmingHappinessPenalty = -3.0 const 	; multiply food production to get happiness penalty

; booze production 
int maxStoredBooze = 50 const 					; stop producing when we reach this amount stored

Group RaiderRadioData
	ObjectReference Property RaiderRadioRef Auto Const
	Keyword Property DLC04WorkshopRaiderRadioObject Auto Const
endGroup
float raiderRadioInnerRadius = 60000.0
float raiderRadioOuterRadius = 100000.0

function Init()
	; register for update events
	RegisterForCustomEvent(WorkshopParent, "WorkshopDailyUpdate")

	; so we can check for DLCs loaded
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	bDLC01EventsReady = bDLC01EventsReady || CheckForDLC01()
	bDLC02EventsReady = bDLC02EventsReady || CheckForDLC02()
	bDLC03EventsReady = bDLC03EventsReady || CheckForDLC03()

	; register for assign events (for happiness penalty)
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorAssignedToWork")
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorUnassigned")
	; register for ownership change events (for raider outpost tracking)
	RegisterForCustomEvent(WorkshopParent, "WorkshopPlayerOwnershipChanged")

	; add new loc ref type to Boss form list
	BossLocRefTypeList.AddForm(DLC04WorkshopRaiderRefType)

	; init "always exclude" settlements
	int i = 0
	while i < ExcludedWorkshops.Length 
		ExcludedWorkshops[i].AddKeyword(WorkshopType02AlwaysExclude)
		i += 1
	endWhile

	CheckSpecialReservations()

	; init Nuka-World
	SetRaiderSettlement(DLC04NukaWorldWorkshopREF, 0) ; owned by no gang
endFunction

;need this event, in case the player installs the other DLC AFTER installing this one
Event Actor.OnPlayerLoadGame(actor akSource)
	bDLC01EventsReady = bDLC01EventsReady || CheckForDLC01()
	bDLC02EventsReady = bDLC02EventsReady || CheckForDLC02()
	bDLC03EventsReady = bDLC03EventsReady || CheckForDLC03()
EndEvent

bool Function CheckForDLC01()
	if Game.IsPluginInstalled(sDLC01)
		debug.trace(self + " CheckForDLC01 - FOUND")

		Quest DLC01WorkshopBotRaiderAttack01 = Game.GetFormFromFile(iDLC01WorkshopBotRaiderAttack01, sDLC01) as Quest
		Quest DLC01WorkshopBotRaiderAttack02 = Game.GetFormFromFile(iDLC01WorkshopBotRaiderAttack02, sDLC01) as Quest
		Quest DLC01WorkshopRobotAttack01 = Game.GetFormFromFile(iDLC01WorkshopRobotAttack01, sDLC01) as Quest
		Quest DLC01WorkshopRobotAttack02 = Game.GetFormFromFile(iDLC01WorkshopRobotAttack02, sDLC01) as Quest

		DLC04WorkshopAttackQuestList.AddForm(DLC01WorkshopBotRaiderAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC01WorkshopBotRaiderAttack02)
		DLC04WorkshopAttackQuestList.AddForm(DLC01WorkshopRobotAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC01WorkshopRobotAttack02)

		ObjectReference DLC01MechanistLairWorkshopRef = Game.GetFormFromFile(iDLC01MechanistLairWorkshopRef, sDLC01) as ObjectReference
		DLC01MechanistLairWorkshopRef.AddKeyword(WorkshopType02AlwaysExclude)
		debug.trace(self + " add always exclude keyword to " + DLC01MechanistLairWorkshopRef )

		; get robot faction
		DLC01WorkshopRobotFaction = Game.GetFormFromFile(iDLC01WorkshopRobotFaction, sDLC01) as Faction
		; get Ada
		DLC01Ada = Game.GetFormFromFile(iDLC01Ada, sDLC01) as ActorBase

		return true
	else
		return false
	endif
EndFunction

bool Function CheckForDLC02()
	if Game.IsPluginInstalled(sDLC02)
		debug.trace(self + " CheckForDLC02 - FOUND")

		Quest DLC02WorkshopDeathclawAttack01 = Game.GetFormFromFile(iDLC02WorkshopDeathclawAttack01, sDLC02) as Quest
		Quest DLC02WorkshopDogAttack01 = Game.GetFormFromFile(iDLC02WorkshopDogAttack01, sDLC02) as Quest
		Quest DLC02WorkshopFeralGhoulAttack01 = Game.GetFormFromFile(iDLC02WorkshopFeralGhoulAttack01, sDLC02) as Quest
		Quest DLC02WorkshopGunnerAttack01 = Game.GetFormFromFile(iDLC02WorkshopGunnerAttack01, sDLC02) as Quest
		Quest DLC02WorkshopInsectAttack01 = Game.GetFormFromFile(iDLC02WorkshopInsectAttack01, sDLC02) as Quest
		Quest DLC02WorkshopMirelurkAttack01 = Game.GetFormFromFile(iDLC02WorkshopMirelurkAttack01, sDLC02) as Quest
		Quest DLC02WorkshopMoleratAttack01 = Game.GetFormFromFile(iDLC02WorkshopMoleratAttack01, sDLC02) as Quest
		Quest DLC02WorkshopRadscorpionAttack01 = Game.GetFormFromFile(iDLC02WorkshopRadscorpionAttack01, sDLC02) as Quest
		Quest DLC02WorkshopRaiderAttack01 = Game.GetFormFromFile(iDLC02WorkshopRaiderAttack01, sDLC02) as Quest
		Quest DLC02WorkshopSuperMutantAttack01 = Game.GetFormFromFile(iDLC02WorkshopSuperMutantAttack01, sDLC02) as Quest
		Quest DLC02WorkshopYaoGuaiAttack01 = Game.GetFormFromFile(iDLC02WorkshopYaoGuaiAttack01, sDLC02) as Quest

		DLC02WorkshopRatingArenaPlatform = Game.GetFormFromFile(iDLC02WorkshopRatingArenaPlatform, sDLC02) as ActorValue
		DLC02WorkshopArenaCombatantFactionA = Game.GetFormFromFile(iDLC02WorkshopArenaCombatantFactionA, sDLC02) as Faction
		DLC02WorkshopArenaCombatantFactionB = Game.GetFormFromFile(iDLC02WorkshopArenaCombatantFactionB, sDLC02) as Faction

		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopDeathclawAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopDogAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopFeralGhoulAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopGunnerAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopInsectAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopMirelurkAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopMoleratAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopRadscorpionAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopRaiderAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopSuperMutantAttack01)
		DLC04WorkshopAttackQuestList.AddForm(DLC02WorkshopYaoGuaiAttack01)
		return true
	else
		return false
	endif
EndFunction

bool Function CheckForDLC03()
	if Game.IsPluginInstalled(sDLC03)
		debug.trace(self + " CheckForDLC03 - FOUND")

		ObjectReference DLC03DaltonFarmWorkshopRef = Game.GetFormFromFile(iDLC03DaltonFarmWorkshopRef, sDLC03) as ObjectReference
		ObjectReference DLC03LongfellowsCabinWorkshopRef = Game.GetFormFromFile(iDLC03LongfellowsCabinWorkshopRef, sDLC03) as ObjectReference
		ObjectReference DLC03EchoLakeLumberWorkshopRef = Game.GetFormFromFile(iDLC03EchoLakeLumberWorkshopRef, sDLC03) as ObjectReference
		ObjectReference DLC03NationalParkVisitorsCenterWorkshopRef = Game.GetFormFromFile(iDLC03NationalParkVisitorsCenterWorkshopRef, sDLC03) as ObjectReference

		DLC03DaltonFarmWorkshopRef.AddKeyword(WorkshopType02AlwaysExclude)
		DLC03LongfellowsCabinWorkshopRef.AddKeyword(WorkshopType02AlwaysExclude)
		DLC03EchoLakeLumberWorkshopRef.AddKeyword(WorkshopType02AlwaysExclude)
		DLC03NationalParkVisitorsCenterWorkshopRef.AddKeyword(WorkshopType02AlwaysExclude)
		debug.trace(self + " add always exclude keyword to " + DLC03DaltonFarmWorkshopRef )
		debug.trace(self + " add always exclude keyword to " + DLC03LongfellowsCabinWorkshopRef )
		debug.trace(self + " add always exclude keyword to " + DLC03EchoLakeLumberWorkshopRef )
		debug.trace(self + " add always exclude keyword to " + DLC03NationalParkVisitorsCenterWorkshopRef )

		return true
	else
		return false
	endif
EndFunction

function CheckSpecialReservations()
	debug.trace(self + " CheckSpecialReservations")
	if Min01.GetStageDone(Min01ReleaseReserveStage)
		; clear Sanctuary reserved alias
		SanctuaryWorkshop.Clear()
		; no need to watch for this event any more
		UnregisterForRemoteEvent(Min01, "OnStageSet")
	else 
		; watch for that stage being done
		RegisterForRemoteEvent(Min01, "OnStageSet")
	endif

	; DN121 - if not running and not done, exclude Finch workshop and watch for quest update
	if DN121.IsRunning() == false && DN121.IsCompleted() == false 
		FinchFarmWorkshopRef.AddKeyword(WorkshopType02AlwaysExclude)
		RegisterForRemoteEvent(DN121, "OnStageSet")
	else 
		FinchFarmWorkshopRef.RemoveKeyword(WorkshopType02AlwaysExclude)
		UnregisterForRemoteEvent(DN121, "OnStageSet")
	endif

endFunction 

Event Quest.OnStageSet(Quest akSource, int auiStageID, int auiItemID)
	CheckSpecialReservations()
endEvent 

Event WorkshopParentScript.WorkshopDailyUpdate(WorkshopParentScript akSender, Var[] akArgs)
	Debug.Trace(self + " WorkshopDailyUpdate event received")

	; create local pointer to WorkshopRatings array to speed things up
	WorkshopDataScript:WorkshopRatingKeyword[] ratings = WorkshopParent.WorkshopRatings

	; look for raider settlements
	int i = 0
	int totalRaiderPopulation = 0
	; calculate average happiness for caps calculation
	float raiderHappiness = 0.0

	int ownedRaiderOutposts = 0
	while i < RaiderWorkshops.Length 
		WorkshopScript workshopRef = RaiderWorkshops[i]
		int raiderPopulation = workshopRef.GetBaseValue(ratings[WorkshopParent.WorkshopRatingPopulation].resourceValue) as int
		totalRaiderPopulation += raiderPopulation
		if raiderPopulation > 0
			raiderHappiness = workshopRef.GetValue(ratings[WorkshopParent.WorkshopRatingHappiness].resourceValue) * raiderPopulation/totalRaiderPopulation + raiderHappiness * (totalRaiderPopulation - raiderPopulation) / totalRaiderPopulation
			if workshopRef.OwnedByPlayer
				debug.trace(self + "  found owned raider outpost: " + workshopRef)
				ownedRaiderOutposts += 1
				VassalLocation.ForceLocationTo(workshopRef.myLocation)
			endif
		endif
		DailyUpdateRaiderSettlement(ratings, workshopRef)
		i += 1
	endWhile

	; show messages
	if ownedRaiderOutposts > 0
		if ownedRaiderOutposts == 1
			debug.trace(self + "  use single raider income message")
			DLC04WorkshopRaiderIncomeMessage.Show()
		else 
			debug.trace(self + "  use multiple raider income message")
			DLC04WorkshopRaiderIncomeMultipleMessage.Show()
		endif 
		if DLC04CollectVassalIncomeMiscQuest.GetStageDone(10) == false 
			DLC04CollectVassalIncomeMiscQuest.SetStage(10)
		endif
	endif	

	; look for vassal settlements
	i = 0
	int vassalCount = 0
	WorkshopScript vassalWorkshop
	while i < WorkshopParent.Workshops.Length 
		WorkshopScript workshopRef = WorkshopParent.Workshops[i]
		if workshopRef.HasKeyword(WorkshopParent.WorkshopType02Vassal)
			debug.trace(self + "  found vassal settlement: " + workshopRef)
			vassalWorkshop = workshopRef
			vassalCount += 1
			DailyUpdateVassalIncome(ratings, totalRaiderPopulation, workshopRef, 1.0, raiderHappiness)
		endif
		i += 1
	endWhile

	; show messages
	if vassalCount == 1
		VassalLocation.ForceLocationTo(vassalWorkshop.myLocation)
		debug.trace(self + "  use single vassal income message")
		DLC04WorkshopVassalIncomeMessage.Show()
	elseif vassalCount > 1
		debug.trace(self + "  use multiple vassal ncome message")
		DLC04WorkshopVassalIncomeMultipleMessage.Show()
	endif

	; updating "missing rating" counts
	UpdateMissingRatingGlobals()	
EndEvent

; returns actor value for this workshop's raider gang, if any
int function GetRaiderGangValue(WorkshopScript workshopRef)
	return workshopRef.GetValue(DLC04WorkshopRaiderGangValue) as int
endFunction

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopPlayerOwnershipChanged")
	if (akArgs.Length > 0)
		bool bPlayerOwned = akArgs[0] as bool
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if bPlayerOwned == false && RaiderWorkshops.Find(workshopRef) > -1
			; update global
			UpdateRaiderOutpostCount()
			; send custom event - count this as "removed" since it is no longer player owned
			Var[] kargs = new Var[3]
			kargs[0] = workshopRef
			kargs[1] = false
			kargs[2] = 0
			SendCustomEvent("DLC04WorkshopRaiderSettlementEvent", kargs)		
		endif 
	endif
endEvent 

function SetRaiderSettlement(WorkshopScript workshopRef, int raiderGangValue)
	if DLC04PlayerKickedOut.GetValue() == 0.0
		debug.trace(self + " SetRaiderSettlement: " + workshopRef + ", gang=" + raiderGangValue)
		
		; ignore calls to set this for enemy gang
		if raiderGangValue != DLC04EnemyGang.GetValue()
			; first clear any previous data for safety
			ClearRaiderSettlement(workshopRef)
			
			; raider settlements can't be lost from happiness
			workshopRef.AllowUnownedFromLowHappiness = false 

			; now add new raider data
			workshopRef.AddKeyword(WorkshopParent.WorkshopType02)
			workshopRef.myLocation.SetKeywordData(WorkshopParent.WorkshopType02, 1.0)
			workshopRef.myLocation.SetKeywordData(DLC04WorkshopRaiderGangValueKEYWORD, raiderGangValue)
			workshopRef.SetValue(DLC04WorkshopRaiderGangValue, raiderGangValue)
			workshopRef.myLocation.AddLinkedLocation(DLC04NukaWorldWorkshopREF.myLocation, WorkshopParent.WorkshopCaravanKeyword)
			if RaiderWorkshops == NONE 
				RaiderWorkshops = new WorkshopScript[0]
			endif

			; make player owned
			workshopRef.SetOwnedByPlayer(true)

			if workshopRef != DLC04NukaWorldWorkshopREF && RaiderWorkshops.Find(workshopRef) == -1 ; never add Nuka World to the outpost list
				RaiderWorkshops.Add(workshopRef)
				UpdateRaiderOutpostCount()
				if raiderGangValue > 0
					; increment settlement count for this gang
					RaiderGangSettlementCount[raiderGangValue-1].Mod(1)
				endif
			endif

			RegisterForWorkshopEvents(workshopRef, true)

			; send custom event
			Var[] kargs = new Var[3]
			kargs[0] = workshopRef
			kargs[1] = true
			kargs[2] = raiderGangValue
			SendCustomEvent("DLC04WorkshopRaiderSettlementEvent", kargs)		
		endif
	else 
		debug.trace(self + " SetRaiderSettlement: IGNORE - trying to set to enemy gang")
	endif
endFunction

function RegisterForWorkshopEvents(WorkshopScript workshopRef, bool bRegister)
	if bRegister
		; register for location cleared events
		RegisterForRemoteEvent(workshopRef.myLocation, "OnLocationCleared")
		; register for workshop menu events
		RegisterForRemoteEvent(workshopRef, "OnWorkshopMode")
		; watch for things being built
		RegisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
	else 
		; register for location cleared events
		UnregisterForRemoteEvent(workshopRef.myLocation, "OnLocationCleared")
		; register for workshop menu events
		UnregisterForRemoteEvent(workshopRef, "OnWorkshopMode")

		UnregisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
	endif
endFunction 

function SetVassalSettlement(WorkshopScript workshopRef, int raiderGangValue)
	if DLC04PlayerKickedOut.GetValue() == 0.0 
		if workshopRef.GetBaseValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingPopulation].resourceValue) > 0
			debug.trace(self + " SetVassalSettlement " + workshopRef)
			workshopRef.AddKeyword(WorkshopParent.WorkshopType02Vassal)
			workshopRef.myLocation.SetKeywordData(WorkshopParent.WorkshopType02Vassal, 1.0)
			workshopRef.SetValue(DLC04WorkshopRaiderGangValue, raiderGangValue)

			if VassalWorkshops == NONE 
				VassalWorkshops = new WorkshopScript[0]
			endif
			if VassalWorkshops.Find(workshopRef) == -1
				VassalWorkshops.Add(workshopRef)
			endif

			RegisterForWorkshopEvents(workshopRef, true)

			; send custom event
			Var[] kargs = new Var[3]
			kargs[0] = workshopRef
			kargs[1] = true
			kargs[2] = raiderGangValue
			SendCustomEvent("DLC04WorkshopVassalSettlementEvent", kargs)
		else 
			debug.trace(self + " SetVassalSettlement: " + workshopRef + " has 0 population - do not set as vassal")
		endif		
	endif
endFunction

function ClearRaiderSettlement(WorkshopScript workshopRef)
	debug.trace(self + " ClearRaiderSettlement: " + workshopRef)
	bool bIsVassal = workshopRef.HasKeyword(WorkshopParent.WorkshopType02Vassal)
	workshopRef.RemoveKeyword(WorkshopParent.WorkshopType02)
	workshopRef.RemoveKeyword(WorkshopParent.WorkshopType02Vassal)
	if workshopRef.myLocation
		workshopRef.myLocation.SetKeywordData(WorkshopParent.WorkshopType02, 0.0)
		workshopRef.myLocation.SetKeywordData(WorkshopParent.WorkshopType02Vassal, 0.0)
		workshopRef.myLocation.SetKeywordData(DLC04WorkshopRaiderGangValueKEYWORD, 0.0)
		workshopRef.myLocation.RemoveLinkedLocation(DLC04NukaWorldWorkshopREF.myLocation, WorkshopParent.WorkshopCaravanKeyword)
	endif

	if workshopRef.myMapMarker
		; update map marker
		workshopRef.myMapMarker.AddToMap()
	endif
	
	int raiderGangValue = workshopRef.GetValue(DLC04WorkshopRaiderGangValue) as int

	workshopRef.SetValue(DLC04WorkshopRaiderGangValue, 0)
	int index = RaiderWorkshops.Find(workshopRef)
	if index > -1
		RaiderWorkshops.Remove(index)
		UpdateRaiderOutpostCount()
		; decrement settlement count for this gang
		RaiderGangSettlementCount[raiderGangValue-1].Mod(-1)

		if workshopRef.Is3DLoaded()
			; set turret factions back to workshop owner faction
			MakeTurretsHostile(workshopRef, bMakeHostile = false)
		endif

		; send custom event
		Var[] kargs = new Var[3]
		kargs[0] = workshopRef
		kargs[1] = false
		kargs[2] = 0
		SendCustomEvent("DLC04WorkshopRaiderSettlementEvent", kargs)		
	endif

	if bIsVassal
		index = VassalWorkshops.Find(workshopRef)
		if index > -1
			VassalWorkshops.Remove(index)
		endif		
		; send custom event
		Var[] kargs = new Var[3]
		kargs[0] = workshopRef
		kargs[1] = false
		kargs[2] = 0
		SendCustomEvent("DLC04WorkshopVassalSettlementEvent", kargs)		
	endif

	; unregister for events
	RegisterForWorkshopEvents(workshopRef, false)
endFunction

function UpdateRaiderOutpostCount()
	debug.trace(self + " UpdateRaiderOutpostCount")
	; recalculate each time to make sure stays correct
	int i = 0
	int count = 0
	while i < RaiderWorkshops.Length 
		if RaiderWorkshops[i].OwnedByPlayer
			count += 1
		endif
		i += 1
	endWhile 
	debug.trace(self + " UpdateRaiderOutpostCount: count=" + count)
	DLC04RaiderOutpostCount.SetValue(count)
endFunction 

function DailyUpdateApplyHappinessPenalty(WorkshopDataScript:WorkshopRatingKeyword[] ratings, WorkshopScript workshopRef)
	; set happiness penalty for farmers
	int foodProduction = workshopRef.GetValue(ratings[WorkshopParent.WorkshopRatingFood].resourceValue) as int
	float happinessPenalty = foodProduction * raiderFarmingHappinessPenalty
	debug.trace(self +  " DailyUpdateApplyHappinessPenalty: " + workshopRef + ": happiness penalty = " + happinessPenalty)
	WorkshopParent.SetHappinessModifier(workshopRef, happinessPenalty)

	; update happiness stats
	workshopRef.DailyUpdate(false) ; not a "real" update, just to recalc happiness
endfunction 

function DailyUpdateRaiderSettlement(WorkshopDataScript:WorkshopRatingKeyword[] ratings, WorkshopScript workshopRef)
	debug.trace(self + " DailyUpdateRaiderSettlement " + workshopRef)
	if DLC04PlayerKickedOut.GetValue() == 0.0
		; update happiness for farming
		DailyUpdateApplyHappinessPenalty(ratings, workshopRef)

		int totalPopulation = workshopRef.GetBaseValue(ratings[WorkshopParent.WorkshopRatingPopulation].resourceValue) as int
		float currentHappiness = workshopRef.GetValue(ratings[WorkshopParent.WorkshopRatingHappiness].resourceValue)

		; special production
		int boozeProduction = workshopRef.GetValue(DLC04WorkshopRatingBooze) as int 
		if boozeProduction > 0
			int currentStoredBooze = workshopRef.GetItemCount(ObjectTypeAlcohol)

			bool bAllowBoozeProduction = true
			if currentStoredBooze > maxStoredBooze
				bAllowBoozeProduction = false
			endif

			if bAllowBoozeProduction
				debug.trace(self + " DailyUpdateRaiderSettlement: " + workshopRef + " PRODUCE " + boozeProduction + " BOOZE")
				workshopRef.AddItem(DLC04WorkshopProduceBooze, boozeProduction)
			endif
		endif 

		; add caps from total raider population
		if totalPopulation > 0 && workshopRef.OwnedByPlayer
			float raiderHappiness = Math.Max(raiderPopulationMinHappiness, currentHappiness) ; use min happiness for this calculation
			int caps = math.floor( ( totalPopulation as float ) * raiderPopulationCapsMultiplier * raiderHappiness / 100.0 )
			if workshopRef.GetValue(DLC04WorkshopRaiderFirstTribute) == 0
				workshopRef.SetValue(DLC04WorkshopRaiderFirstTribute, 1)
				caps = math.floor(caps * raiderCapsIncomeFirstTributeMultiplier)
			endif
			debug.trace(self + " DailyUpdateRaiderSettlement: generate " + caps + " caps from raider population")

			int currentCaps = DLC04_VassalCapsChestREF.GetItemCount(Game.GetCaps())

			if currentCaps < maxStoredVassalIncome
				debug.trace(self + " DailyUpdateRaiderSettlement - add " + caps + " caps to Nuka World")
				DLC04_VassalCapsChestREF.AddItem(Game.GetCaps(), caps)
			else 
				debug.trace(self + " Caps in DLC04_VassalCapsChestREF are at max (" + currentCaps + ") - don't add any more")
			endif 
		endif

		; attract new NPCs
		if bAllowRaiderRecruitment
			if totalPopulation < workshopRef.GetMaxWorkshopNPCs() && currentHappiness >= raiderPopulationMinHappiness
				;WorkshopParent.wsTrace(self + "       RADIO - unassigned population=" + updateData.unassignedPopulation)
				float attractChance = attractNPCDailyChance + currentHappiness/100 * attractNPCHappinessMult
				if totalPopulation == 0
					attractChance = 1.0 ; 100% chance to attract if 0 raiders
				elseif totalPopulation < iMaxBonusAttractChancePopulation
					attractChance += (iMaxBonusAttractChancePopulation - totalPopulation) * attractNPCDailyChance
				endif

				; roll to see if a new NPC arrives
				float dieRoll = utility.RandomFloat()
				;WorkshopParent.wsTrace(self + "			dieRoll=" + dieRoll + ", attract NPC chance=" + attractChance)

				if dieRoll <= attractChance
					WorkshopNPCScript newWorkshopActor = CreateRaider(workshopRef)
					totalPopulation += 1
					; now recalc all workshop resources if the current workshop - we don't want to do this when unloaded or everything will be 0
					workshopRef.RecalculateWorkshopResources()
				endif
			endif
		endif
	endif
endFunction

WorkshopNPCScript function CreateRaider(WorkshopScript workshopRef, ObjectReference spawnMarker = NONE)
	if spawnMarker == NONE
		spawnMarker = workshopRef.GetLinkedRef(WorkshopParent.WorkshopLinkSpawn)
	endif

	; use raider gang value to get base actor to use
	actorBase newActorBase
	int raiderGangValue = GetRaiderGangValue(workshopRef)
	if raiderGangValue > 0
		newActorBase = WorkshopRaiders[raiderGangValue - 1]
	endif

	if newActorBase 
		Actor newActor = spawnMarker.PlaceAtMe(newActorBase, abDeleteWhenAble = false) as Actor
		; flag as "new"
		WorkshopNPCScript newWorkshopActor = newActor as WorkShopNPCScript
		newWorkshopActor.bNewSettler = true

		WorkshopParent.AddActorToWorkshop(newWorkshopActor, workshopRef)

		newWorkshopActor.SetValue(WorkshopParent.WorkshopGuardPreference, 1.0)

		; try to automatically assign to do something:
		WorkshopParent.TryToAutoAssignActor(workshopRef, newWorkshopActor)

		debug.trace(self + "  CreateRaider for " + workshopRef + ": " + newWorkshopActor)
		return newWorkshopActor
	else 
		return NONE
	endif
endFunction

; use this function when adding raiders to make sure they get set up correctly
function AddRaiderToWorkshop(WorkshopNPCScript workshopNPC, WorkshopScript workshopRef)
	WorkshopParent.AddActorToWorkshopPUBLIC(workshopNPC, workshopRef)
	workshopNPC.RemoveFromFaction(WorkshopNPCFaction)
endFunction 

Event Location.OnLocationCleared(Location akSender)
	debug.trace(self + " OnLocationCleared " + akSender)
	WorkshopScript workshopRef = WorkshopParent.GetWorkshopFromLocation(akSender)
	if workshopRef && ( workshopRef.HasKeyword(WorkshopParent.WorkshopType02) || workshopRef.HasKeyword(WorkshopParent.WorkshopType02Vassal) )
		if workshopRef.HasKeyword(WorkshopParent.WorkshopType02) && workshopRef.OwnedByPlayer
			; faction kickout
			DLC04Kickout.SetStage(20)
		endif

		;#102790 - If this is a vassal location...
		if workshopref.HasKeyword(WorkshopParent.WorkshopType02Vassal) 
			;Roll through the permanent actors ref collection
			;If any of them are at this location and alive, don't clear the spot
			if !PermanentActorsAliveAndPresent(akSender)
				ClearRaiderSettlement(workshopRef)
			endif
		else
			;Otherwise, just clear it.
			ClearRaiderSettlement(workshopRef)
		endif
	endif
endEvent

Event ObjectReference.OnWorkshopMode(ObjectReference akSource, bool aStart)
	; update missing rating counts on exit
	if aStart == false
		UpdateMissingRatingGlobals()
	endif 
endEvent 

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	CheckForUnhappinessPenalty(akArgs, true)
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	CheckForUnhappinessPenalty(akArgs, false)
EndEvent

function CheckForUnhappinessPenalty(Var[] akArgs, bool bAssignedToWork)
	; if this is a raider workshop, update happiness penalty for farming
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript

		if workshopRef.HasKeyword(WorkshopParent.WorkshopType02)
			debug.trace(self + " WorkshopActorAssignedToWork received from raider settlement " + workshopRef)
			if newObject.GetBaseValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingFood].resourceValue) > 0
				; create local pointer to WorkshopRatings array to speed things up
				WorkshopDataScript:WorkshopRatingKeyword[] ratings = WorkshopParent.WorkshopRatings
				DailyUpdateApplyHappinessPenalty(ratings, workshopRef)
			endif
			; special handling for raider assigned to arena platform - have to start combat manually
			if DLC02WorkshopRatingArenaPlatform && newObject.GetBaseValue(DLC02WorkshopRatingArenaPlatform) > 0
				; arena platform
				if bAssignedToWork
					; get actor
					Actor arenaCombatant = newObject.GetActorRefOwner()
					Faction enemyFaction 
					if arenaCombatant && arenaCombatant.IsInFaction(DLC02WorkshopArenaCombatantFactionA)
						enemyFaction = DLC02WorkshopArenaCombatantFactionB
					else 
						enemyFaction = DLC02WorkshopArenaCombatantFactionA
					endif
					; try to find another enemy to attack
					ObjectReference[] arenaPlatforms = WorkshopParent.GetResourceObjects(workshopRef, DLC02WorkshopRatingArenaPlatform)
					debug.trace(self + "       arenaPlatforms=" + arenaPlatforms)
					; find actors in the enemy arena faction
					int i = 0
					while i < arenaPlatforms.Length
						ObjectReference thePlatform = arenaPlatforms[i]
						if thePlatform && thePlatform.GetBaseObject() != newObject.GetBaseObject() && thePlatform.HasActorRefOwner()
							; get owner and see if enemy
							Actor theNPC = thePlatform.GetActorRefOwner()
							debug.trace(self + "       " + i + ": " + thePlatform + " owned by " + theNPC)
							if theNPC && theNPC.IsInFaction(enemyFaction)
								debug.trace(self + "       " + theNPC + " is in " + enemyFaction + " faction - start combat")
								theNPC.StartCombat(arenaCombatant)
								arenaCombatant.StartCombat(theNPC)
							endif
						endif
						i += 1
					endWhile
				endif
			endif
			;#102671 - If this NPC has been assigned to work
			;remove the workshopNPCfaction if they're a Raider
			if bAssignedToWork
				;get the actor
				Actor theActor = newObject.GetActorRefOwner()
				if theActor && theActor.IsInFaction(DLC04RaiderWorkshopNPCFaction)
					theActor.RemoveFromFaction(workshopNPCFaction)
				endif
			endif
		endif
	endif

endFunction

; Call this function when you want to award initial vassal income from a new vassal (workshopRef)
function InitialVassalIncome(WorkshopScript workshopRef)
	debug.trace(self + " InitialVassalIncome for " + workshopRef)
	; transfer some resources right away
	DailyUpdateVassalIncome(WorkshopParent.WorkshopRatings, 0, workshopRef, initialVassalIncomeMult, bShowMessage = true)
endFunction 

function DailyUpdateVassalIncome(WorkshopDataScript:WorkshopRatingKeyword[] ratings, int totalRaiderPopulation, WorkshopScript workshopRef, float incomeMultiplier = 1.0, float raiderHappiness = 0.0, bool bShowMessage = false)
	debug.trace(self + " DailyUpdateVassalIncome " + workshopRef + ": totalRaiderPopulation=" + totalRaiderPopulation + ", raiderHappiness=" + raiderHappiness + ", bShowMessage=" + bShowMessage)

	; if totalRaiderPopulation not passed in, calculate it
	if totalRaiderPopulation == 0
		; look for raider settlements
		int i = 0
		while i < RaiderWorkshops.Length 
			WorkshopScript theWorkshop = RaiderWorkshops[i]
			debug.trace(self + "  getting raider population from " + theWorkshop)
			totalRaiderPopulation += theWorkshop.GetBaseValue(ratings[WorkshopParent.WorkshopRatingPopulation].resourceValue) as int
			i += 1
		endWhile
	endif 
	debug.trace(self + " DailyUpdateVassalIncome - total raider population = " + totalRaiderPopulation)

	; get base food & water production
	int foodProduction = math.Floor(workshopRef.GetValue(ratings[WorkshopParent.WorkshopRatingFood].resourceValue) * vassalProductionMult * incomeMultiplier)
	foodProduction = math.Max(foodProduction, minVassalFoodIncome) as int ; vassals always provide some food
	debug.trace(self + " DailyUpdateVassalIncome - food production=" + foodProduction)

	int waterProduction = math.Floor(workshopRef.GetValue(ratings[WorkshopParent.WorkshopRatingWater].resourceValue) * vassalProductionMult * incomeMultiplier)

	; get stored at Nuka World
	int currentStoredFood = DLC04NukaWorldWorkshopREF.GetItemCount(WorkshopParent.WorkshopConsumeFood)
	int currentStoredWater = DLC04NukaWorldWorkshopREF.GetItemCount(WorkshopParent.WorkshopConsumeWater)
	debug.trace(self + " DailyUpdateVassalIncome - stored food=" + currentStoredFood + ", stored water=" + currentStoredWater)

	; don't produce if already at max stored (increases with more raiders)
	bool bAllowFoodProduction = true
	if currentStoredFood > maxStoredFoodPerPopulation * totalRaiderPopulation
		bAllowFoodProduction = false
	endif

	bool bAllowWaterProduction = true
	if currentStoredWater > math.floor(maxStoredWaterPerPopulation * totalRaiderPopulation)
		bAllowWaterProduction = false
	endif

	if foodProduction > 0 && bAllowFoodProduction
		ProduceFood(workshopRef, foodProduction)
	endif
	if waterProduction > 0 && bAllowWaterProduction
		debug.trace(self + " DailyUpdateVassalIncome - add " + waterProduction + " water to Nuka World")
		DLC04NukaWorldWorkshopREF.AddItem(DLC04WorkshopProduceWater, waterProduction)
	endif

	; scavenging
	bool bAllowScavengeProduction = true
	int currentStoredScavenge = DLC04NukaWorldWorkshopREF.GetItemCount(WorkshopParent.WorkshopConsumeScavenge)
	if currentStoredScavenge > maxStoredScavengeBase + maxStoredScavengePerPopulation * totalRaiderPopulation
		bAllowScavengeProduction = false
	endif
	if bAllowScavengeProduction
		int scavengeProduction = math.Floor(workshopRef.GetBaseValue(ratings[WorkshopParent.WorkshopRatingPopulation].resourceValue) * vassalProductionMult * incomeMultiplier)
		debug.trace(self + " DailyUpdateVassalIncome - add " + scavengeProduction + " junk to Nuka World")
		DLC04NukaWorldWorkshopREF.AddItem(WorkshopParent.WorkshopProduceScavenge, scavengeProduction)
	endif

	; caps
	int caps = math.Floor(workshopRef.GetBaseValue(ratings[WorkshopParent.WorkshopRatingPopulation].resourceValue) * vassalIncomePopulationMult * incomeMultiplier)
	debug.trace(self + " DailyUpdateVassalIncome - add " + caps + " caps from vassal population")
	int currentCaps = DLC04_VassalCapsChestREF.GetItemCount(Game.GetCaps())

	if currentCaps < maxStoredVassalIncome
		debug.trace(self + " DailyUpdateVassalIncome - add " + caps + " caps to Nuka World")
		DLC04_VassalCapsChestREF.AddItem(Game.GetCaps(), caps)
	else 
		debug.trace(self + " Caps in DLC04_VassalCapsChestREF are at max (" + currentCaps + ") - don't add any more")
	endif 

	; show message
	if bShowMessage
		debug.trace(self + " Displaying vassal income message for " + workshopRef)
		VassalLocation.ForceLocationTo(workshopRef.myLocation)
		DLC04WorkshopVassalIncomeMessage.Show()
	endif

	; send custom event
	Var[] kargs = new Var[1]
	kargs[0] = workshopRef
	SendCustomEvent("DLC04WorkshopVassalIncomeEvent", kargs)		
endFunction

function ProduceFood(WorkshopScript workshopref, int totalFoodToProduce)
	if totalFoodToProduce > 0
		; randomly produce food based on what kinds of crops are at this workshop

		; get local copy to speed things up
		WorkshopDataScript:WorkshopFoodType[] WorkshopFoodTypes = WorkshopParent.WorkshopFoodTypes 

		; get % chance of each food type
		float[] foodTypeChance = new float[WorkshopFoodTypes.Length]

		int i = 0
		while i < WorkshopParent.WorkshopFoodTypes.Length
			ActorValue foodType = WorkshopFoodTypes[i].resourceValue
			foodTypeChance[i] = workshopRef.GetValue(foodType)/totalFoodToProduce
			debug.trace(self + " " + foodType + "=" + foodTypeChance[i] + " chance")
			i += 1
		endWhile

		; now for each food to produce, pick randomly from each valid type
		int foodProduced = 0
		while foodProduced < totalFoodToProduce
			float randomRoll = Utility.RandomFloat()
			debug.trace(workshopRef + ": food production " + foodProduced + ": random roll=" + randomRoll)
			i = 0
			float currentChance = 0
			int foodTypeIndex = -1
			while i < foodTypeChance.Length && foodTypeIndex == -1
				currentChance += foodTypeChance[i]
				debug.trace(workshopRef + ": 	" + i + " currentChance=" + currentChance)
				if randomRoll <= currentChance
					foodTypeIndex = i
					debug.trace(workshopRef + ": 	" + i + " picking food index " + i)
				endif
				i += 1
			endWhile
			if foodTypeIndex > -1
				; found a food type - produce it
				debug.trace(workshopRef + " producing food type " + WorkshopFoodTypes[foodTypeIndex].resourceValue)
				DLC04NukaWorldWorkshopREF.AddItem(WorkshopFoodTypes[foodTypeIndex].foodObject)
			else
				; didn't - produce random food
				debug.trace(workshopRef + " producing generic food ")
				DLC04NukaWorldWorkshopREF.AddItem(DLC04WorkshopProduceFood)
			endif
			foodProduced += 1
		endWhile
	endif
endFunction

function UpdateMissingRatingGlobals()
	debug.trace(self + " UpdateMissingRatingGlobals")

	; clear globals
	int m = 0
	while m < RaiderSettlementMissingCounts.Length
		outpostMissingCount missingCount = RaiderSettlementMissingCounts[m]
		missingCount.outpostCount.SetValue(0)
		m += 1
	endWhile 

	; now get new totals
	int i = 0
	while i < RaiderWorkshops.Length 
		WorkshopScript workshopRef = RaiderWorkshops[i]
		; update 
		int missingIndex = 0
		while missingIndex < RaiderSettlementMissingCounts.Length
			outpostMissingCount missingCount = RaiderSettlementMissingCounts[missingIndex]
			; if this outpost has this rating (meaning missing bed/food/water/safety), increment global for that rating
			if workshopRef.GetValue(missingCount.valueToCheck) > 0
				missingCount.outpostCount.Mod(1)
				debug.trace(self + " 		increment missing count " + missingCount.outpostCount + " for " + workshopRef + ": new value=" + missingCount.outpostCount.GetValue())
			endif
			missingIndex += 1
		endWhile 
		i += 1
	endWhile
endFunction 

; when a raider gang becomes an enemy
; if raiderGangValue = 0, clear ownership of all raider settlements and clear vassal status of all settlements
; otherwise, clear ownership of raider settlements and vassals matching gang value
function ClearRaiderSettlementOwnership(int raiderGangValue = 0)
	; if completely clearing, means player is kicked out of faction - no need for further event tracking
	if raiderGangValue == 0
		UnregisterForCustomEvent(WorkshopParent, "WorkshopActorAssignedToWork")
		UnregisterForCustomEvent(WorkshopParent, "WorkshopActorUnassigned")
		UnregisterForCustomEvent(WorkshopParent, "WorkshopDailyUpdate")
	endif

	WorkshopNPCScript shank = alias_Shank.GetActorRef() as WorkshopNPCScript
	WorkshopScript shankWorkshop = shank.GetLinkedRef(WorkshopParent.workshopItemKeyword) as WorkshopScript

	; look for raider & vassal settlements
	int i = 0
	while i < WorkshopParent.Workshops.Length 
		WorkshopScript workshopRef = WorkshopParent.Workshops[i]
		if workshopRef.HasKeyword(WorkshopParent.WorkshopType02)
			debug.trace(self + " clearing player ownership of raider outpost " + workshopRef)
			; remove player ownership of raider settlements
			if raiderGangValue == 0 || GetRaiderGangValue(workshopRef) == raiderGangValue
				workshopRef.SetOwnedByPlayer(false)
				; don't allow fast travel to raider settlements
				if raiderGangValue > 0
					workshopRef.myMapMarker.AddToMap()
  					workshopRef.myMapMarker.EnableFastTravel(false)
  				endif
  				; if Shank is here, dismiss him
  				if shankWorkshop && shankWorkshop == workshopRef
  					debug.trace(self + " ClearRaiderSettlementOwnership: Shank is at " + workshopRef + " - remove him from workshop")
  					WorkshopParent.RemoveActorFromWorkshopPUBLIC(shank)
  				endif
			endif
		elseif workshopRef.HasKeyword(WorkshopParent.WorkshopType02Vassal)
			debug.trace(self + " clearing vassal status of " + workshopRef)
			; clear vassal status of vassal settlements
			if raiderGangValue == 0 || GetRaiderGangValue(workshopRef) == raiderGangValue
				ClearRaiderSettlement(workshopRef)

  				; if Shank is here, dismiss him
  				if shankWorkshop && shankWorkshop == workshopRef
  					debug.trace(self + " ClearRaiderSettlementOwnership: Shank is at " + workshopRef + " - remove him from workshop")
  					WorkshopParent.RemoveActorFromWorkshopPUBLIC(shank)
  				endif
			endif
		endif
		i += 1
	endWhile
endFunction

function StopInactiveMinutemenQuests()
	debug.trace(self + " StopInactiveMinutemenQuests")
	
	; send RECleanup event to stop any that are waiting to stop
	REParent.SendCleanupEvent()

	; get local copy for speed
	FormList MinutemenRadiantQuestMasterList = MinutemenCentralQuest.MinutemenRadiantQuestMasterList

	debug.trace(self + "   Check radiant quests:")
	int m = 0
	while m < MinutemenRadiantQuestMasterList.GetSize()
		MinRecruitQuestScript theQuest = MinutemenRadiantQuestMasterList.GetAt(m) as MinRecruitQuestScript
		debug.trace(self + "    " + theQuest + "...")
		if theQuest && theQuest.IsRunning() && theQuest.GetStageDone(theQuest.activeStage) == false 
			debug.trace(self + "    " + theQuest + ": trying to stop")
			; not active yet, so OK to shut down
			theQuest.Stop()
			debug.trace(self + "    " + theQuest + ": stopped")
		endif
		m += 1
	endWhile

	; update active recruitment list
	;MinutemenCentralQuest.UpdateActiveRecruitmentQuests()
	StartTimer(1.0, UpdateActiveRecruitmentQuestsTimerID)

	debug.trace(self + "   Check workshop attack quests:")
	; stop inactive workshop attack quests
	int a = 0
	while a < DLC04WorkshopAttackQuestList.GetSize()
		WorkshopAttackScript theQuest = DLC04WorkshopAttackQuestList.GetAt(a) as WorkshopAttackScript
		debug.trace(self + "    " + theQuest + "...")
		if theQuest && theQuest.IsRunning() && theQuest.GetStageDone(theQuest.attackStartStage) == false 
			debug.trace(self + "    " + theQuest + ": trying to stop")
			; not active yet, so OK to shut down
			theQuest.Stop()
		endif
		a += 1
	endWhile
	
endFunction

int UpdateActiveRecruitmentQuestsTimerID = 1 const 

Event OnTimer(int aiTimerID)
    if aiTimerID == UpdateActiveRecruitmentQuestsTimerID
		; update active recruitment list
		MinutemenCentralQuest.UpdateActiveRecruitmentQuests()
    endif
EndEvent

function UpdateRadioObject(WorkshopObjectScript radioObject)
	debug.trace(self + "UpdateRadioObject for " + radioObject)
	WorkshopScript workshopRef = WorkshopParent.GetWorkshop(radioObject.workshopID)
	; radio
	if radioObject.bRadioOn && radioObject.IsPowered()
		debug.trace(self + "	starting radio station")
		; make me a transmitter and start radio scene
		radioObject.MakeTransmitterRepeater(RaiderRadioRef, raiderRadioInnerRadius, raiderRadioOuterRadius)
	else
		debug.trace(self + "	stopping radio station")
		radioObject.MakeTransmitterRepeater(NONE, 0, 0)
	endif
	workshopRef.RecalculateWorkshopResources()

	; send transmitter event
	Var[] kargs = new Var[1]
	kargs[0] = workshopRef
	SendCustomEvent("DLC04WorkshopRaiderTransmitterEvent", kargs)		
endFunction

function debugRefType()
	debug.trace(self + " BossLocRefTypeList:")
	int i = 0
	while i < BossLocRefTypeList.GetSize()
		debug.trace(self + " " + BossLocRefTypeList.GetAt(i))
		i += 1
	endWhile 
endFunction

; for assigning/moving raiders to outposts
location function AddActorToWorkshopPlayerChoice(Actor actorToAssign, bool bWaitForActorToBeAdded = true, bool bPermanentActor = false)
	debug.trace(self + " AddActorToWorkshopPlayerChoice " + actorToAssign)
	; this only works on actors with the workshop script
	WorkShopNPCScript workshopActorToAssign = actorToAssign as WorkShopNPCScript
	if !workshopActorToAssign
		debug.trace(self + " WARNING: AddActorToWorkshopPlayerChoice: invalid actor " + actorToAssign + " - NOT assigned", 2)
		return None
	endif

	keyword keywordToUse = WorkshopParent.WorkshopAssignHome
	if bPermanentActor
		keywordToUse = WorkshopParent.WorkshopAssignHomePermanentActor
	endif

	Location previousLocation = NONE
	int previousWorkshopID = workshopActorToAssign.GetWorkshopID()
	if previousWorkshopID > -1
		WorkshopScript previousWorkshop = WorkshopParent.GetWorkshop(previousWorkshopID)
		if previousWorkshop
			previousLocation = previousWorkshop.myLocation
		endif
	endif
	Location newLocation = workshopActorToAssign.OpenWorkshopSettlementMenuEx(akActionKW=keywordToUse, aLocToHighlight=previousLocation, akIncludeKeywordList=DLC04WorkshopRaiderSettlementKeywordList)

	if bWaitForActorToBeAdded && newLocation
		; wait for menu to resolve (when called in scenes)
		int failsafeCount = 0
		while failsafeCount < 5 && workshopActorToAssign.GetWorkshopID() == -1
			debug.trace(self + "...waiting...")
			failsafeCount += 1
			utility.wait(0.5)
		endWhile
	endif
	debug.trace(self + "AddActorToWorkshopPlayerChoice DONE")

	return newLocation	
endFunction

Event ObjectReference.OnWorkshopObjectPlaced(ObjectReference akSender, ObjectReference akReference)
	debug.trace(self + " OnWorkshopObjectPlaced akSender=" + akSender + ", akReference=" + akReference)
	; if a turret, set up with raider factions
	if akReference.GetBaseValue(Safety) > 0
		WorkshopScript workshopRef = akSender as WorkshopScript
		Actor theTurret = akReference as Actor
		MakeTurretHostile(workshopRef, theTurret)
	endif	
EndEvent

; for making raider settlement turrets hostile to attackers
; bMakeHostile:
; 	TRUE = add to raider gang faction
; 	FALSE = return to normal faction setup
Function MakeTurretsHostile(WorkshopScript workshopRef, bool bMakeHostile = true)
	debug.trace(self + " MakeTurretsHostile " + workshopRef)

	; get gang value
	int raiderGangValue = GetRaiderGangValue(workshopRef)
	Faction raiderGangFaction
	debug.trace(self + " 	raiderGangValue=" + raiderGangValue)
	if raiderGangValue > 0
		raiderGangFaction = RaiderGangFactions[raiderGangValue-1]
		debug.trace(self + " 	raiderGangFaction=" + raiderGangFaction)
	endif

	;This function grabs all the safety objects (turrets) at a given workshop and makes the workshop's gang faction their crime faction
	ObjectReference[] turrets = workshopRef.GetWorkshopResourceObjects(Safety)

	debug.trace(self + "	turrets=" + turrets)
	int i = 0
	int iCount = turrets.Length

	;Loop through everyone we got, confirm they're at the proper workshop, add them to the proper collection, and throw the local crime faction on them
	while i < iCount
		Actor theTurret = turrets[i] as Actor
		debug.trace(self + "	" + i + ": " + theTurret)
		if theTurret
			MakeTurretHostile(workshopRef, theTurret, raiderGangFaction, bMakeHostile)
		endif
		i += 1
	endwhile
EndFunction

Function MakeTurretHostile(WorkshopScript workshopRef, Actor theTurret, Faction raiderGangFaction = NONE, bool bMakeHostile = true)
	if raiderGangFaction == NONE 
		; get gang value
		int raiderGangValue = GetRaiderGangValue(workshopRef)
		debug.trace(self + " 	raiderGangValue=" + raiderGangValue)
		if raiderGangValue > 0
			raiderGangFaction = RaiderGangFactions[raiderGangValue-1]
		endif
	endif

	if theTurret
		if bMakeHostile
			if raiderGangFaction
				theTurret.AddtoFaction(raiderGangFaction)
				theTurret.SetCrimeFaction(raiderGangFaction)
				theTurret.RemoveFromFaction(PlayerFaction)
				theTurret.RemoveFromFaction(WorkshopNPCFaction)
			endif
		else
			; return turret to normal factions
			int i = 0
			while i < RaiderGangFactions.Length 
				Faction theFaction = RaiderGangFactions[i]
				theTurret.RemoveFromFaction(theFaction)
				i += 1
			endWhile
			if workshopRef.UseOwnershipFaction
				theTurret.SetCrimeFaction(workshopRef.SettlementOwnershipFaction)
			else 
				theTurret.SetCrimeFaction(NONE)
			endif
			theTurret.AddToFaction(PlayerFaction)
			theTurret.AddToFaction(WorkshopNPCFaction)
		endif
	endif
endFunction 

; ****** dupe of FollowersScript.DismissCompanion, with modifications
Function DismissRaiderCompanion(Actor CompanionToDismiss, bool ShowLocationAssignmentListIfAvailable = true, bool SuppressDismissMessage = false)
	debug.trace(self + "DismissCompanion()" + CompanionToDismiss)
	
	FollowersScript Followers = FollowersScript.GetScript()

	CompanionActorScript CAS = Followers.Companion.GetActorReference() as CompanionActorScript

	if CAS == CompanionToDismiss ;is actor we are trying to dismiss actually the current companion?
		
		if SuppressDismissMessage == false

			int outpostCount = DLC04RaiderOutpostCount.GetValue() as int 

			debug.trace(self + "DLC04RaiderOutpostCount: " + outpostCount)
			debug.trace(self + "ShowLocationAssignmentListIfAvailable: " + ShowLocationAssignmentListIfAvailable)

			location WorkshopHome
			
			if ShowLocationAssignmentListIfAvailable && outpostCount > 0
				; FollowersScript:
				;WorkshopHome = WorkshopParent.AddPermanentActorToWorkshopPlayerChoice(Followers.Companion.GetActorReference())
				; /FollowersScript

				; NEW: DLC04 raider companion version:
				Location previousLocation = NONE
				int previousWorkshopID = (CompanionToDismiss as WorkshopNPCScript).GetWorkshopID()
				if previousWorkshopID > -1
					WorkshopScript previousWorkshop = WorkshopParent.GetWorkshop(previousWorkshopID)
					if previousWorkshop
						previousLocation = previousWorkshop.myLocation
					endif
				endif
				WorkshopHome = CompanionToDismiss.OpenWorkshopSettlementMenuEx(akActionKW=WorkshopParent.WorkshopAssignHomePermanentActor, aLocToHighlight=previousLocation, akIncludeKeywordList=DLC04WorkshopRaiderSettlementKeywordList)
			endif

			debug.trace(self + "DismissCompanion() will show message")

			if WorkshopHome == None
				WorkshopHome = (CompanionToDismiss.GetLinkedRef(WorkshopParent.workshopItemKeyword) as WorkshopScript).myLocation
			endif

			debug.trace(self + "DismissCompanion() WorkshopHome: " + WorkshopHome)
			if WorkshopHome
				CAS.HomeLocation = WorkshopHome
			endif

			Followers.DismissMessageLocation.ForceLocationTo(CAS.HomeLocation)
			Followers.FollowersCompanionDismissMessage.Show()
		
		endif

		debug.trace(self + "DismissCompanion() will ClearCompanion()")
		Followers.ClearCompanion()

	else
		debug.trace(self + " " + CompanionToDismiss + " is NOT the current companion, so not dismissing.")

	endif
	
EndFunction

bool Function PermanentActorsAliveAndPresent(Location aiLocation)
	int i = 0
	int iCount = PermanentActors.GetCount()

	;If there are permanent actors...
	if iCount > 0

		;Figure out the cleared location's workshop ID...
		WorkshopScript WorkshopRef = WorkshopParent.GetWorkshopFromLocation(aiLocation)
		int iClearedWorkshopID = WorkshopRef.GetWorkshopID()

		;Then loop through all the permanent actors and get their workshop ID...
		while i < iCount
			Actor act = (PermanentActors.GetAt(i) as Actor)
			debug.trace("DLC04Workshop Parent: Checking permanent actor: " + act)
			int iActorWorkshopID = (act as WorkshopNPCScript).GetWorkshopID()

			;If the selected Permanent Actor is assigned to a workshop location and isn't dead...
			if iActorWorkshopID > -1 && !act.IsDead()
				debug.trace("DLC04Workshop Parent: Comparing actor's workshop ID: " + iActorWorkshopID + "  and cleared location" + aiLocation + " ID: " + iClearedWorkshopID)

				;And they're assigned to the cleared location, return true
				if iActorWorkshopID == iClearedWorkshopID
					return true
				endif

			endif

			i += 1
		endwhile
	endif

	return false
EndFunction