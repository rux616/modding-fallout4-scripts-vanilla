Scriptname DLC04:DLC04_NUK001_CrowdManagerQuestScript extends Quest


GlobalVariable property DLC04EnemyGang Auto Const Mandatory
{Which Gang has betrayed the player? 0=None, 1=Disciples, 3=Pack, 2=Operators}

ObjectReference property DLC04_NUK001_CrowdSpawnMarker Auto Const Mandatory
ObjectReference property DLC04_NUK001_CrowdWarpMarker Auto Const Mandatory

DLC04:DLC04_NUK001_CrowdRefColScript property Gang1 Auto Const Mandatory
ObjectReference[] property Gang1_Entrances Auto Const Mandatory
ObjectReference property Gang1_ViewingSpotStart Auto Const Mandatory
Keyword property DLC04_NUK001_Gang1Keyword Auto Const Mandatory
Faction property Gang1_CrimeFaction Auto Const Mandatory
int property Gang1_Crowd_Size = 10 Auto Const

DLC04:DLC04_NUK001_CrowdRefColScript property Gang2 Auto Const Mandatory
ObjectReference[] property Gang2_Entrances Auto Const Mandatory
ObjectReference property Gang2_ViewingSpotStart Auto Const Mandatory
Keyword property DLC04_NUK001_Gang2Keyword Auto Const Mandatory
Faction property Gang2_CrimeFaction Auto Const Mandatory
int property Gang2_Crowd_Size = 10 Auto Const

DLC04:DLC04_NUK001_CrowdRefColScript property Gang2Dogs Auto Const Mandatory
ObjectReference property Gang2Dogs_ViewingSpotStart Auto Const Mandatory
int property Gang2Dogs_Crowd_Size = 1 Auto Const

DLC04:DLC04_NUK001_CrowdRefColScript property Gang3 Auto Const Mandatory
ObjectReference[] property Gang3_Entrances Auto Const Mandatory
ObjectReference property Gang3_ViewingSpotStart Auto Const Mandatory
Keyword property DLC04_NUK001_Gang3Keyword Auto Const Mandatory
Faction property Gang3_CrimeFaction Auto Const Mandatory
int property Gang3_Crowd_Size = 10 Auto Const

ActorBase property DLC04ColaCarsCrowd_LvlGang_Operator Auto Const Mandatory
ActorBase property DLC04ColaCarsCrowd_LvlGang_Pack Auto Const Mandatory
ActorBase property DLC04ColaCarsCrowd_LvlGang_Pack_Dog Auto Const Mandatory
ActorBase property DLC04ColaCarsCrowd_LvlGang_Disciple Auto Const Mandatory

Actor player
Cell property DLC04ColaCars01 Auto Const Mandatory
Keyword property LinkCustom01 Auto Const Mandatory	;Entry Point
Keyword property LinkCustom02 Auto Const Mandatory	;Viewing Location
Keyword property LinkCustom03 Auto Const Mandatory	;Viewing Location Seat
Keyword property LinkCustom04 Auto Const Mandatory	;Viewing Location Fight Seat
Keyword property DLC04_NUK001_FillerActorKeyword Auto Const Mandatory
ActorValue property DLC04_NUK001_CrowdDisrupted Auto Const Mandatory

CrowdData[] property DLC04CrowdData Auto Const Mandatory
Struct CrowdData
	String Name
	ObjectReference SoundObject
EndStruct


RefCollectionAlias property GangEntryCrowd Auto Const Mandatory
int CrowdEntryTimerID = 1
int CrowdWarpTimerID = 2
int CrowdExitTimerID = 3
int IdleHighTimerID = 4
int PlaySustainedCrowdAnimationTimerID = 5
int CrowdReactionNoiseTimerID = 6
int CrowdReactionMockTimerID = 7
int CrowdReactionAmbientTimerID = 8

bool property TrickleInActive Auto Hidden
int property TrickleInDelay_PlayerInCell = 4 Auto
int property TrickleInDelay_PlayerNotInCell = 8 Auto
int property TrickleInAudioLimit = 20 Auto
int property TrickleInAudioLimitStageToSet = 105 Auto
int property TrickleInLimit = 15 Auto
int property TrickleInLimitStageToSet = 109 Auto

bool property RushInActive Auto Hidden
int property RushInDelay = 1 Auto

bool property WarpInActive Auto Hidden
int property WarpInDelay = 1 Auto
float CrowdIdleLowTimestamp = 0.0


Function DisableAllCrowdNoise()
	int i = 0
	While (i < DLC04CrowdData.Length)
		DLC04CrowdData[i].SoundObject.DisableNoWait()
		i = i + 1
	EndWhile
EndFunction

