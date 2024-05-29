Scriptname DLC04:DLC04KiddieKingdomMainQuestScript extends Quest Conditional


int Property PALineToPlay = -1 Auto Conditional hidden
{This is used to tell the PA scene which line to play}

Formlist Property DLC04KiddieKingdomPAObjectsFL Auto Const Mandatory
float Property PAFindRadius = 2300.0 Auto Const
ReferenceAlias Property ClosestPA Auto Const
ReferenceAlias Property Oswald Auto Const mandatory
float Property RecheckTime = 3.0 Auto Const
Scene Property DLC04_KiddieKingdomPA Auto Const

GlobalVariable Property DLC04_KK_RadMistersAreOn Auto Const Mandatory
objectReference Property DLC04_KK_OswaldHoldingCellRef Auto Const mandatory
RefCollectionAlias Property MistTriggers Auto Const Mandatory

Group FactionGroup
	Faction Property FeralGhoulFaction Auto Const Mandatory
	Faction Property DLC04OswaldFaction Auto Const Mandatory
	Faction Property PlayerFaction Auto Const mandatory
	Faction Property DLC04HostileGhoulFaction Auto Const Mandatory
EndGroup


bool isBusy = false
bool PATotallyOver = false
bool initialized
;Keeping this external for debuging purposes
float CurrentTimeCheck

Struct PAQueueEntry
	int myLine
	float timeStamp
EndStruct

PAQueueEntry[] Property PAQueue Auto hidden
int[] Property PlayOnlyOnceLines Auto

Function Init()
	if !initialized
		initialized = true
		DLC04OswaldFaction.SetAlly(FeralGhoulFaction, 1, 1)
		DLC04HostileGhoulFaction.SetEnemy(PlayerFaction)
		PAQueue = New PAQueueEntry[0]
		if !PlayOnlyOnceLines
			PlayOnlyOnceLines = new int[0]
		endif
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			PA Controller
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function AddToPAQueue(int lineToAdd, bool playOnlyOnce, float cutOffTime = -1.0)
	if !initialized
		init()
	endif

	Debug.Trace(Self + ": AddToPAQueue")
	Debug.Trace(Self + ": lineToAdd == " + lineToAdd + " || cutOffTime == " + cutOffTime)
	if PlayOnlyOnceLines.find(lineToAdd) < 0
		Debug.Trace(Self + ": Line is Valid")
		PAQueueEntry NewPAQueueEntry = new PAQueueEntry
		NewPAQueueEntry.myLine = lineToAdd
		NewPAQueueEntry.timeStamp = utility.getCurrentRealTime()

		;If this is a play only once line, add it to the array
		if playOnlyOnce
			Debug.Trace(Self + ": Adding line >> " + lineToAdd + " << to PlayOnlyOnceLines")
			PlayOnlyOnceLines.Add(lineToAdd)
		endif

		;if the cut off time for this line is greater than 0, add that to the timestamp
		if cutOffTime > 0
			NewPAQueueEntry.timeStamp += cutOffTime
		else 	;If less than 0, this has no cut off time
			NewPAQueueEntry.timeStamp = -1.0
		endif

		PAQueue.Add(NewPAQueueEntry)
		TryToPlayPALine()
	else
		Debug.Trace(Self + ": lineToAdd is in the PlayOnlyOnceLines")
	endif
EndFunction

