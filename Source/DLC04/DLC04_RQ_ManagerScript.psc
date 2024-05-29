Scriptname DLC04:DLC04_RQ_ManagerScript extends Quest

CustomEvent ShutdownNonAcceptedQuests

CustomEvent ActorWasShockCollared

Struct FactionAssociation
	faction AssociatedFaction
	{a rival faction}
	GlobalVariable AssociatedGlobal
	{the value in this global is used store on an actorvalue to flavor quest giver dialogue}
	ActorBase AssociatedLeveledActor
	{The actor base of the leveled actor associated with this group}
	ActorBase AssociatedLeveledActorBoss
	{The actor base of the leveled actor boss associated with this group}
	bool isNukaWorldGang = false
	{Does this represent a Nuka-World gang? If so, they won't be eligible for enemies of radiant quests}

	int StageToSetWhenKilled = -1
	{What stage to set when the target of a DLC04_RQ_KillTroubleMaker or DLC04_RQ_KillRivalBoss is this faction}

	int StageToSetWhenCollared = -1
	{What stage to set when the target of a DLC04_RQ_KillTroubleMaker or DLC04_RQ_KillRivalBoss is this faction}

EndStruct

Struct CrimeFactionAssociation
	faction AssociatedFaction
	{a crime faction}
	location AssociatedLocation
	{location associated with faction}

EndStruct


Group KeywordToStartQuest
keyword Property DLC04_RQ_Start Auto Const Mandatory
{autofill}
EndGroup

Group QuestGiverAliases
ReferenceAlias Property Nisha Auto Const Mandatory
{autofill}

ReferenceAlias Property MagsBlack Auto Const Mandatory
{autofill}

ReferenceAlias Property Mason Auto Const Mandatory
{autofill}
EndGroup


ActorValue Property DLC04_RQ_CountActiveQuests Auto Const Mandatory
{autofill; counts the number of quests active for this quest giver. Allowed 2 (1 current and 1 waiting to roll when player completes the current one).}

Group ReasonData
ActorValue Property DLC04_RQ_ReasonForQuest Auto Const Mandatory
{Corresponds to globalvariable values in ReasonsForQuests}

GlobalVariable Property DLC04_RQ_Reason_General Auto Const Mandatory
{autofill}

GlobalVariable Property DLC04_RQ_Reason_HelpSettlement Auto Const Mandatory
{autofill}

GlobalVariable Property DLC04_RQ_Reason_Mischief Auto Const Mandatory
{autofill}
EndGroup


Group ReasonMischiefData
ActorValue Property DLC04_RQ_MischiefTarget Auto Const Mandatory
{Corresponds to globalvariable values in ReasonsForQuests}

GlobalVariable Property DLC04_RQ_MischiefTarget_Disciples Auto Const Mandatory
{autofill, used for the target for mischief quest dialogue}

GlobalVariable Property DLC04_RQ_MischiefTarget_Operators Auto Const Mandatory
{autofill, used for the target for mischief quest dialogue}

GlobalVariable Property DLC04_RQ_MischiefTarget_Pack Auto Const Mandatory
{autofill, used for the target for mischief quest dialogue}
EndGroup

Group FactionAssociations
ActorValue Property DLC04_RQ_TargetOfQuest Auto Const Mandatory
{Holds a value associated with the target of the quest, used to flavor quest dialogue.

Corresponds to values of DLC04_Faction_xxx Globals}

FactionAssociation[] Property FactionAssociations Auto Const Mandatory
{Holds Faction and assoicated globalvariable data}

GlobalVariable Property DLC04_RQ_Faction_None Auto Const Mandatory
{Global with value for DLC04_RQ_TargetOfQuest if target actor isn't in a faction in FactionAssociation}

EndGroup

Group CrimeFactionAssociations
	CrimeFactionAssociation[] Property CrimeFactionAssociations Auto Const Mandatory
	{Holds Faction and associated Location data}
EndGroup


Group SettlementGlobals
	GlobalVariable Property DLC04OutpostCountDisciples Auto Const Mandatory
	{autofill}

	GlobalVariable Property DLC04OutpostCountOperators Auto Const Mandatory
	{autofill}

	GlobalVariable Property DLC04OutpostCountPack Auto Const Mandatory
	{autofill}
EndGroup

Group ShockCollarData
	Perk Property DLC04_ShockCollarPerk Auto Const Mandatory
	{autofill; perk given to player to give him activate option}


	Faction Property DLC04_CanBeShockCollared Auto Const Mandatory
	{autofill}

	RefCollectionAlias Property ActorsAllowedToShockCollar Auto Const Mandatory
	{autofill}

	RefCollectionAlias Property ShockCollaredActors Auto Const Mandatory
	{autofill}

	Armor Property DLC04_ShockCollar Auto Const Mandatory
	{autofill}

	keyword Property DLC04_RQ_ShockCollared Auto Const Mandatory
	{autofill}


	keyword Property DLC04_RQ_ShockCollaredPlayer Auto Const Mandatory
	{autofill}

	ReferenceAlias Property TroubleMaker Auto Const Mandatory
	{autofill}

	ActorValue Property DLC04_RQ_QuestGiver Auto Const Mandatory
	{autofill; holds value associated with questgiver to collar dialogue on collared actor
corresponds to: DLC04_RQ_QG_xxx globals}

	GlobalVariable Property DLC04_RQ_QG_Mason Auto Const Mandatory
	{autofill}

	GlobalVariable Property DLC04_RQ_QG_Nisha Auto Const Mandatory
	{autofill}
	
	GlobalVariable Property DLC04_RQ_QG_Mags Auto Const Mandatory
	{autofill}

	Faction Property PlayerFriendFaction Auto Const Mandatory
	{autofill}

	Quest Property DLC04_RQ_SendAlarmIfDetected Auto Const Mandatory
	{autofill}
EndGroup


Faction DebugForcedEnemyFaction ;for debugging purposes

int iNumMaxQuestActive = 2 const

int PreviousReasonDieRoll		;holds the last roll we made for reason for a quest

GlobalVariable PreviousReason 	;holds the previous reason for quest

;convenience variable, set in OnQuestInit
Actor PlayerRef
Actor MasonRef
Actor MagsBlackRef
Actor NishaRef

Group Achievement
	int Property AchievementID = 75 Auto Const

	int Property AchievementCompletedQuestsNeeded = 12 Auto Const 
	{How manyquests are needed before player pops achievement}
EndGroup

int countCompletedQuests ;for achievement

Event OnQuestInit()
	trace(self, "OnInit()")

	;for triggering quests to start
	RegisterForRemoteEvent(Mason, "OnLoad")
    RegisterForRemoteEvent(MagsBlack, "OnLoad")
    RegisterForRemoteEvent(Nisha, "OnLoad")

    ;for telling quests to shut down if not accepted yet
	RegisterForRemoteEvent(Mason, "OnUnload")
    RegisterForRemoteEvent(MagsBlack, "OnUnload")
    RegisterForRemoteEvent(Nisha, "OnUnload")

    ;to support moving to them from console at mainmenu
    MasonRef = Mason.GetActorReference()
    if MasonRef.Is3DLoaded()
    	StartQuest(MasonRef)
    endif
    MagsBlackRef = MagsBlack.GetActorReference()
    if MagsBlackRef.Is3DLoaded()
    	StartQuest(MagsBlackRef)
    endif
    NishaRef = Nisha.GetActorReference()
    if NishaRef.Is3DLoaded()
    	StartQuest(NishaRef)
    endif

    PlayerRef = Game.GetPlayer()

    PlayerRef.AddPerk(DLC04_ShockCollarPerk)

EndEvent

Event ReferenceAlias.OnLoad(ReferenceAlias akSender)
	trace(self, "ReferenceAlias.OnLoad() akSender:" + akSender)

    StartQuest(akSender.GetActorReference())
EndEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSender)
	trace(self, "ReferenceAlias.OnUnload() akSender:" + akSender)

    ShutDownNonAcceptedQuest(akSender.GetActorReference())
EndEvent

Function StartQuest(Actor QuestGiverRef)
	trace(self, "StartQuest() QuestGiverRef: " + QuestGiverRef)

	;only start a quest if there's less than two you are a quest giver for
	;allowed two because: one is current, one is waiting to roll when you turn in the first one
	if QuestGiverRef.GetValue(DLC04_RQ_CountActiveQuests) >= iNumMaxQuestActive
		trace(self, "StartQuest() 	DLC04_RQ_CountActiveQuests >- iNumMaxQuestActive, not starting a new quests.")

	else
		trace(self, "StartQuest() 	Calling SendStoryEvent()")
		
		DLC04_RQ_Start.SendStoryEvent(akRef1 = QuestGiverRef)
	endif
	
EndFunction

Function CheckAndAwardAchievementIfNeeded()
	countCompletedQuests += 1

	trace(self, "CheckAndAwardAchievementIfNeeded() countCompletedQuests:" + countCompletedQuests)

	if countCompletedQuests >= AchievementCompletedQuestsNeeded
	trace(self, "CheckAndAwardAchievementIfNeeded() >= AchievementCompletedQuestsNeeded:" + AchievementCompletedQuestsNeeded)

		Game.AddAchievement(AchievementID)
	endif

EndFunction

;Called by DLC04_RQ_QuestScript - sets values on quest giver for dialogue conditions
Function SetQuestGiverData(DLC04_RQ_QuestScript RQ_Quest, Actor QuestGiverRef)
	trace(self, "SetQuestGiverData() RQ_Quest: " + RQ_Quest + ", QuestGiverRef:" + QuestGiverRef)

	QuestGiverRef.SetValue(DLC04_RQ_ReasonForQuest, RQ_Quest.ReasonOfQuest)
	QuestGiverRef.SetValue(DLC04_RQ_MischiefTarget, RQ_Quest.MischiefTargetOfQuest)
	QuestGiverRef.SetValue(DLC04_RQ_TargetOfQuest, RQ_Quest.TargetOfQuest)
EndFunction

;Called by DLC04_RQ_QuestScript - sets data on quest script
Function SetQuestData(DLC04_RQ_QuestScript RQ_Quest, Actor QuestGiverRef, Actor TargetRef, bool allowHelpSettlement = true, bool allowMischief = true)
	
	trace(self, "SetQuestData(): " + \
	 			"\n----> RQ_Quest" + RQ_Quest + \
	 			"\n----> QuestGiverRef: " + QuestGiverRef + \
	 			"\n----> TargetRef: " + TargetRef + \ 
	 			"\n----> allowMischief: " + allowMischief)

	GlobalVariable Reason = GetReasonGlobalForQuest(QuestGiverRef, allowHelpSettlement, allowMischief)

	RQ_Quest.ReasonOfQuest = Reason.GetValue() as int
	
	if Reason == DLC04_RQ_Reason_Mischief
		RQ_Quest.MischiefTargetOfQuest = GetMischiefTargetGlobal(QuestGiverRef).GetValue() as int
	endif

	RQ_Quest.TargetOfQuest = GetTargetGlobal(QuestGiverRef, TargetRef).GetValue() as int

	trace(self, "SetQuestData(): " + \
	 			"\n----> Reason" + Reason + \
	 			"\n----> RQ_Quest.ReasonOfQuest" + RQ_Quest.ReasonOfQuest + \
	 			"\n----> RQ_Quest.MischiefTargetOfQuest: " + RQ_Quest.MischiefTargetOfQuest + \
	 			"\n----> RQ_Quest.TargetOfQuest: " + RQ_Quest.TargetOfQuest)
	 		

EndFunction


GlobalVariable Function GetReasonGlobalForQuest(actor QuestGiverRef, bool allowHelpSettlement = true, bool allowMischief = true )
	trace(self, "GetReasonGlobalForQuest()")

	GlobalVariable[] PossibleReasons = new GlobalVariable[0] ;EMPTY, okay because i'll be adding to it

	PossibleReasons.Add(DLC04_RQ_Reason_General)	;all quests support general reason

	;**** Possibly weight the chance of this based on the number of raider settlements?
	if allowHelpSettlement
		;make sure this particular quest giver has settlements
		allowHelpSettlement = false

		if QuestGiverRef == NishaRef && DLC04OutpostCountDisciples.GetValue() > 0
			allowHelpSettlement = true

		elseif QuestGiverRef == MagsBlackRef && DLC04OutpostCountOperators.GetValue() > 0
			allowHelpSettlement = true

		elseif QuestGiverRef == MasonRef && DLC04OutpostCountPack.GetValue() > 0
			allowHelpSettlement = true
		endif

		if allowHelpSettlement 
			PossibleReasons.Add(DLC04_RQ_Reason_HelpSettlement)
		endif
	endif

	if allowMischief
		PossibleReasons.Add(DLC04_RQ_Reason_Mischief)
	endif

	trace(self, "GetReasonGlobalForQuest() PossibleReasons: " + PossibleReasons)

	;Randomly pick
	int arrayLen = PossibleReasons.length
	int dieRoll = utility.RandomInt(0, arrayLen - 1)


	;if same as last time, pick something else
	if PossibleReasons[dieRoll] == PreviousReason
		dieRoll += 1
	endif

	;if we are past the last item in array, loop to first
	if dieRoll > arrayLen - 1
		dieRoll = 0
	endif

	GlobalVariable newReason = PossibleReasons[dieRoll]

	PreviousReason = newReason

	trace(self, "GetReasonGlobalForQuest() returning " + newReason)

	RETURN newReason

EndFunction


globalvariable Function GetMischiefTargetGlobal(Actor QuestGiverRef)
	trace(self, "GetMischiefTargetGlobal() QuestGiverRef: " + QuestGiverRef )
	
	GlobalVariable returnVal

	if QuestGiverRef == NishaRef
		if Utility.RandomInt(0, 1)
			returnVal = DLC04_RQ_MischiefTarget_Operators
		else
			returnVal = DLC04_RQ_MischiefTarget_Pack
		endif

	elseif QuestGiverRef == MagsBlackRef
		if Utility.RandomInt(0, 1)
			returnVal = DLC04_RQ_MischiefTarget_Pack
		else
			returnVal = DLC04_RQ_MischiefTarget_Disciples
		endif

	elseif QuestGiverRef == MasonRef
		if Utility.RandomInt(0, 1)
			returnVal = DLC04_RQ_MischiefTarget_Disciples
		else
			returnVal = DLC04_RQ_MischiefTarget_Operators
		endif
	else
		trace(self, "ERROR!!! GetMischiefTargetGlobal() found an unexpected QuestGiverRef: " + QuestGiverRef, 2)
		returnVal = None
	endif

	trace(self, "GetMischiefTargetGlobal() returning " + returnVal )

	RETURN returnVal
EndFunction


GlobalVariable Function GetTargetGlobal(Actor QuestGiverRef, Actor TargetActor)
	trace(self, "GetTargetGlobal() QuestGiverRef: " + QuestGiverRef + ", TargetActor: " + TargetActor )

	int i = 0
	globalvariable target = DLC04_RQ_Faction_None
	While (target == DLC04_RQ_Faction_None && i < FactionAssociations.length)
		Faction currentFaction = FactionAssociations[i].AssociatedFaction

		if TargetActor.IsInFaction(currentFaction)
			target = FactionAssociations[i].AssociatedGlobal
		endif

		i += 1
	EndWhile

	trace(self, "GetTargetGlobal() target == " + target)

	RETURN target

EndFunction

Function SetDebugForcedEnemyFaction(Faction FactionToForce)
	trace(self, "SetDebugForcedEnemyFaction() FactionToForce: " + FactionToForce)
	DebugForcedEnemyFaction = FactionToForce
EndFunction

FactionAssociation Function PickFactionAssociation(bool IsEnemy = false, Actor PickBasedOnThisActorsFactions = None, bool ShouldIgnoreGangs = true )

	trace(self, "PickFactionAssociation() PickBasedOnThisActorsFactions: " + PickBasedOnThisActorsFactions + ", ShouldIgnoreGangs: " + ShouldIgnoreGangs)

	FactionAssociation returnVal = None

	FactionAssociation[] allowedFactionAssociations = new FactionAssociation[0] 

	;loop through FactionAssociations and grab ones that are okay to pick from
	int i = 0
	While (i < FactionAssociations.length)
		
		FactionAssociation currentFactionAssociation = FactionAssociations[i]

		Faction AssociatedFaction = currentFactionAssociation.AssociatedFaction
		bool isNukaWorldGang = currentFactionAssociation.isNukaWorldGang

		trace(self, "PickFactionAssociation() current AssociatedFaction: " + AssociatedFaction)
		trace(self, "PickFactionAssociation() current isNukaWorldGang: " + isNukaWorldGang)

		if isNukaWorldGang && ShouldIgnoreGangs
			;don't add this one - we don't want it
			trace(self, "PickFactionAssociation() isNukaWorldGang && ShouldIgnoreGangs")
		
		elseif PickBasedOnThisActorsFactions
			trace(self, "PickFactionAssociation() PickBasedOnThisActorsFactions isn't null so checking for faction")
			if PickBasedOnThisActorsFactions.IsInFaction(AssociatedFaction)
				;we found this actor in the associated faction - we want it

				trace(self, "PickFactionAssociation() PickBasedOnThisActorsFactions: " + PickBasedOnThisActorsFactions + " is in Faction: " + AssociatedFaction)
				allowedFactionAssociations.add(currentFactionAssociation)
			endif
		
		else ;there's no rule preventing this - we want it
			trace(self, "PickFactionAssociation() no rule preventing: " + currentFactionAssociation)
			allowedFactionAssociations.add(currentFactionAssociation)
		endif

		i += 1
	EndWhile

	trace(self, "PickFactionAssociation() allowedFactionAssociations: " + allowedFactionAssociations)


	;randomly pick from among the allowed FactionAssociations
	if allowedFactionAssociations.length > 0 ;things will be broken if this isn't true - see error trace below for returnVal == none
		int dieRoll = utility.RandomInt(0, allowedFactionAssociations.length - 1)
		trace(self, "PickFactionAssociation() dieRoll: " + dieRoll)
		trace(self, "PickFactionAssociation() allowedFactionAssociations[dieRoll]: " + allowedFactionAssociations[dieRoll])
		returnVal = allowedFactionAssociations[dieRoll]
	endif

	if IsEnemy && DebugForcedEnemyFaction
	trace(self, "FORCING FACTION BASED ON DEBUG FACTION!!!! Forcing to: " + DebugForcedEnemyFaction, 1)
		int foundIndex = allowedFactionAssociations.FindStruct("AssociatedFaction", DebugForcedEnemyFaction)

		trace(self, "FORCING FACTION foundIndex: " + foundIndex, 1)
	
		returnVal = allowedFactionAssociations[foundIndex]
		;clear it - it's a one time thing only:
		DebugForcedEnemyFaction = none
	endif

	if returnVal == None
		trace(self, "ERROR!!! PickFactionAssociation() couldn't find an appropriate FactionAssociation - did it try to find one based on Actor's faction and couldn't?", 2)
	endif

	trace(self, "PickFactionAssociation() returnVal == " + returnVal)

	RETURN returnVal

EndFunction

FactionAssociation Function GetFactionAssociationForActor(Actor ActorToFindARelatedFactionAssociationFor)
	trace(self, "GetFactionAssociationForActor() ActorToFindARelatedFactionAssociationFor:" + ActorToFindARelatedFactionAssociationFor)

	int i = 0
	FactionAssociation returnVal
	While (returnVal == None && i < FactionAssociations.length)
		
		FactionAssociation currentFactionAssociation = FactionAssociations[i]
		Faction currentFaction = currentFactionAssociation.AssociatedFaction

		if ActorToFindARelatedFactionAssociationFor.IsInFaction(currentFaction)
			returnVal = currentFactionAssociation
		endif

		i += 1
	EndWhile

	trace(self, "GetFactionAssociationForActor() returnVal:" + returnVal)
 
	return returnVal

EndFunction


Function SetAffinityQuestStageForTarget(Actor TargetActor, bool Collared = false, bool Killed = false)
	trace(self, "SetAffinityQuestStageForTarget() TargetActor: " + TargetActor)

	FactionAssociation ActorFactionAssociation = GetFactionAssociationForActor(TargetActor)

	int StageToSet = -1

	;ASSUME it's a civilian
	if ActorFactionAssociation == none
		if Collared
			StageToSet = 111
		elseif Killed
			StageToSet = 101
		else
			trace(self, "SetAffinityQuestStageForTarget() WARNING!!! Neither Collared or Killed are true! One must be set to true.")
		endif

	endif

	if StageToSet == -1

		if Collared
			StageToSet = ActorFactionAssociation.StageToSetWhenCollared
		elseif Killed
			StageToSet = ActorFactionAssociation.StageToSetWhenKilled
		else
			trace(self, "SetAffinityQuestStageForTarget() WARNING!!! Neither Collared or Killed are true! One must be set to true.")
		endif

	endif

	trace(self, "SetAffinityQuestStageForTarget() setting stage -> StageToSet: " + StageToSet)

	SetStage(StageToSet)
	
EndFunction


faction Function GetTargetCrimeFaction(Actor ActorToGetCrimeFactionFor)
	trace(self, "GetTargetCrimeFaction() ActorToGetCrimeFactionFor: " + ActorToGetCrimeFactionFor)

	faction returnVal = none

	;checks if target is in location and sets appropriate crime faction
	int i = 0
	While (returnVal == none && i < CrimeFactionAssociations.length)
		CrimeFactionAssociation currentCrimeFactionAssociation = CrimeFactionAssociations[i] as CrimeFactionAssociation
		
		if ActorToGetCrimeFactionFor.IsInLocation(currentCrimeFactionAssociation.AssociatedLocation)
			returnVal = currentCrimeFactionAssociation.AssociatedFaction
		endif

		i += 1
	EndWhile

	trace(self, "GetTargetCrimeFaction() returnVal: " + returnVal)

	return returnVal

EndFunction

Function ShutDownNonAcceptedQuest(Actor QuestGiverRef)
	;we shut down quest if player walks away without accepting it so we don't have to worry about player completing objectives before he knows he's on the quest
	trace(self, "ShutDownNonAcceptedQuest() QuestGiverRef:" + QuestGiverRef)

	var[] akArgs = new var[1]

	akArgs[0] = QuestGiverRef

	trace(self, "ShutDownNonAcceptedQuest()	SendCustomEvent: ShutdownNonAcceptedQuests, QuestGiverRef: " + QuestGiverRef)
	
	SendCustomEvent("ShutdownNonAcceptedQuests", akArgs)

EndFunction

;Called by DLC04_RQ_QuestScript
;lives here for thread safety
Function SetActiveQuestGiverStatus(Actor QuestGiverRef, bool isActiveQuestGiver)
	trace(self, "SetActiveQuestGiverStatus() QuestGiverRef: " + QuestGiverRef + ", isActiveQuestGiver: " + isActiveQuestGiver)
	if isActiveQuestGiver
		QuestGiverRef.ModValue(DLC04_RQ_CountActiveQuests, 1)
	else
		QuestGiverRef.ModValue(DLC04_RQ_CountActiveQuests, -1)
	endif
EndFunction

;used to flag collared actor with who the questgiver is for dialogue
Function SetQuestGiverActorValue(Actor ActorToSetValueOn, Actor QuestGiver)
	GlobalVariable GlobalToUse

	if QuestGiver == Mason.GetActorReference()
		GlobalToUse = DLC04_RQ_QG_Mason

	elseif QuestGiver == Nisha.GetActorReference()
		GlobalToUse = DLC04_RQ_QG_Nisha

	elseif QuestGiver == MagsBlack.GetActorReference()
		GlobalToUse = DLC04_RQ_QG_Mags
	endif

	trace(self, "SetQuestGiverActorValue() ActorToSetValueOn: " + ActorToSetValueOn + ", QuestGiver: " + QuestGiver + ", GlobalToUse: " + GlobalToUse)


	ActorToSetValueOn.SetValue(DLC04_RQ_QuestGiver, GlobalToUse.GetValue())


EndFunction


Function AllowShockCollar(Actor ActorToAllow, bool Allowed = true)
	trace(self, "AllowShockCollar() ActorToAllow: " + ActorToAllow)

	if Allowed
		;this ref collection:
		;marks essential
		;adds to the DLC04_CanBeShockCollared faction
		ActorsAllowedToShockCollar.AddRef(ActorToAllow)
	else
		ActorsAllowedToShockCollar.RemoveRef(ActorToAllow)
	endif

EndFunction


Function AttachShockCollar(Actor ActorToCollar)
	trace(self, "AttachShockCollar() ActorToCollar: " + ActorToCollar)

	;give and equip the collar
	ActorToCollar.EquipItem(DLC04_ShockCollar, abPreventRemoval = true)

	;Player say a line
	PlayerRef.SayCustom(DLC04_RQ_ShockCollaredPlayer, akTarget = ActorToCollar)
	utility.wait(2)

	;add to ref alias collection that adds to PlayerFriendFaction gives them package
	ShockCollaredActors.AddRef(ActorToCollar)

	;add to faction
	ActorToCollar.addToFaction(PlayerFriendFaction)

	ActorToCollar.EvaluatePackage() ;get them running to Nuka-World hub

	;heal actor so becoming unessential doesn't kill him:
	ActorToCollar.RestoreValue(Game.GetHealthAV(), 9999)

	;Remove actor from alias collection to:
	;remove faction so the entry point on perk that adds the activation prompt is no longer valid
	;unmark to be essential
	ActorsAllowedToShockCollar.removeRef(ActorToCollar)

	;Victim say a line
	ActorToCollar.SayCustom(DLC04_RQ_ShockCollared, akTarget = PlayerRef)
	utility.wait(2)

	;make the cowardly so they never attack
	ActorToCollar.SetValue(Game.GetConfidenceAV(), 0)

	;send quest that will alarm to trigger crime event if anyone detects the player
	DLC04_RQ_SendAlarmIfDetected.Start()

	ActorToCollar.StopCombat()
	ActorToCollar.StopCombatAlarm()

	;send custom event
	var[] akArgs = new var[1]

	akArgs[0] = ActorToCollar

	trace(self, "AttachShockCollar()	SendCustomEvent: ActorWasShockCollared, ActorToCollar: " + ActorToCollar)
	
	SendCustomEvent("ActorWasShockCollared", akArgs)
EndFunction

Function RemoveShockCollar(Actor ActorToCollar)
	trace(self, "RemoveShockCollar() ActorToCollar: " + ActorToCollar)
	ShockCollaredActors.RemoveRef(ActorToCollar)
EndFunction

DLC04_RQ_ManagerScript Function GetScript() global
	return Game.GetFormFromFile(0x01017F47, "DLCNukaWorld.esm") as DLC04_RQ_ManagerScript
EndFunction


int Function GetEnemyGangGlobalValueForQuestGiver(Actor QuestGiverRef)
	int returnVal

	if QuestGiverRef == NishaRef
		returnVal = 1
	elseif QuestGiverRef == MagsBlackRef
		returnVal = 2
	elseif QuestGiverRef == MasonRef
		returnVal = 3
	endif

	trace(self, "GetEnemyGangGlobalValueForQuestGiver() returnVal: " + returnVal)

	return returnVal
	
EndFunction


bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) debugOnly
	;we are sending callingObject so we can in the future route traces to different logs based on who is calling the function
	string logName = "DLC04_RQ"
	debug.OpenUserLog(logName) 
	RETURN debug.TraceUser(logName, CallingObject + ": " + asTextToPrint, aiSeverity)
	
EndFunction