Function ToggleCrowdIdleNoise(String name, bool shouldEnable)
	if (GetStageDone(400) && shouldEnable)
		;Debug.Trace("Abort ToggleCrowdIdleNoise; " + name)
		return
	EndIf
	;Debug.Trace("Starting ToggleIdleCrowdNoise " + name + ", " + shouldEnable)
	bool idleLowIsEnabled
	int i = DLC04CrowdData.FindStruct("Name", "IdleLow")
	if (i < 0)
		;Debug.Trace("Crowd System: Unable to find sound " + name)
	Else
		idleLowIsEnabled = DLC04CrowdData[i].SoundObject.IsEnabled()
		;Debug.Trace("IdleLowIsEnabled: " + DLC04CrowdData[i].SoundObject + idleLowIsEnabled)
	EndIf

	if (name == "IdleLow")
		if (shouldEnable && !idleLowIsEnabled)
			ToggleCrowdNoise("IdleLow", True)
			CrowdIdleLowTimestamp = Utility.GetCurrentRealTime()
		ElseIf (!shouldEnable)
			ToggleCrowdNoise("IdleLow", False)
		EndIf
	ElseIf (name == "IdleHigh")
		if (shouldEnable && !idleLowIsEnabled)
			;Debug.Trace("Crowd System: Attempted to enable IdleHigh when IdleLow wasn't playing. Ignoring.")
		ElseIf (shouldEnable)
			float difference = (CrowdIdleLowTimestamp + 8) - Utility.GetCurrentRealTime()
			if (difference <= 0)
				;Debug.Trace("Turning IdleHigh On")
				ToggleCrowdNoise("IdleHigh", True)
			Else
				;Debug.Trace("Starting Timer")
				StartTimer(difference, IdleHighTimerID)
			EndIf
		Else
			ToggleCrowdNoise("IdleHigh", False)
		EndIf
	Else
		;Debug.Trace("ToggleCrowdIdleNoise got an unrecognized idle name: " + name)
	EndIf
	;Debug.Trace("Finished ToggleIdleCrowdNoise " + name + ", " + shouldEnable)
EndFunction

String ActiveReactionNoise = "NONE"

Function ToggleCrowdReactionNoise(String name, float duration)
	;Debug.Trace("ToggleCrowdReactionNoise Old=" + ActiveReactionNoise + ", New=" + name)
	if (ActiveReactionNoise != "NONE")
		ToggleCrowdNoise(ActiveReactionNoise, False)
		CancelTimer(CrowdReactionNoiseTimerID)
	EndIf
	if (name != "NONE")
		ActiveReactionNoise = name
		ToggleCrowdNoise(name, True)
		StartTimer(duration, CrowdReactionNoiseTimerID)
	EndIf
EndFunction


Function ToggleCrowdNoise(String name, bool shouldEnable)
	if (GetStageDone(400) && shouldEnable)
		;Debug.Trace("Abort ToggleCrowdIdleNoise; " + name)
		return
	EndIf
	int i = DLC04CrowdData.FindStruct("Name", name)
	if (i < 0)
		;Debug.Trace("Crowd System: Unable to find sound " + name)
	ElseIf (DLC04CrowdData[i].SoundObject == None)
		;Debug.Trace("Crowd System: Sound for " + name + " was NONE; ignoring.")
	ElseIf (shouldEnable)
		DLC04CrowdData[i].SoundObject.Enable()
		;Debug.Trace("Enabled SOUND:" + DLC04CrowdData[i].SoundObject)
	Else ;!shouldEnable
		DLC04CrowdData[i].SoundObject.Disable()
		;Debug.Trace("Disabled SOUND:" + DLC04CrowdData[i].SoundObject)
	EndIf
EndFunction



Function ConstructCrowd()
	player = Game.GetPlayer()
	int traitorGang = DLC04EnemyGang.GetValueInt()

	;Operators (2 by Global, 1 for this quest)
	if (traitorGang == 2)
		DestructCrowdForGang(Gang1)
	Else
		ConstructCrowdForGang(Gang1, DLC04ColaCarsCrowd_LvlGang_Operator, DLC04_NUK001_Gang1Keyword, Gang1_Entrances, Gang1_ViewingSpotStart, Gang1_CrimeFaction, Gang1_Crowd_Size)
	EndIf

	;Pack (3 by Global, 2 for this quest)
	if (traitorGang == 3)
		DestructCrowdForGang(Gang2)
		DestructCrowdForGang(Gang2Dogs)
	Else
		ConstructCrowdForGang(Gang2, DLC04ColaCarsCrowd_LvlGang_Pack, DLC04_NUK001_Gang2Keyword, Gang2_Entrances, Gang2_ViewingSpotStart, Gang2_CrimeFaction, Gang2_Crowd_Size)
		ConstructCrowdForGang(Gang2Dogs, DLC04ColaCarsCrowd_LvlGang_Pack_Dog, DLC04_NUK001_Gang2Keyword, Gang2_Entrances, Gang2Dogs_ViewingSpotStart, Gang2_CrimeFaction, Gang2Dogs_Crowd_Size)
	EndIf

	;Disciples (1 by Global, 3 for this quest)
	if (traitorGang == 1)
		DestructCrowdForGang(Gang3)
	Else
		ConstructCrowdForGang(Gang3, DLC04ColaCarsCrowd_LvlGang_Disciple, DLC04_NUK001_Gang3Keyword, Gang3_Entrances, Gang3_ViewingSpotStart, Gang3_CrimeFaction, Gang3_Crowd_Size)
	EndIf