int RecheckQueueID = 99999
Function TryToPlayPALine()
	Debug.Trace(Self + ": TryToPlayPALine")
	objectReference ClosestPARef = game.FindClosestReferenceOfAnyTypeInListFromRef(DLC04KiddieKingdomPAObjectsFL, Game.GetPlayer(), PAFindRadius)
	if !PATotallyOver
		if ClosestPARef && !IsBusy
			if!DLC04_KiddieKingdomPA.isPlaying()
				ClosestPA.ForceRefTo(ClosestPARef)
					;if timestamp is -1.0 (override) OR if current gametime is less than the timestamp
					CurrentTimeCheck = utility.getCurrentRealTime() 
					if PAQueue[0].timeStamp == -1.0 || CurrentTimeCheck <= PAQueue[0].timeStamp
						;Force the line int to myLine
						PALineToPlay = PAQueue[0].myLine
						PAQueue.Remove(0)

						;Now start the scene
						Debug.Trace(Self + ": Starting Kiddie Kingdom PA Scene :: PALineToPlay == " + PALineToPlay)
						DLC04_KiddieKingdomPA.Start()

						;In theory, the scene should call the recheck timer
						;StartRecheckTimerIfNeeded()

					else 	;Not Override, past timestamp cut off
						;So Remove the current queue entry
						Debug.Trace(Self + ": Line # " + PAQueue[0].myLine + " has expired, removing from the queue")
						PAQueue.Remove(0)
						StartRecheckTimerIfNeeded()
					endif
			else
				Debug.Trace(Self + ": DLC04_KiddieKingdomPA is already playing")
			endif
		else
			if !ClosestPARef
				Debug.Trace(Self + ": Could not find nearby PA")
			endif
			StartRecheckTimerIfNeeded()
		endif
	endif
EndFunction

Function PASceneEnded()
	Debug.Trace(Self + ": PASceneEnded")
	PALineToPlay = -1
	StartRecheckTimerIfNeeded()
EndFunction

Function StartRecheckTimerIfNeeded()
	Debug.Trace(Self + ": StartRecheckTimerIfNeeded")
	if PAQueue.Length > 0
		StartTimer(RecheckTime, RecheckQueueID)
	else
		Debug.Trace(Self + ": PAQueue.Length == " + PAQueue.Length)
	endif
EndFunction

Function SetBusy(bool busy)
	isBusy = busy
	if !isBusy
		StartRecheckTimerIfNeeded()
	endif
EndFunction

Function SetPADoneForever()
	ForceClearPAQueue()
	PATotallyOver = true
endFunction



Function ForceClearPAQueue()
	PAQueue = none
EndFunction

Bool RacerPA1
bool BlastoffPA1
bool TrapHitThrottle
float TrapHitPACooldown = 10.0
Int TrapHitPACooldownID = 222
Function DoTrapPA(int whichTrap)
	;This is a nuka racer
	if !TrapHitThrottle
		TrapHitThrottle = true
		if whichTrap == 0
			if !RacerPA1
				RacerPA1 = true
				AddToPAQueue(65, true, 25)
			else
				AddToPAQueue(67, true, 15)
			endif
		;This is the Blast Off
		elseif whichTrap == 1
			if !BlastoffPA1
				BlastoffPA1 = true
				AddToPAQueue(66, true, 25)
			else
				AddToPAQueue(67, true, 15)
			EndIf
		Endif
		StartTimer(TrapHitPACooldown, TrapHitPACooldownID)
	endif
EndFunction

bool hasDoneOverrunPAline
Function CheckForManyCombatants()
	if !hasDoneOverrunPAline
		Actor[] combatants = Game.GetPlayer().GetAllCombatTargets()
		if combatants.length > 6
			hasDoneOverrunPAline = true
			AddToPAQueue(75, true, 30)
		EndIf
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Specific PA Scene Starters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool MisterWasTurnedOff = false
bool FirstMisterReactivationLineDone = false
Function SetRadMisterState(bool isItOn)
	DLC04_KK_RadMistersAreOn.SetValue(isItOn as float)
	if !isItOn && GetStageDone(200)
		MisterWasTurnedOff = true
		;Tell the misters to turn off
		int i = 0
		int Count = MistTriggers.GetCount()
		while i < count
			(MistTriggers.GetAt(i) as DLC04:DLC04RadMisterControllerScript).TurnOffMistFinal()
			i += 1
		EndWhile
	endif
	
	;Check for SetStages
	if GetStageDone(810) && !GetStageDone(820)
		SetStage(820)
	elseif !GetStageDone(200)
		SetStage(200)
	endif

EndFunction

