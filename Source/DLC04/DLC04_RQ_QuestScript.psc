Scriptname DLC04:DLC04_RQ_QuestScript extends Quest
{Script on various DLC04_RQ_xxx quests}

struct SpawnDatum
	ReferenceAlias AliasToSpawn
	{Alias the spawned ref will be forced into}
	ReferenceAlias AliasWithLinks
	{Alias the spawned ref will be forced into - this alias is the one with the linked ref data they'll use for package behavior}
	ReferenceAlias AliasToSpawnAt
	{Alias the spawned ref will be placed at}
	bool isFriendly
	{is this alias considered friendly to the quest giver}
	bool isBoss
	{should this alias spawn from a boss list?}
	int DifficultyLevel = 1
{Default = 1 (medium):
0 = Easy
1 = Medium
2 = Hard
3 = VeryHard
4 = None}

endStruct


Group ManagerQuest
DLC04_RQ_ManagerScript Property DLC04_RQ_Manager Auto Const Mandatory
{autofill}
EndGroup

Group QuestData
ReferenceAlias Property QuestGiver Auto Const Mandatory
{autofill}

ReferenceAlias Property Target Auto Const Mandatory
{target of quest (could be autofill, or specific alias)}

LeveledItem Property DLC04_LL_RQ_QuestReward Auto Const Mandatory
{autofill}

int Property FailQuestStage = 250 Auto Const
EndGroup


Group SpawnData
{If the quest needs to spawn actors rather than find them, these are the aliases spawn gets get forced into. If these are empty, then the quest won't spawn aliases.}

SpawnDatum[] Property SpawnData Auto Const
{Data about what and where to spawn}

Faction Property PlayerAllyFaction Auto Const Mandatory
{autofill}

EndGroup


Group ShockCollarData
{Data for shock collar quests... not all need this data}

ReferenceAlias Property AliasToBeCollared Auto Const
{If this is not none script will make this actor able to be Collared and set StageToSetWhenCollared when player does so}

int Property StageToSetWhenCollared = 100 Auto Const
{default 100; the stage to set when actor is collared
unused if }

bool Property DeleteActorWhenQuestEnds Auto Const
{should we delete the actor (only for spawned refs)}

EndGroup


Group ShutdownForEnemyGangData
Quest Property DLC04MQ05 Auto Const Mandatory
int Property EnemyStage = 8 Auto Const 
GlobalVariable Property DLC04EnemyGang Auto Const Mandatory
;1 = Disciples
;2 = Operators
;3 = Pack
EndGroup



;Set by DLC04_RQ_ManagerScript:
int Property ReasonOfQuest Auto Conditional Hidden
int Property MischiefTargetOfQuest Auto Conditional Hidden
int Property TargetOfQuest Auto Conditional Hidden

;Set in this script - properties in case I need external access (or testing via console)
bool Property HasPlayerAcceptedQuest Auto Conditional Hidden   	
bool Property HasPlayerRefusedQuest Auto Conditional Hidden   	
bool Property HasPlayerCompletedQuest Auto Conditional Hidden  	

faction EnemyCrimeFaction

;Convenience vars set in FillAliasesIfNeededAndSetQuestData() which is called in the startup stage of the quest.
Actor PlayerRef
Actor QuestGiverRef
Actor TargetRef

Actor ActorToBeCollared

Event OnQuestInit()

	;might be none
	ActorToBeCollared = AliasToBeCollared.GetActorReference()

    if ActorToBeCollared
    	RegisterForCustomEvent(DLC04_RQ_Manager, "ActorWasShockCollared")
    	DLC04_RQ_Manager.AllowShockCollar(ActorToBeCollared)
    	DLC04_RQ_Manager.SetQuestGiverActorValue(ActorToBeCollared, QuestGiver.GetActorReference())
    endif

   	RegisterForRemoteEvent(DLC04MQ05, "OnStageSet")

EndEvent

Event Quest.OnStageSet(quest akSender, int auiStageID, int auiItemID)
    if akSender == DLC04MQ05 && auiStageID == EnemyStage
    	trace(self, "Quest.OnStageSet. akSender: " + akSender + ", auiStageID: " + auiStageID)

    	int EnemyGang = DLC04EnemyGang.GetValue() as int

    	int QuestGiverGang = DLC04_RQ_Manager.GetEnemyGangGlobalValueForQuestGiver(QuestGiverRef)

    	trace(self, "QuestGiverGang: " + QuestGiverGang +", EnemyGang: " + EnemyGang)

    	;FailQuestStage
    	if QuestGiverGang == EnemyGang
    		trace(self, "FAILING QUEST: QuestGiverGang == EnemyGang")
    		SetStage(FailQuestStage)
    	endif

    endif
EndEvent

Event OnQuestShutdown()
    trace(self, "OnQuestShutdown() calling SetActiveQuestGiverStatus() false")
    DLC04_RQ_Manager.SetActiveQuestGiverStatus(QuestGiverRef, false)

	if ActorToBeCollared
		DLC04_RQ_Manager.AllowShockCollar(ActorToBeCollared, false)
		DLC04_RQ_Manager.RemoveShockCollar(ActorToBeCollared)

		;if collared, kill actor so other game things treat them as dead and gone
		if GetStageDone(StageToSetWhenCollared)
			ActorToBeCollared.Kill()
		endif

		if DeleteActorWhenQuestEnds
			ActorToBeCollared.delete()
		endif

		ActorToBeCollared = None
	endif

EndEvent

Event DLC04:DLC04_RQ_ManagerScript.ActorWasShockCollared(DLC04_RQ_ManagerScript akSender, Var[] akArgs)
	;we assume only one, the one that was registered for

	Actor EventActorRef = akArgs[0] as Actor
	Actor TargetActor = Target.GetActorReference()

	trace(self, "ActorWasShockCollared() EventActorRef: " + EventActorRef + ", TargetActor: " + TargetActor)

	if EventActorRef == TargetActor
		trace(self, "ActorWasShockCollared() EventActorRef == TargetActor, setting StageToSetWhenCollared: " + StageToSetWhenCollared)
		SetStage(StageToSetWhenCollared)
	endif

EndEvent

Event DLC04:DLC04_RQ_ManagerScript.ShutdownNonAcceptedQuests(DLC04_RQ_ManagerScript akSender, Var[] akArgs)

	Actor EventQuestGiverRef = akArgs[0] as Actor

	trace(self, "ShutdownNonAcceptedQuests()" + \
				"\n----> HasPlayerAcceptedQuest: " + HasPlayerAcceptedQuest + \
				"\n----> EventQuestGiverRef: " + EventQuestGiverRef  + \
				"\n----> My QuestGiver Alias Ref: " + QuestGiverRef) 

	if false == HasPlayerAcceptedQuest && EventQuestGiverRef == QuestGiverRef
		trace(self, "ShutdownNonAcceptedQuests() HasPlayerAcceptedQuest == False and EventQuestGiverRef is my QuestGiverRef. Calling Stop().")
		Stop()
	else
		trace(self, "ShutdownNonAcceptedQuests() NOT shutting down: Quest has been accepted or event is not for its quest giver.")
	endif

EndEvent


;called in startup stage
Function SpawnAliasesIfNeeded()
	trace(self, "SpawnAliasesIfNeeded()")

	;Get FactionAssociation based on quest giver faction
	trace(self, "SpawnAliasesIfNeeded() Getting FriendlyFactionAssociation...")	
	DLC04_RQ_ManagerScript:FactionAssociation FriendlyFactionAssociation = DLC04_RQ_Manager.PickFactionAssociation(IsEnemy = false, PickBasedOnThisActorsFactions = QuestGiverRef, ShouldIgnoreGangs = False)
	trace(self, "SpawnAliasesIfNeeded() FriendlyFactionAssociation: " + FriendlyFactionAssociation)	

	;Get enemy FactionAssociation
	trace(self, "SpawnAliasesIfNeeded() Getting EnemyFactionAssociation...")	
	DLC04_RQ_ManagerScript:FactionAssociation EnemyFactionAssociation = DLC04_RQ_Manager.PickFactionAssociation(IsEnemy = true)
	trace(self, "SpawnAliasesIfNeeded() Getting EnemyFactionAssociation: " + EnemyFactionAssociation)	

	;Spawn guys and force into aliases
	int i = 0
	While (i < SpawnData.length)
		SpawnDatum currentSpawnDatum = SpawnData[i]
		
		;by default, use enemy FactionAssociation
		DLC04_RQ_ManagerScript:FactionAssociation FactionAssociationToUse = EnemyFactionAssociation

		;if it's friendly alias, use the FrienclyFactionAssociation instead
		bool isFriendly = currentSpawnDatum.isFriendly
		if isFriendly
			FactionAssociationToUse = FriendlyFactionAssociation
		endif

		;by default, use the non-boss 
		ActorBase ActorBaseToSpawn = FactionAssociationToUse.AssociatedLeveledActor

		;if it's supposed to be a boss, use that instead
		if currentSpawnDatum.isBoss
			ActorBaseToSpawn = FactionAssociationToUse.AssociatedLeveledActorBoss
		endif


		int DifficultyLevel = currentSpawnDatum.DifficultyLevel
		ObjectReference RefToSpawnAt = currentSpawnDatum.AliasToSpawnAt.GetReference()
		trace(self, "SpawnAliasesIfNeeded() ActorBaseToSpawn: " + ActorBaseToSpawn + ", DifficultyLevel: " + DifficultyLevel + ", RefToSpawnAt:" + RefToSpawnAt)
		
		Actor SpawnedRef = RefToSpawnAt.PlaceActorAtMe(ActorBaseToSpawn, DifficultyLevel)

		ReferenceAlias AliasToForceInto = currentSpawnDatum.AliasToSpawn
		trace(self, "SpawnAliasesIfNeeded() Forcing SpawnedRef: " + SpawnedRef + " into AliasToForceInto: " + AliasToForceInto)
		AliasToForceInto.ForceRefTo(SpawnedRef)

		ReferenceAlias AliasToForceIntoLinks = currentSpawnDatum.AliasWithLinks
		trace(self, "SpawnAliasesIfNeeded() Forcing SpawnedRef: " + SpawnedRef + " into another AliasToForceIntoLinks: " + AliasToForceIntoLinks)
		AliasToForceIntoLinks.ForceRefTo(SpawnedRef)

		trace(self, "SpawnAliasesIfNeeded() moving SpawnedRef: " + SpawnedRef + " to RefToSpawnAt: " + RefToSpawnAt)
		SpawnedRef.moveto(RefToSpawnAt)  ;deals with some AI timing issues - if i don't do this, they are at the wrong place.

		if isFriendly
			trace(self, "SpawnAliasesIfNeeded() isFriendly, adding to Faction PlayerAllyFaction - SpawnedRef: " + SpawnedRef)
			SpawnedRef.AddToFaction(PlayerAllyFaction)
		else ;is enemy
			EnemyCrimeFaction = SpawnedRef.GetCrimeFaction()
			trace(self, "SpawnAliasesIfNeeded() set EnemyCrimeFaction to: " + EnemyCrimeFaction)
		endif

		i += 1
	EndWhile


EndFunction


Function DeleteSpawnedReferences()
	trace(self, "DeleteSpawnedReferences()")

	;CLEAR the targetref variable so the actor in it can go away
	TargetRef = none

	int i = 0
	While (i < SpawnData.length)
	
		ObjectReference spawnedRef = SpawnData[i].AliasToSpawn.GetReference()

		trace(self, "DeleteSpawnedReferences() marking for delete spawnedRef: " + spawnedRef)
		
		spawnedRef.Delete()
		
		i += 1
	EndWhile
	
EndFunction




;called in startup stage
Function FillAliasesIfNeededAndSetQuestData(bool allowHelpSettlement = true, bool allowMischief = true)
	trace(self, "FillAliasesIfNeededAndSetQuestData() allowHelpSettlement: " + allowHelpSettlement + ", allowMischief: " + allowMischief)

	RegisterForCustomEvent(DLC04_RQ_Manager, "ShutdownNonAcceptedQuests")

	PlayerRef = Game.GetPlayer()
	QuestGiverRef = QuestGiver.GetActorReference()

	;SpawnAliasesIfNeeded() requires QuestGiverRef to be set
	SpawnAliasesIfNeeded()

	;Need to wait until after SpawnAliasesIfNeeded is done to set TargetRef because the Target alias might be filled by that function
	TargetRef = Target.GetActorReference()

	SetTargetCrimeFactionIfNeeded(TargetRef)

	;used to increment count of active quests
	DLC04_RQ_Manager.SetActiveQuestGiverStatus(QuestGiverRef, true)

	;used to set data on this quest (will be used in conjunctions with SetQuestGiverData() )
	DLC04_RQ_Manager.SetQuestData(self, QuestGiverRef, TargetRef, allowHelpSettlement, allowMischief)

EndFunction

Function SetTargetCrimeFactionIfNeeded(Actor TargetActor)
	faction crimeFaction = DLC04_RQ_Manager.GetTargetCrimeFaction(TargetRef)

	trace(self,"SetTargetCrimeFactionIfNeeded() crimeFaction: " + crimeFaction)

	if crimeFaction
		TargetRef.SetCrimeFaction(crimeFaction)
	endif

EndFunction

Function MakeEnemyCrimeFactionAngry()
	trace(self,"MakeCrimeFactionAngry() EnemyCrimeFaction: " + EnemyCrimeFaction)
	EnemyCrimeFaction.SetPlayerEnemy()
EndFunction


Function SetQuestGiverData()
	;sets actor values on quest giver to match current quest, so shared topics can be properly conditioend	
	trace(self, "SetQuestGiverData()")

	DLC04_RQ_Manager.SetQuestGiverData(self, QuestGiverRef)

EndFunction

Function PlayerAcceptedQuest()
	trace(self, "PlayerAcceptedQuest() Setting HasPlayerAcceptedQuest to True")
	HasPlayerAcceptedQuest = true
EndFunction

Function PlayerRefusedQuest()
	trace(self, "PlayerAcceptedQuest() Setting HasPlayerRefusedQuest to True")
	HasPlayerRefusedQuest = true

	;roll a new quest
	DLC04_RQ_Manager.StartQuest(QuestGiverRef)

EndFunction

Function PlayerCompletedQuest()
	trace(self, "PlayerCompletedQuest() Setting HasPlayerCompletedQuest to True & calling CheckAndAwardAchievementIfNeeded()")
	HasPlayerCompletedQuest = true
	DLC04_RQ_Manager.CheckAndAwardAchievementIfNeeded()
EndFunction

Function RewardPlayer()
	trace(self, "RewardPlayer()")
	PlayerRef.AddItem(DLC04_LL_RQ_QuestReward)
EndFunction

bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) debugOnly
	RETURN DLC04_RQ_Manager.Trace(CallingObject, asTextToPrint, aiSeverity) 
EndFunction