EndFunction

Function DestructCrowdForGang(RefCollectionAlias Crowd)
	int i = 0
	While (i < Crowd.GetCount())
		Actor current = Crowd.GetAt(i) as Actor
		current.DisableNoWait()
		current.Delete()
		i = i + 1
	EndWhile
	Crowd.RemoveAll()
EndFunction

Function ConstructCrowdForGang(RefCollectionAlias Crowd, ActorBase FillerActorBase, Keyword GangKeyword, ObjectReference[] Entrances, ObjectReference ViewingSpotStart, Faction CrimeFaction, int CrowdSize)
	;Spawn the NPCs that make up the crowd.
	int i = 0
	While (Crowd.GetCount() < CrowdSize)
		Actor current = DLC04_NUK001_CrowdSpawnMarker.PlaceActorAtMe(FillerActorBase, Utility.RandomInt(0, 2))
		current.AddKeyword(DLC04_NUK001_FillerActorKeyword)
		current.AddKeyword(GangKeyword)
		current.SetCrimeFaction(CrimeFaction)
		Crowd.AddRef(current)
	EndWhile

	;Construct an array of the viewing spots for this gang.
	ObjectReference[] ViewingSpots = ViewingSpotStart.GetLinkedRefChain()
	ViewingSpots.Insert(ViewingSpotStart, 0)
	While (ViewingSpots.Length < Crowd.GetCount())
		ViewingSpots.Insert(ViewingSpotStart, 0)
	EndWhile

	;Loop through the collection and set up the actors' linkedrefs.
	; - LinkCustom01, the actor's entrance, is selected randomly from among the gang's Entrances.
	; - LinkCustom02, the actor's viewing location, is the next entry in the chain of markers beginning with gang's ViewingSpotStart.
	; - LinkCustom03, optionally, is furniture associated with the actor's viewing location. If they have one, they sit there before and during the fight.
	; - LinkCustom04, optionally, is furniture associated with the actor's viewing location. If they have one, they sit there during the fight only, in preference to 03.
	i = 0
	While (i < Crowd.GetCount())
		Actor current = Crowd.GetAt(i) as Actor
		if (current != None)
			current.SetLinkedRef(Entrances[Utility.RandomInt(0, Entrances.Length - 1)], LinkCustom01)
			current.SetLinkedRef(ViewingSpots[i], LinkCustom02)
			current.SetLinkedRef(ViewingSpots[i].GetLinkedRef(LinkCustom03), LinkCustom03)
			current.SetLinkedRef(ViewingSpots[i].GetLinkedRef(LinkCustom04), LinkCustom04)
		EndIf
		i = i + 1
	EndWhile

	;Add everyone in this gang's Crowd to the Entry Crowd pool.
	GangEntryCrowd.AddRefCollection(Crowd)
EndFunction


Function EVPCrowd()
	EVPCollection(Gang1)
	EVPCollection(Gang2)
	EVPCollection(Gang2Dogs)
	EVPCollection(Gang3)
EndFunction

Function EVPCollection(RefCollectionAlias col)
	int i = 0
	int count = col.GetCount()
	While (i < count)
		Actor current = col.GetAt(i) as Actor
		if (current != None)
			current.EvaluatePackage()
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function SetCrowdGhosted(bool shouldBeInvulnerable)
	if (GetStageDone(400) && shouldBeInvulnerable)
		;Debug.Trace("Abort SetCrowdGhosted; " + Self)
		return
	EndIf
	SetCollectionGhosted(Gang1, shouldBeInvulnerable)
	SetCollectionGhosted(Gang2, shouldBeInvulnerable)
	SetCollectionGhosted(Gang2Dogs, shouldBeInvulnerable)
	SetCollectionGhosted(Gang3, shouldBeInvulnerable)
EndFunction

Function SetCollectionGhosted(RefCollectionAlias col, bool shouldBeInvulnerable)
	if (GetStageDone(400) && shouldBeInvulnerable)
		;Debug.Trace("Abort SetCollectionGhosted; " + Self)
		return
	EndIf
	int i = 0
	int count = col.GetCount()
	While (i < count)
		Actor current = col.GetAt(i) as Actor
		if ((current != None) && (!shouldBeInvulnerable || (current.GetValue(DLC04_NUK001_CrowdDisrupted) == 0)))
			current.SetGhost(shouldBeInvulnerable)
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function StartTrickleIn()
	if (GetStageDone(400))
		;Debug.Trace("Abort StartTrickleIn; " + Self)
		return
	EndIf
	;Debug.Trace("Crowd starts trickling in.")
	CancelTimer(CrowdEntryTimerID)
	CancelTimer(CrowdWarpTimerID)
	TrickleInActive = True
	RushInActive = False
	WarpInActive = False
	StartTimer(0, CrowdEntryTimerID)
EndFunction

Function StartRushIn()
	if (GetStageDone(400))
		;Debug.Trace("Abort StartRushIn; " + Self)
		return
	EndIf
	;Debug.Trace("Crowd starts rushing in.")
	CancelTimer(CrowdEntryTimerID)
	CancelTimer(CrowdWarpTimerID)
	TrickleInActive = False
	RushInActive = True
	WarpInActive = False
	StartTimer(0, CrowdEntryTimerID)