int MistersTurnedOffOnceStage = 200
Function RadMisterTrigger()
	Debug.Trace(Self + ": RadMisterTrigger")
	;IF The misters have never been turned off
	if !GetStageDone(800)
		if !GetStageDone(100) && !GetStageDone(200)
			AddToPAQueue(20, playOnlyOnce = true, cutOffTime = -1.0)
		elseif MisterWasTurnedOff 	;Misters have been turned off at one point
			if !FirstMisterReactivationLineDone
				FirstMisterReactivationLineDone = true
				AddToPAQueue(21, playOnlyOnce = true, cutOffTime = -1.0)
			else
				AddToPAQueue(22, playOnlyOnce = false, cutOffTime = -1.0)
			endif
			MisterWasTurnedOff = false
		endif
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Oswald In person scene starter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Struct SceneToDo
	bool SceneIsDone
	scene myScene
	objectReference myMoveMarker
	int myDoneStage
EndStruct

SceneToDo[] Property ScenesToDo Auto Const Mandatory
ActorValue Property DLC04_KK_CurrentScene Auto Const Mandatory

bool Function TryToStartMyScene(int mySceneNumber)
	Debug.Trace(Self + " Trying to start Scene " + mySceneNumber)
	objectReference Oz = Oswald.GetReference()
	if !GetStageDone(700) && !(Oz as actor).IsDead()
		if mySceneNumber < 0 || mySceneNumber > ScenesToDo.Length
			Debug.Trace(self + ": Are you daft? " + mySceneNumber + " is not valid")
			Return false
		endif
		;if my scene is not already done (set by the end stage of the scene)
		if !ScenesToDo[mySceneNumber].SceneIsDone
			if ScenesToDo[mySceneNumber].myMoveMarker
				Oz.MoveTo(ScenesToDo[mySceneNumber].myMoveMarker)
			endif
			if mySceneNumber == 3 && !TheaterInit
				SpawnMagicShowGhouls()
			endif
			if !ScenesToDo[mySceneNumber].myScene.IsPlaying()
				ScenesToDo[mySceneNumber].myScene.Start()
				Oz.SetValue(DLC04_KK_CurrentScene, mySceneNumber)
				Return true
			endif
		else
			return false
		endif
	endif
EndFunction


Function SetMySceneDone(int mySceneNumber)
	Debug.Trace(Self + " SetMySceneDone " + mySceneNumber)
	if mySceneNumber < 0 || mySceneNumber > ScenesToDo.Length
		Debug.Trace(self + ": Are you daft? " + mySceneNumber + " is not valid")
	else
		if ScenesToDo[mySceneNumber].myScene.IsPlaying()
			ScenesToDo[mySceneNumber].myScene.Stop()
		endif
		ScenesToDo[mySceneNumber].SceneIsDone = true
		SetStage(ScenesToDo[mySceneNumber].myDoneStage)
	endif
EndFunction


Scene[] Property StageShowScenes Auto Const Mandatory

Function CancelMyScene(int mySceneNumber)
	Debug.Trace(Self + " CancelMyScene " + mySceneNumber)
	if !ScenesToDo[mySceneNumber].SceneIsDone
		;Special case because of the multipart scene
		if mySceneNumber == 3
			int i = 0
			int count = StageShowScenes.Length
			while i < count
				if StageShowScenes[i].IsPlaying()
					StageShowScenes[i].Stop()
				endif
				i += 1
			endWhile
			;If you have left after the stage scene has started
			;	it is now counted as 'complete'
			if GetStageDone(580) && !GetStageDone(600)
				SetStage(600)
			Endif
		elseif ScenesToDo[mySceneNumber].myScene.IsPlaying()
			ScenesToDo[mySceneNumber].myScene.Stop()
			TeleportOswaldToHolding()
		endif
	endif

EndFunction

Function CheckMagicShowEnd()
	int i = 0
	int count = StageShowScenes.Length
	while i < count
		if StageShowScenes[i].IsPlaying()
			StageShowScenes[i].Stop()
		endif
		i += 1
	endWhile
EndFunction



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Check for Final Scene Start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int[] Property StagesForOswaldEvent Auto Const Mandatory
int Property OswaldEventStage = 700 Auto Const

