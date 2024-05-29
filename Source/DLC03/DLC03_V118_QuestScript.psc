Scriptname DLC03:DLC03_V118_QuestScript extends Quest Conditional


int Property Accusee = 0 Auto Conditional
{1 = Santiago
2 = Gilda
3 = Keith
4 = Julianna
5 = Bert}

RefCollectionAlias Property Clues Auto Const Mandatory
RefCollectionAlias Property LockedDoors Auto Const Mandatory

Struct DoorState
	objectReference thisDoor
	int LockedState
endStruct

DoorState[] Property DoorStates Auto Hidden

Function RunQuestShutdown()
	Clues.DisableAll()
EndFunction

Function DoInit()
	Debug.Trace(Self + ": Running OnQuestINIT")
	StoreDoorStates()
	LockAllDoors("Inaccessible")

	
EndFunction

Function SetAccusee(int iSet)
	Accusee = iSet
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Functions to lock doors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function StoreDoorStates()
	int DoorCount = LockedDoors.GetCount()
	Debug.Trace(Self + " DoorCount = " + DoorCount)
	DoorStates = new DoorState[DoorCount]
	Debug.Trace(Self + " DoorStates = " + DoorStates)
	int i = 0
	while i < DoorCount
		DoorStates[i] = new DoorState
		DoorStates[i].thisDoor = LockedDoors.GetAt(i)
		DoorStates[i].LockedState = DoorStates[i].thisDoor.GetLockLevel()
		i += 1
	endWhile
	Debug.Trace(Self + " DoorStates = " + DoorStates)
EndFunction

Function LockAllDoors(string lockLevel)
	int lockLevelInt = GetLockedLevelInt(lockLevel)
	int i = 0
	int DoorCount = DoorStates.Length
	while i < DoorCount
		
		DoorStates[i].thisDoor.SetLockLevel(lockLevelInt)
		if lockLevelInt > 0
			DoorStates[i].thisDoor.Lock()
		else 	;This is being told to unlock
			DoorStates[i].thisDoor.Unlock()
		endif
		i += 1
	endWhile
EndFunction

Function ReturnDoorLockState()
	int i = 0
	int DoorCount = DoorStates.Length
	while i < DoorCount
		DoorStates[i].thisDoor.SetLockLevel(DoorStates[i].LockedState)
		if DoorStates[i].LockedState > 0
			DoorStates[i].thisDoor.Lock()
		else 	;This is being told to unlock
			DoorStates[i].thisDoor.Unlock()
		endif
		i += 1
	endWhile
endFunction

int Function GetLockedLevelInt(string lockLevel)
	if lockLevel == "Unlocked" || lockLevel == "unlocked"
		return 0
	elseif lockLevel == "Novice" || lockLevel == "novice"
		return 25
	elseif lockLevel == "Advanced" || lockLevel == "advanced"
		return 50
	elseif lockLevel == "Expert" || lockLevel == "expert"
		return 75
	elseif lockLevel == "Master" || lockLevel == "master"
		return 100
	elseif lockLevel == "Barred" || lockLevel == "barred"
		return 251
	elseif lockLevel == "Chained" || lockLevel == "chained"
		return 252
	elseif lockLevel == "Terminal Only"
		return 253
	elseif lockLevel == "Inaccessible" || lockLevel == "inaccessible"
		return 254
	elseif lockLevel == "Requires Key"
		return 255
	endif
EndFunction

;/
0 = Unlocked
25 = Novice
50 = Advanced
75 = Expert
100 = Master
251 = Barred
252 = Chained
253 = Terminal Only
254 = Inaccessible
255 = Requires Key
/;

Quest Property DLC03_V118_ClueTracker Auto Const Mandatory
Function SetClueTrackerStage(int stageToSet)
	if !DLC03_V118_ClueTracker.GetStageDone(stageToSet)
		DLC03_V118_ClueTracker.SetStage(stageToSet)
	endif
EndFunction

Group Factions
	Faction Property DLC03Vault118_ResidentFaction Auto Const mandatory
	Faction Property DLC03Vault118_CombatFaction Auto Const mandatory
	Faction Property PlayerFaction Auto Const mandatory
	Faction Property DLC03Vault118_SecurityFaction Auto Const mandatory
EndGroup

ActorValue Property Aggression Auto Const Mandatory
DLC03:DLC03DialogueV118Script Property DLC03DialogueV118 Auto Const Mandatory
Function SetUpConfrontationFight(referenceAlias myRefAlias)
	;/
	Actor myActor = myRefAlias.GetActorRef()
	myActor.RemoveFromFaction(DLC03Vault118_ResidentFaction)
	myActor.AddToFaction(DLC03Vault118_CombatFaction)
	/;
	DLC03DialogueV118.SetUpConfrontationFight(myRefAlias)
EndFunction

Function StartConfrontationFight(referenceAlias myRefAlias, int myAccuseeInt)
	;/
	Actor myActor = myRefAlias.GetActorRef()
	DLC03Vault118_CombatFaction.SetEnemy(PlayerFaction)
	DLC03Vault118_CombatFaction.SetEnemy(DLC03Vault118_ResidentFaction)
	DLC03Vault118_CombatFaction.SetEnemy(DLC03Vault118_SecurityFaction)
	myActor.SetValue(Aggression, 2)
	myActor.StartCombat(game.GetPlayer())

	Accusee = myAccuseeInt
	/;
	DLC03DialogueV118.StartConfrontationFight(myRefAlias, myAccuseeInt)
EndFunction

Group DateProperties
	ReferenceAlias Property Gilda Auto Const Mandatory
	objectReference Property GildaDateMarkerRef Auto Const mandatory
	objectReference Property PlayerDateMarkerRef Auto Const mandatory
	Scene Property DLC03_V118_Quest_GildaDateScene Auto Const mandatory
	bool Property DateComplete Auto Conditional hidden
	Spell Property LoversEmbracePerkSpell Auto Const Mandatory
EndGroup
Function Date()
	InputEnableLayer myLayer = InputEnableLayer.Create()
	Actor myPlayer = Game.GetPlayer()
	Actor GildaRef = Gilda.GetActorRef()

	myLayer.DisablePlayerControls()
	Game.FadeOutGame(True, True, 0.0, 3.0, True)
	Utility.Wait(5.0)
	;Game.PassTime(4)
	Utility.Wait(0.1)
	GildaRef.moveto(GildaDateMarkerRef)
	myPlayer.Moveto(PlayerDateMarkerRef)
	Utility.Wait(0.1)

	Game.FadeOutGame(False, True, 0.0, 3.0)
	;track when the scene should progress
	DateComplete = 0
	DLC03_V118_Quest_GildaDateScene.Start()
	Utility.Wait(3.0)
	LoversEmbracePerkSpell.Cast(myPlayer, myPlayer)
	DateComplete = 1
	myLayer = None
EndFunction
Bool Property PlayerOnPathToJulianna Auto Conditional

Bool Property InvestigateRiggs Auto Conditional