EndFunction

Function StartWarpIn()
	if (GetStageDone(400))
		;Debug.Trace("Abort StartWarpIn; " + Self)
		return
	EndIf
	;Debug.Trace("Crowd starts warping in.")
	CancelTimer(CrowdEntryTimerID)
	CancelTimer(CrowdWarpTimerID)
	TrickleInActive = False
	RushInActive = False
	WarpInActive = True
	StartTimer(0, CrowdWarpTimerID)
EndFunction

Function StartCrowdExit()
	CancelTimer(CrowdEntryTimerID)
	CancelTimer(CrowdWarpTimerID)
	TrickleInActive = False
	RushInActive = False
	WarpInActive = False
	StartTimer(8, CrowdExitTimerID)
EndFunction



Event OnTimer(int timerID)
	;Debug.Trace("Got a timer event: " + timerID)
	if (timerID == CrowdEntryTimerID)
		;Debug.Trace("Timer fired------------")
		;Debug.Trace(GangEntryCrowd + ", " + TrickleInActive + ", " + (GangEntryCrowd.GetCount() > TrickleInLimit))
		if ((GangEntryCrowd.GetCount() > 0) && \
			(((TrickleInActive && (GangEntryCrowd.GetCount() > TrickleInLimit)) || RushInActive)))
			;Debug.Trace("- Check 1 Passed")
			int i = Utility.RandomInt(0, GangEntryCrowd.GetCount() - 1)
			Actor current = GangEntryCrowd.GetAt(i) as Actor
			if (current != None)
				;Debug.Trace("- Check 2 Passed")
				GangEntryCrowd.RemoveRef(current)
				if (!current.Is3DLoaded())
					current.Disable()
					;Debug.Trace("- Moving " + current + " to entry point " + current.GetLinkedRef(LinkCustom01))
					current.MoveTo(current.GetLinkedRef(LinkCustom01))
				EndIf
				current.EvaluatePackage()
				current.EnableNoWait(True)
			EndIf

			if (GangEntryCrowd.GetCount() < TrickleInAudioLimit)
				;Debug.Trace("Start Trickle-In Audio")
				SetStage(TrickleInAudioLimitStageToSet)
			EndIf

			;Debug.Trace("-Continue?: " + TrickleInActive + ", " + (GangEntryCrowd.GetCount() > TrickleInLimit))
			if (TrickleInActive && (GangEntryCrowd.GetCount() <= TrickleInLimit))
				;Debug.Trace("Timer died.")
				;Let the timer die.
				SetStage(TrickleInLimitStageToSet)
			Else
				if (TrickleInActive)
					if (player.GetParentCell() == DLC04ColaCars01)
						StartTimer(TrickleInDelay_PlayerInCell, CrowdEntryTimerID)
					Else
						StartTimer(TrickleInDelay_PlayerNotInCell, CrowdEntryTimerID)
					EndIf
				ElseIf (RushInActive)
					StartTimer(RushInDelay, CrowdEntryTimerID)
				EndIf
			EndIf
		EndIf
	ElseIf (timerID == CrowdWarpTimerID)
		if (WarpInActive)
			bool anyActorsNotInPosition = WarpCollection(Gang1) || WarpCollection(Gang2) || WarpCollection(Gang2Dogs) ||WarpCollection(Gang3)
			if (anyActorsNotInPosition)
				StartTimer(WarpInDelay, CrowdWarpTimerID)
			Else
				SetStage(121)
			EndIf
		EndIf
	ElseIf (timerID == CrowdExitTimerID)
		ToggleCrowdIdleNoise("IdleLow", False)
	ElseIf (timerID == IdleHighTimerID)
		ToggleCrowdIdleNoise("IdleHigh", True)
	ElseIf (timerID == PlaySustainedCrowdAnimationTimerID)
		PlaySustainedCrowdAnimation(sustainGangID, sustainAnimType, sustainNumToPlay, sustainDelay)
	ElseIf (timerID == CrowdReactionNoiseTimerID)
		CancelCrowdReaction()
	ElseIf (timerID == CrowdReactionMockTimerID)
		;Debug.Trace("Mock Timer: " + ArenaQuest + " " + ArenaEngagedStage + " " + ArenaQuest.GetStageDone(ArenaEngagedStage))
		if (reactionsEnabled && !sustainingAnimation && !ArenaQuest.GetStageDone(ArenaEngagedStage))
			ForceReactionMock()
			StartTimer(15, CrowdReactionMockTimerID)
		EndIf
	ElseIf (timerID == CrowdReactionAmbientTimerID)
		;Debug.Trace("AmbientTimer")
		HandleReaction(None, ReactionType_Ambient, False)
		if (reactionsEnabled)
			StartTimer(2, CrowdReactionAmbientTimerID)
		EndIf
	EndIf
EndEvent

ActorValue property DLC04_NUK001_ActorWarped Auto Const Mandatory