Function CheckForOswaldEvent()
	Debug.Trace(Self + "CheckForOswaldEvent")
	int i = 0
	int count = StagesForOswaldEvent.Length
	bool AllStagesDone = true
	while (i < count) && AllStagesDone
		if !GetStageDone(StagesForOswaldEvent[i])
			AllStagesDone = false
		endif
		i += 1
	endwhile
	if AllStagesDone
		Debug.Trace(Self + "AllStagesDone = True")
		SetStage(OswaldEventStage)
	else
		Debug.Trace(Self + "AllStagesDone = False")
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Teleportation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Group TeleportationProperties
	Explosion Property AppearExplosion Auto Const Mandatory
	objectReference Property DLC04_KK_StageMarker_Center Auto Const Mandatory
	objectReference Property DLC04_KK_RoofMarker01 Auto Const Mandatory
	objectReference Property DLC04_KK_StageMarker_ThroneRef Auto Const Mandatory
	objectReference Property DLC04_KK_StageMarker_BalconyLeft Auto Const mandatory
	Idle Property DLC04LooseSmokeBombThrow Auto Const Mandatory
	Idle Property DLC04LooseSmokeBombThrowCombat Auto Const Mandatory
	Spell Property DLC04_AbOswaldTeleportInvisibility Auto Const Mandatory
EndGroup

Float TeleportTime = 1.2
Float smokebombTiming = 0.3
Float smokebombTiming2 = 0.2
Float smokebombTiming3 = 0.2
bool teleportInProgress = false
Function TeleportOswaldTo(objectReference TeleportRef, bool SilentTeleport = false, bool HealAsWell = false)
	if !teleportInProgress
		teleportInProgress = true
		Debug.Trace(Self + "Teleporting Oswald to >> " + TeleportRef)
		Actor Oz = Oswald.GetActorReference()
		Oz.SetGhost(true)
		float OzHealth = Oz.GetValue(Health)
		if OzHealth < 20
			Oz.RestoreValue(Health, 20)
			OzHealth += 20
		Endif
		Oz.SetValue(DLC04KKTeleportInProgress, 1)
		if Oz.Is3dLoaded() && !SilentTeleport
			if Oz.IsweaponDrawn()
				Oz.PlayIdle(DLC04LooseSmokeBombThrowCombat)
			else
				Oz.PlayIdle(DLC04LooseSmokeBombThrow)
			Endif
			utility.wait(smokebombTiming)
			Oz.PlaceAtMe(AppearExplosion)
		Endif
		utility.wait(smokebombTiming2)
		Oz.AddSpell(DLC04_AbOswaldTeleportInvisibility)
		utility.wait(smokebombTiming3)
		Oz.Disable()
		Oz.MoveTo(TeleportRef, abMatchRotation = true)
		utility.wait(TeleportTime)

		TeleportRef.PlaceAtMe(AppearExplosion)
		if TeleportRef.Is3dLoaded() && !SilentTeleport
			utility.wait(smokebombTiming)
		endif
		Oz.Enable()
		;This is to put his health back, as enable/disable or move seems to totally heal him
		Oz.DamageValue(Health, Oz.GetValue(Health) - OZhealth)
		utility.wait(smokebombTiming2)
		Oz.RemoveSpell(DLC04_AbOswaldTeleportInvisibility)
		Oz.SetValue(DLC04KKTeleportInProgress, 0)
		Oz.EvaluatePackage()

		if HealAsWell
			DoGhoulBlast()
			Oz.RestoreValue(Health, 300)
		endif
		Oz.SetGhost(false)
		teleportInProgress = false
	ENDIF
EndFunction

Function TeleportOswaldToStage()
	TeleportOswaldTo(DLC04_KK_StageMarker_BalconyLeft)
	SetBusy(true)
	TheaterFightIsRunning = true
EndFunction

Function TeleportOswaldToStageChair()
	Actor Oz = Oswald.GetActorReference()
	Oz.Disable()
	Oz.MoveTo(DLC04_KK_StageMarker_ThroneRef)
EndFunction

Function TeleportOswaldToRoof()
	TeleportOswaldTo(DLC04_KK_RoofMarker01)
	SetBusy(true)
EndFunction

Function TeleportOswaldToHolding(bool SilentTeleport = false)
	Actor Oz = Oswald.GetActorReference()
	TeleportOswaldTo(DLC04_KK_OswaldHoldingCellRef, SilentTeleport)
	Oz.StopCombat()
	Oz.StopCombatAlarm()
	Oz.ResetHealthAndLimbs()
EndFunction

Function TeleportTest()
	TeleportOswaldTo(DLC04_KK_OswaldHoldingCellRef)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Timer Events
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnTimer(int aiTimerID)
	Debug.Trace(Self + ": OnTimer " + aiTimerID)
    if aiTimerID == RecheckQueueID
    	Debug.Trace(Self + ": OnTimer RecheckQueueID")
    	TryToPlayPALine()
    	CheckForManyCombatants()
    elseif aiTimerID >= SpawnTimerID && aiTimerID <= (SpawnTimerID + 10)
    	SpawnFightGhoul(SpawnMarkers.GetAt(aiTimerID - SpawnTimerID))
    elseif aiTimerID == TeleportCooldownID
    	canFightTeleport = true
    elseif aiTimerID == TrapHitPACooldownID
    	TrapHitThrottle = false
    Endif
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			On Hit Teleports
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Bool canFightTeleport = true
bool teleportCheckBusy
int TeleportCooldownID = 88
Function RunOswaldHit()
	Debug.Trace(self + " RunOswaldHit")
	;If hit during the theater scene
	if DLC04KiddieKingdomTheater01.IsLoaded() && !GetStageDone(570) && !GetStageDone(TheaterEndStage)
		SetStage(570)
	Endif

	;If hit during the Tunnel Scene
	If GetStageDone(128) && !GetStageDone(129)
		SetStage(130)
	Endif

	;If we are in the theater do whatever we do
	if TheaterFightIsRunning 
	;If we are not at the final fight set up	
	elseif !GetStageDone(OswaldEventStage)
		TeleportOswaldToHolding()
		AddToPAQueue(30, playOnlyOnce = false, cutOffTime = -1.0)
	elseif !FinalFightIsRunning
		StartFight()
	elseif FinalFightIsRunning && !teleportCheckBusy && !BleedoutCheckBusy
		teleportCheckBusy = true
		if canFightTeleport
			if BleedoutEvents < 2 && Oswald.GetActorReference().GetValuePercentage(Health) > 0.5
				canFightTeleport = false
				FinalFightTeleport()
				StartTimer(FightTeleportCooldown, TeleportCooldownID)
			endif
		endif
		teleportCheckBusy = false
	endif
EndFunction

int TheaterStartSceneStage = 510
int TheaterEndStage = 600
Cell Property DLC04KiddieKingdomTheater01 Auto Const mandatory
bool BleedoutCheckBusy = false
Function RunOswaldBleedOut()
	BleedoutCheckBusy = true
	Actor Oz = Oswald.GetActorReference()
	if GetStageDone(TheaterStartSceneStage) && !GetStageDone(TheaterEndStage) && DLC04KiddieKingdomTheater01.IsAttached()
		TheaterFightEnd()
	elseif finalFightIsRunning && BleedoutEvents < 2
		BleedoutEvents += 1
		FinalFightBleedoutTeleport()
	elseif finalFightIsRunning && BleedoutEvents < 3
		BleedoutEvents += 1
		FinalFightBleedoutTeleport()
		Oz.SetEssential(false)
		Oz.SetProtected(false)
	EndIf
	BleedoutCheckBusy = false
EndFunction

Function FinalFightBleedoutTeleport()
	While teleportInProgress
		utility.Wait(1.0)
	endWhile
	TeleportOswaldTo(GetFarTeleportMarker(), false, true)
	SpawnFightGhouls(3)
EndFunction

Function FinalFightTeleport()
	if !BleedoutCheckBusy
		objectReference oz = Oswald.GetReference()
		float dist = game.GetPlayer().GetDistance(oz)
		;If the player is close, teleport far
		if dist >= 512
			TeleportOswaldTo(GetCloseTeleportMarker())
		;If the player is far, teleport clsoe
		else
			TeleportOswaldTo(GetFarTeleportMarker())
		endif
	endif
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Final Fighting Fantasy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int BleedoutEvents = 0