;Returns true if any actors were unable to be warped into position.
bool Function WarpCollection(RefCollectionAlias col)
	if (GetStageDone(400))
		;Debug.Trace("Abort WarpCollection; " + Self)
		return True
	EndIf
	bool anyActorsNotInPosition = False
	int i = 0
	int count = col.GetCount()
	While (i < count)
		Actor currentActor = col.GetAt(i) as Actor
		if ((currentActor != None) && (!currentActor.IsDead()) && (currentActor.GetValue(DLC04_NUK001_ActorWarped) == 0))
			ObjectReference dest02 = currentActor.GetLinkedRef(LinkCustom02) 
			ObjectReference dest03 = currentActor.GetLinkedRef(LinkCustom03) 
			ObjectReference dest04 = currentActor.GetLinkedRef(LinkCustom04) 
			if ((currentActor.GetDistance(dest02) > 128) && ((dest03 == None) || (currentActor.GetDistance(dest03) > 128)) && ((dest04 == None) || (currentActor.GetDistance(dest04) > 128)))
				if (!currentActor.Is3DLoaded())
					currentActor.Disable()
					currentActor.MoveTo(DLC04_NUK001_CrowdWarpMarker)
				EndIf
				if (player.HasDetectionLOS(dest02))
					anyActorsNotInPosition = True
				Else
					currentActor.MoveTo(dest02)
					currentActor.EvaluatePackage()
					currentActor.EnableNoWait()
					currentActor.SetValue(DLC04_NUK001_ActorWarped, 1)
				EndIf
			EndIf
		EndIf
		i = i + 1
	EndWhile
	return anyActorsNotInPosition
EndFunction


Function DeleteFillerActor(Actor fillerActor)
	if (fillerActor != None)
		fillerActor.DisableNoWait(True)
		fillerActor.Delete()
		RefCollectionAlias fillerActorCollection
		if (fillerActor.HasKeyword(DLC04_NUK001_Gang1Keyword))
			Gang1.RemoveRef(fillerActor)
		ElseIf (fillerActor.HasKeyword(DLC04_NUK001_Gang2Keyword))
			if (Gang2.Find(fillerActor) >= 0)
				Gang2.RemoveRef(fillerActor)
			Else
				Gang2Dogs.RemoveRef(fillerActor)
			EndIf
		ElseIf (fillerActor.HasKeyword(DLC04_NUK001_Gang3Keyword))
			Gang3.RemoveRef(fillerActor)
		Else
			;Debug.Trace("Unable to find a gang for " + fillerActor)
			return
		EndIf
		CheckForStop()
	EndIf
EndFunction

Function CheckForStop()
	CleanupCollection(Gang1)
	CleanupCollection(Gang2)
	CleanupCollection(Gang2Dogs)
	CleanupCollection(Gang3)	

	if ((Gang1.GetCount() == 0) && (Gang2.GetCount() == 0) && (Gang2Dogs.GetCount() == 0) && (Gang3.GetCount() == 0))
		Stop()
	EndIf
EndFunction

Function ForceStop()
	CleanupCollection(Gang1, True)
	CleanupCollection(Gang2, True)
	CleanupCollection(Gang2Dogs, True)
	CleanupCollection(Gang3, True)	
	Stop()
EndFunction

Function CleanupCollection(RefCollectionAlias col, bool force=False)
	int i = col.GetCount() - 1
	While (i >= 0)
		Actor current = col.GetAt(i) as Actor
		if (force)
			col.RemoveRef(current)
			current.DisableNoWait()
			current.Delete()
		ElseIf ((current != None) && (current.IsDead() || current.IsDisabled() || !current.Is3DLoaded()))
			col.RemoveRef(current)
		EndIf
		i = i - 1
	EndWhile
EndFunction



Idle property DLC04_Raider_ClapStanding1 Auto Const Mandatory
Idle property DLC04_Raider_FenceWildCheering1 Auto Const Mandatory
Idle property DLC04_Raider_FenceWildCheering2 Auto Const Mandatory
Idle property DLC04_Raider_WildCheering1 Auto Const Mandatory
Idle property DLC04_Raider_WildCheering2 Auto Const Mandatory
Idle property DLC04_Raider_WildCheering3 Auto Const Mandatory
Idle property ActionCustomCheeringSittingA Auto Const Mandatory
Idle property ActionCustomCheeringSittingB Auto Const Mandatory
Idle property ActionCustomCheeringStandingA Auto Const Mandatory
Idle property ActionCustomCheeringStandingB Auto Const Mandatory
Idle property IdleBooingSitting Auto Const Mandatory
Idle property IdleBooingStanding Auto Const Mandatory
Furniture property DLC04FenceWildCheer Auto Const Mandatory


bool sustainingAnimation
int sustainGangID
int sustainAnimType
int sustainNumToPlay
float sustainDelay

Function PlaySustainedCrowdAnimationNoWait(int GangID, int animType, int numToPlay, float delay=0.1)
	sustainGangID = GangID
	sustainAnimType = animType
	sustainNumToPlay = numToPlay
	sustainDelay = delay
	StartTimer(0, PlaySustainedCrowdAnimationTimerID)
EndFunction