Group BossFightProperties
	ActorValue Property Aggression Auto Const mandatory
	ActorValue Property Health Auto Const mandatory
	ActorValue Property DLC04KKTeleportInProgress Auto Const mandatory
	RefCollectionAlias Property SpawnMarkers Auto Const Mandatory
	RefCollectionAlias Property TeleportMarkers Auto Const Mandatory
	objectReference Property KKBossFightPrim Auto Const Mandatory
	form Property DLC04_LvlFeralGhoulAmbush Auto Const Mandatory
	Keyword Property LinkAmbushFurniture Auto Const Mandatory
	keyword Property DMP_Suspicious_Sandbox_512 Auto Const Mandatory
	Keyword Property DMP_Combat_HoldPosition_128 Auto Const Mandatory
	Keyword Property DMP_Combat_HoldPreferredPosition Auto Const Mandatory
	Form Property DLC04KKBossTeleportMarker Auto Const Mandatory
	float Property FightTeleportCooldown = 7.0 Auto Const
EndGroup

bool FinalFightIsRunning
Function StartFight()
	Debug.Trace(self + ": StartFight")
	finalFightIsRunning = true
	DLC04OswaldFaction.SetEnemy(PlayerFaction)
	DLC04OswaldFaction.SetAlly(FeralGhoulFaction)
	Actor Oz = Oswald.GetActorReference()
	Oz.SetValue(Aggression, 2)
	Oz.SetLinkedREf(KKBossFightPrim, DMP_Combat_HoldPosition_128)
	SpawnFightGhouls(3)

	;These will be removed later
EndFunction

Group GhoulBlastProperties
	Idle Property CastShield Auto Const mandatory
	Spell Property DLC04_OswaldGlowingOneBurst Auto Const Mandatory
EndGroup

Function DoGhoulBlast(bool withIdle = true)
	Debug.Trace(self + ": DoGhoulBlast")
	Actor Oz = Oswald.GetActorReference()
	;Oz.Cast(crGlowingOneBurst)
	if withIdle
		Oz.PlayIdle(CastShield)
	endif
	DLC04_OswaldGlowingOneBurst.Cast(Oz)
EndFunction

int SpawnTimerID = 10
Function SpawnFightGhouls(int numToSpawn)
	Debug.Trace(self + ": SpawnFightGhouls >> " + numToSpawn)
	int i
	int R
	int countActual
	int count = SpawnMarkers.GetCount() - 1
	Debug.Trace(self + ": Spawn count >> " + count)
	int[] SpawnFurnitureNumbers = new int[0]
	while i < numToSpawn && i < count
		R = utility.RandomInt(0, count)
		if SpawnFurnitureNumbers.Find(R) < 0
			SpawnFurnitureNumbers.Add(R)
			i += 1
			countActual += 1
		endif
	EndWhile
	i = 0
	While i < countActual
		StartTimer(0.5, (SpawnTimerID + SpawnFurnitureNumbers[i]))
		i += 1
	EndWhile
EndFunction

Actor[] FightGhouls
Function SpawnFightGhoul(objectReference ambushRef)
	if !FightGhouls
		FightGhouls = new Actor[0]
	endif

	actor mySpawn = DLC04_KK_SpawnMarkerRef.PlaceAtMe(DLC04_LvlFeralGhoulAmbush, 1, false, true) as actor
    FightGhouls.Add(mySpawn)
    mySpawn.SetLinkedREf(ambushRef,LinkAmbushFurniture)
    mySpawn.SetLinkedREf(KKBossFightPrim, DMP_Suspicious_Sandbox_512)
    mySpawn.SetLinkedREf(KKBossFightPrim, DMP_Combat_HoldPosition_128)
	mySpawn.MoveTo(ambushRef)
    mySpawn.Enable()
    utility.wait(1.0)
    mySpawn.Activate(mySpawn)
    utility.wait(2.0)
EndFunction