Function PlaySustainedCrowdAnimation(int GangID, int animType, int numToPlay, float delay=0.1)
	sustainingAnimation = True
	int failsafe = 0
	While (sustainingAnimation && (failsafe < 100))
		if (GangID == 0)
			if (sustainingAnimation)
				PlayCrowdAnimation(3, animType, numToPlay, delay)
			EndIf
			if (sustainingAnimation)
				PlayCrowdAnimation(2, animType, numToPlay, delay)
			EndIf
			if (sustainingAnimation)
				PlayCrowdAnimation(1, animType, numToPlay, delay)
			EndIf
		Else
			PlayCrowdAnimation(GangID, animType, numToPlay, delay)
		EndIf
		failsafe = failsafe + 1
		;Debug.Trace("CYCLE " + failsafe)
	EndWhile
EndFunction

Function StopSustainedCrowdAnimation()
	sustainingAnimation = False
EndFunction




Function PlayCrowdReactionAnimation(int animType, int numToPlay, float delay=0.0)
	PlayCrowdAnimation(2, animType, numToPlay, delay)
	PlayCrowdAnimation(3, animType, numToPlay, delay)
	PlayCrowdAnimation(1, animType, numToPlay, delay)	
EndFunction

Function PlayCrowdAnimation(int GangID, int animType, int numToPlay, float delay=0.1)
	RefCollectionAlias gang
	if (GangID == 1)
		gang = Gang1
	ElseIf (GangID == 2)
		gang = Gang2
	ElseIf (GangID == 3)
		gang = Gang3
	EndIf

	;Debug.Trace("PlayCrowdAnimation " + GangID + ", " + animType + ", " + numToPlay)
	int startIndex = Utility.RandomInt(0, gang.GetCount())
	int i = startIndex
	int numPlaying = 0
	While ((numPlaying < numToPlay) && (i < gang.GetCount()))
		;Debug.Trace("Index: " + i + "/" + numToPlay)
		if (animType == 1)
			GangCheer(gang.GetAt(i) as Actor, GangID)
		ElseIf (animType == 2)
			GangBoo(gang.GetAt(i) as Actor, GangID)
		EndIf
		numPlaying = numPlaying + 1
		if (delay > 0)
			Utility.Wait(Utility.RandomFloat(0, delay))
		EndIf
		i = i + 1
	EndWhile
	i = 0
	While ((numPlaying < numToPlay) && (i < startIndex))
		;Debug.Trace("Index: " + i + "/" + numToPlay)
		if (animType == 1)
			GangCheer(gang.GetAt(i) as Actor, GangID)
		ElseIf (animType == 2)
			GangBoo(gang.GetAt(i) as Actor, GangID)
		EndIf
		numPlaying = numPlaying + 1
		if (delay > 0)
			Utility.Wait(Utility.RandomFloat(0, delay))
		EndIf
		i = i + 1
	EndWhile
EndFunction

Function GangCheer(Actor a, int GangID)
	if ((a != None) && (!a.IsDead()))
		if (GangID == 1) ;Operators
			if (a.GetSitState() == 0)
				;Debug.Trace("Operator A")
				a.PlayIdle(DLC04_Raider_ClapStanding1)
				return
			EndIf
		ElseIf (GangID == 2) ;Pack
			if (a.GetSitState() == 0)
				;Debug.Trace("Pack A")
				int i = Utility.RandomInt(1, 3)
				if (i == 1)
					a.PlayIdle(DLC04_Raider_WildCheering1)
				ElseIf (i == 2)
					a.PlayIdle(DLC04_Raider_WildCheering2)
				Else
					a.PlayIdle(DLC04_Raider_WildCheering3)
				EndIf
				return
			ElseIf (a.GetSitState() == 3)
				;Debug.Trace("Pack B")
				ObjectReference aL = a.GetLinkedRef(LinkCustom04)
				if (aL != None)
					Furniture aF = aL.GetBaseObject() as Furniture
					if (aF == DLC04FenceWildCheer)
						;Debug.Trace("Pack C")
						int i = Utility.RandomInt(1, 2)
						if (i == 1)
							a.PlayIdle(DLC04_Raider_FenceWildCheering1)
						Else
							a.PlayIdle(DLC04_Raider_FenceWildCheering2)
						EndIf
						return
					EndIf
				EndIf
			EndIf
		;GangID == 3, the Disciples, just use the base cheers.
		EndIf
		if (a.GetSitState() == 0)
			;Debug.Trace("AA")
			int i = Utility.RandomInt(1, 2)
						if (i == 1)
							a.PlayIdle(ActionCustomCheeringStandingA)
						Else
							a.PlayIdle(ActionCustomCheeringStandingB)
						EndIf
		ElseIf (a.GetSitState() == 3)
			;Debug.Trace("BB")
			int i = Utility.RandomInt(1, 2)
						if (i == 1)
							a.PlayIdle(ActionCustomCheeringSittingA)
						Else
							a.PlayIdle(ActionCustomCheeringSittingB)
						EndIf
		EndIf
	EndIf
EndFunction


Function GangBoo(Actor a, int GangID)
	if (a.GetSitState() == 0)
		;Debug.Trace("A")
		a.PlayIdle(IdleBooingStanding)
	Else
		;Debug.Trace("B")
		ObjectReference aL = a.GetLinkedRef(LinkCustom04)
		if (aL != None)
			Furniture aF = aL.GetBaseObject() as Furniture
			if (aF == DLC04FenceWildCheer)
				return
			EndIf
		EndIf
		a.PlayIdle(IdleBooingSitting)		
	EndIf
EndFunction




float ReactionTimestamp_Any
float ReactionTimestamp_SmallHit
float ReactionTimestamp_BigHit
float ReactionTimestamp_SmallShock
float ReactionTimestamp_BigShock
float ReactionTimestamp_Mock
float ReactionTimestamp_Triumph
float ReactionTimestamp_SmallHitConsecutive

int ReactionType_SmallHit = 1 Const
int ReactionType_BigHit = 2 Const
int ReactionType_SmallShock = 3 Const
int ReactionType_BigShock = 4 Const
int ReactionType_Mock = 5 Const
int ReactionType_Triumph = 6 Const
int ReactionType_Ambient = 0 Const

int ReactionDelay_Any = 4 Const
int ReactionDelay_SmallHit = 12 Const
int ReactionDelay_BigHit = 6 Const
int ReactionDelay_SmallShock = 4 Const
int ReactionDelay_BigShock = 6 Const
int ReactionDelay_Ambient = 0 Const
int ReactionDelay_SmallHitConsecutive = 3 Const

bool reactionsEnabled

float BigHitHealthPercentLossThreshold = 15.0 Const


ReferenceAlias property ArenaChampion Auto
Actor property Champion Auto
float property ChampionMaxHealth Auto
float property ChampionHealth Auto

Actor property Challenger Auto
float property ChallengerMaxHealth Auto
float property ChallengerHealth Auto

Quest ArenaQuest
int ArenaEngagedStage



Function EnableCrowdReactions(Actor myChampion, Actor myChallenger, Quest myArenaQuest, int myArenaEngagedStage)
	reactionsEnabled = True

	if (myChampion != None)
		Champion = myChampion
		ArenaChampion.ForceRefTo(Champion)
		ChampionMaxHealth = Champion.GetBaseValue(Health)
		RegisterForHitEvent(Champion)
		RegisterForRemoteEvent(Champion, "OnCripple")
		if (myChampion == Game.GetPlayer())
			RegisterForRemoteEvent(Champion, "OnDying")
		EndIf
	EndIf
	if (myChallenger != None)
		Challenger = myChallenger
		ChallengerMaxHealth = Challenger.GetBaseValue(Health)
		RegisterForHitEvent(Challenger)
		RegisterForRemoteEvent(Challenger, "OnCripple")
		RegisterForRemoteEvent(Challenger, "OnDying")
	EndIf

	ArenaQuest = myArenaQuest
	ArenaEngagedStage = myArenaEngagedStage
	RegisterForRemoteEvent(ArenaQuest, "OnStageSet")
	StartTimer(18, CrowdReactionMockTimerID)

	StartTimer(2, CrowdReactionAmbientTimerID)

	GoToState("Reacting")
EndFunction

Function DisableCrowdReactions()
	reactionsEnabled = False
	sustainingAnimation = False
	UnregisterForAllEvents()
EndFunction

Function CancelCrowdReaction()
	ToggleCrowdReactionNoise("NONE", 0)
	sustainingAnimation = False
EndFunction


ActorValue property Health Auto Const Mandatory

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	;Debug.Trace("Got Hit Event")
	if (reactionsEnabled)
		if ((akSource as Spell) != None)
			;Debug.Trace("DISCARD Hit: " + akSource)
			RegisterForHitEvent(akTarget)
		Else
			;Debug.Trace("HIT EVENT DATA: " + akTarget +","+ akAggressor +","+ akSource +","+ akProjectile)

			;Was this a big hit-- one that took off BigHitHealthPercentLossThreshold% or more of the target's health?
			float TargetNewHealth = akTarget.GetValue(Health)
			float TargetOldHealth
			float TargetMaxHealth
			if (akTarget == Champion)
				TargetOldHealth = ChampionHealth
				TargetMaxHealth = ChampionMaxHealth
				ChampionHealth = TargetNewHealth
			Else
				TargetOldHealth = ChallengerHealth
				TargetMaxHealth = ChallengerMaxHealth
				ChallengerHealth = TargetNewHealth
			EndIf
			if ((((TargetOldHealth / TargetMaxHealth) - (TargetNewHealth / TargetMaxHealth)) * 100) >= BigHitHealthPercentLossThreshold)
				HandleReaction(akTarget as Actor, ReactionType_BigHit, False)
				return
			EndIf

			;Otherwise, it's just a small hit.
			HandleReaction(akTarget as Actor, ReactionType_SmallHit, False)

			;Reregister for the next hit event.
			RegisterForHitEvent(akTarget)
		EndIf
	EndIf    
EndEvent