ObjectReference Function GetCloseTeleportMarker()
	ObjectReference Tmarker
	Tmarker = game.FindClosestReferenceOfTypeFromRef(DLC04KKBossTeleportMarker, Game.GetPlayer(), 5000.0)
	Return Tmarker
EndFunction

float MinFarDistance = 1024.0
ObjectReference Function GetFarTeleportMarker()
	ObjectReference Tmarker
	bool MarkerFound
	int count = (TeleportMarkers.GetCount() - 1)
	Actor PlayerActor = Game.GetPlayer()
	While !MarkerFound
		Tmarker = TeleportMarkers.GetAt(utility.RandomInt(0, count))
		if PlayerActor.GetDistance(Tmarker) >= MinFarDistance
			MarkerFound = true
		endif
	endWhile
	Return Tmarker
EndFunction

Function RoofFightEnd()

EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Magic Show stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


objectReference Property DLC04_KK_ChestOfHoldingRef Auto Const mandatory


Group TheaterProperties
	RefCollectionAlias Property TheaterSpawnMarkers Auto Const Mandatory
	RefCollectionAlias Property TheaterGhouls Auto Const Mandatory
	objectReference Property DLC04_KK_SpawnMarkerRef Auto const mandatory
	objectReference Property DLC04_KK_TheaterSpawnMarkerRef Auto Const Mandatory
	form property DLC04_LvlFeralGhoul Auto Const Mandatory
EndGroup

bool TheaterInit = false
Actor[] CrowdGhouls
Function SpawnMagicShowGhouls()
	TheaterGhouls.Killall()
	Debug.Trace(self + ": SpawnMagicShowGhouls")

	CrowdGhouls = new Actor[0]
	TheaterInit = true
	int spawnNum = TheaterSpawnMarkers.GetCount()
	Debug.Trace(self + "::: Spawning " + spawnNum + " ghouls")
	int i = 0
	while i < spawnNum
		Actor currentGhoul
		currentGhoul = (TheaterGhouls.GetAt(i) as actor)
		Debug.Trace(self + "::: Spawning " + currentGhoul)
		;currentGhoul.Kill();Silent()
		;utility.wait(0.1)
		currentghoul.Waitfor3dLoad()
		currentGhoul.MoveTo(TheaterSpawnMarkers.GetAt(i), abMatchRotation = true)
		CrowdGhouls.Add(currentGhoul)
		i += 1
	EndWhile

EndFunction


Function MakeCrowdGhoulsHostile()

	Debug.Trace(self + ": MakeCrowdGhoulsHostile")
	int i = 0
	int count = 0
	count = CrowdGhouls.Length
	Debug.Trace(self + "::: count == " + count)
	if count > 0
		while i < count
			CrowdGhouls[i].SetValue(Aggression, 2)
			CrowdGhouls[i].AddToFaction(DLC04HostileGhoulFaction)
			i += 1
		endWhile	
		Debug.Trace(self + "::: Made it past the while loop")
		CrowdGhouls = none
	endif
	Oswald.GetActorReference().StartCombat(Game.GetPlayer())
EndFunction	

Group TheaterDoors
	objectReference Property DLC04_KK_TheaterDoorL const auto mandatory
	objectReference Property DLC04_KK_TheaterDoorR const auto mandatory
	objectReference Property DLC04_KK_TheaterDoorLColl const auto mandatory
	objectReference Property DLC04_KK_TheaterDoorRColl const auto mandatory
EndGroup
Function LockTheaterDoors()
	DLC04_KK_TheaterDoorLColl.EnableNoWait()
	DLC04_KK_TheaterDoorRColl.EnableNoWait()
	int openState = DLC04_KK_TheaterDoorL.GetOpenState()
	if openState == 1 || openState == 2
		DLC04_KK_TheaterDoorL.SetOpen(false)
	endif
	openState = DLC04_KK_TheaterDoorR.GetOpenState()
	if openState == 1 || openState == 2
		DLC04_KK_TheaterDoorR.SetOpen(false)
	endif
	DLC04_KK_TheaterDoorL.Lock(true)
	DLC04_KK_TheaterDoorL.SetLockLevel(255)
	DLC04_KK_TheaterDoorR.Lock(true)
	DLC04_KK_TheaterDoorR.SetLockLevel(255)
	DLC04_KK_TheaterDoorLColl.DisableNoWait()
	DLC04_KK_TheaterDoorRColl.DisableNoWait()
EndFunction

Function UnlockTheaterDoors()
	DLC04_KK_TheaterDoorL.UnLock()
	DLC04_KK_TheaterDoorR.UnLock()
EndFunction

bool TheaterFightIsRunning
Function TheaterFightEnd()
	Actor Oz = Oswald.GetActorReference()
	Oz.SetGhost(true)
	TeleportOswaldToHolding()
	Oz.SetGhost(false)
	SetStage(TheaterEndStage)
	SetBusy(false)
	AddToPAQueue(250, playOnlyOnce = true, cutOffTime = -1.0)
	TheaterFightIsRunning = false
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Spotlight
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Group SpotlightProperties
	objectReference Property DLC04KKTheaterSpotlightL Auto const Mandatory
EndGroup



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Roof Elevators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Group RoofElevators
	LoadElevatorPanelScript Property DLC04_KK_ElevatorToRoofRef Auto Const Mandatory
	LoadElevatorPanelScript Property DLC04_KK_ElevatorFromRoofRef Auto Const Mandatory
	LoadElevatorPanelScript Property DLC04_KiddieKingdomElevatorInt Auto Const Mandatory
EndGroup

objectReference Property DLC04_KK_ElevatorPAActivatorRef Auto Const mandatory
Function SetRoofElevatorActive()
	DLC04_KK_ElevatorToRoofRef.MakeElevatorFunctional()
	DLC04_KK_ElevatorFromRoofRef.MakeElevatorFunctional()
	DLC04_KiddieKingdomElevatorInt.MakeElevatorFunctional()
	DLC04_KK_ElevatorPAActivatorRef.Disable()
EndFunction

Function SetRoofElevatorDisabled()
	;DLC04_KK_ElevatorToRoofRef.MakeElevatorFunctional()
	DLC04_KK_ElevatorFromRoofRef.MakeElevatorNonFunctional(false)
EndFunction



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Post Quest
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

RefCollectionAlias Property AllGhouls Auto Const Mandatory
DLC04KiddieKingdomCleanupScript Property DLC04_KiddieKingdomCleanup Auto Const Mandatory

Function SetGhoulsForRemoval()
	int i = 0
	int count = AllGhouls.GetCount()
	While i < Count
		DLC04_KiddieKingdomCleanup.AddForCleanup(AllGhouls.GetAt(i))
		i += 1
	EndWhile

	i = 0
	count = FightGhouls.Length
	While i < Count
		DLC04_KiddieKingdomCleanup.AddForCleanup(FightGhouls[i])
		i += 1
	Endwhile

EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Remote listening for flag raise
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Quest Property DLC04MQ03 Auto Const Mandatory
Function ListenForFlagRaise()
	RegisterForRemoteEvent(DLC04MQ03, "OnStageSet")

EndFunction

Group FlagRaiseProperties
	int Property ExternalFlagRaisedStage = 310 auto const
	int Property ExternalQuestKickoutStage = 1500 auto const

	int Property myFlagRaisedStage = 1500 auto const
	int Property myFlagFailedStage = 1600 auto const
EndGroup

Event Quest.OnStageSet(Quest sendingQuest, int auiStageID, int auiItemID)
	Debug.Trace(self + ": recieved OnStageSet from " + sendingQuest)
	Debug.Trace(self + "::: auiStageID = " + auiStageID)
	Debug.Trace(self + "::: auiItemID = " + auiItemID)
	;Flag Was raised!
	if auiStageID == ExternalFlagRaisedStage
		SetStage(myFlagRaisedStage)
		UnregisterForRemoteEvent(DLC04MQ03, "OnStageSet")
	;Flag raised fail due to raider kick out
	elseif auiStageID == ExternalQuestKickoutStage
		SetStage(myFlagFailedStage)
		UnregisterForRemoteEvent(DLC04MQ03, "OnStageSet")
	Endif
EndEvent