Event Quest.OnStageSet(Quest source, int auiStageID, int auiItemID)
	if ((source == ArenaQuest) && (auiStageID == ArenaEngagedStage))
		CancelCrowdReaction()
		CancelTimer(CrowdReactionMockTimerID)
	EndIf
EndEvent

Event Actor.OnCripple(Actor source, ActorValue akActorValue, bool abCrippled)
	if (reactionsEnabled)
		HandleReaction(source, ReactionType_BigHit, False)
	EndIf
EndEvent

Event Actor.OnDying(Actor source, Actor akKiller)
	if (reactionsEnabled)
		if (source == Champion)
			ForceReactionLargeShock()
		Else ;source == Challenger
			ForceReactionTriumph()
		EndIf
	EndIf
EndEvent



Function ForceReactionMock()
	HandleReaction(None, ReactionType_Mock, True)
EndFunction

Function ForceReactionSmallShock()
	HandleReaction(None, ReactionType_SmallShock, True)
EndFunction

Function ForceReactionLargeShock()
	HandleReaction(None, ReactionType_BigShock, True)
EndFunction

Function ForceReactionTriumph()
	HandleReaction(None, ReactionType_Triumph, True)
EndFunction






Function HandleReaction(Actor source, int reactionType, bool forced)
	if (reactionsEnabled)
		float currentTime = Utility.GetCurrentRealTime()

		if (reactionType == ReactionType_Ambient)
			if (currentTime > ReactionTimestamp_Any + ReactionDelay_Ambient)
				;Debug.Trace("--Ambient")
				PlayCrowdReactionAnimation(1, 2)
			EndIf

		ElseIf (reactionType == ReactionType_SmallHit)
			;Debug.Trace("--SH: " + (currentTime > ReactionTimestamp_Any + ReactionDelay_Any) + (currentTime > ReactionTimestamp_SmallHit + ReactionDelay_SmallHit) + (currentTime > ReactionTimestamp_SmallHitConsecutive + ReactionDelay_SmallHitConsecutive))
			;Debug.Trace("SH: " + currentTime + "," + (ReactionTimestamp_SmallHitConsecutive + ReactionDelay_SmallHitConsecutive))
			if ((currentTime > ReactionTimestamp_Any + ReactionDelay_Any) && (currentTime > ReactionTimestamp_SmallHit + ReactionDelay_SmallHit) && (currentTime > ReactionTimestamp_SmallHitConsecutive + ReactionDelay_SmallHitConsecutive))
				ReactionTimestamp_Any = currentTime
				ReactionTimestamp_SmallHit = currentTime
				ReactionTimestamp_SmallHitConsecutive = currentTime
				if (source == Challenger)
					;Debug.Trace("--Small Hit - Cheer Small")
					ToggleCrowdReactionNoise("CheerSmall", 3)
					PlayCrowdReactionAnimation(1, 4)
				Else
					;Debug.Trace("--Small Hit - Boo Small")
					ToggleCrowdReactionNoise("BooSmall", 3)
					PlayCrowdReactionAnimation(2, 4)
				EndIf
			Else
				ReactionTimestamp_SmallHitConsecutive = currentTime
			EndIf

		ElseIf (reactionType == ReactionType_BigHit)
			if (currentTime > ReactionTimestamp_BigHit + ReactionDelay_BigHit)
				ReactionTimestamp_Any = currentTime
				ReactionTimestamp_SmallHit = currentTime
				ReactionTimestamp_BigHit = currentTime
				if (source == Challenger)
					;Debug.Trace("--Big Hit - Cheer Med")
					ToggleCrowdReactionNoise("CheerLarge", 5)
					PlayCrowdReactionAnimation(1, 7)
				Else
					;Debug.Trace("--Big Hit - Cheer Med")
					ToggleCrowdReactionNoise("BooLarge", 5)
					PlayCrowdReactionAnimation(2, 7)
				EndIf
			EndIf 

		ElseIf (reactionType == ReactionType_SmallShock)
			ReactionTimestamp_Any = currentTime
			ReactionTimestamp_SmallShock = currentTime
			;Debug.Trace("--Small Shock")
			ToggleCrowdReactionNoise("ShockSmall", 5)
			PlayCrowdReactionAnimation(2, 5)
		ElseIf (reactionType == ReactionType_BigShock)
			ReactionTimestamp_Any = currentTime
			ReactionTimestamp_SmallShock = currentTime
			;Debug.Trace("--Large Shock")
			ToggleCrowdReactionNoise("ShockLarge", 8)
			PlayCrowdReactionAnimation(2, 9, 0.1)
		ElseIf (reactionType == ReactionType_Mock)
			ReactionTimestamp_Any = currentTime
			;Debug.Trace("--Mock")
			ToggleCrowdReactionNoise("Mock", 8)
			PlaySustainedCrowdAnimationNoWait(0, 2, 10, 0.05)
		ElseIf (reactionType == ReactionType_Triumph)
			ReactionTimestamp_Any = currentTime
			;Debug.Trace("--Triumph")
			ToggleCrowdReactionNoise("Triumph", 6)
			PlaySustainedCrowdAnimationNoWait(0, 1, 10, 0.05)
		EndIf
	EndIf
EndFunction

