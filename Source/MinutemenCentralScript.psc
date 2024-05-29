Scriptname MinutemenCentralScript extends Quest conditional


int Property MinutemenProgress auto conditional
{ this is an enum that tracks the status of the Minutemen globally
 	Note that this can never backtrack (even if the number of settlements drops for some reason)
 	0 = Start
 	1 = Finished Min01
 	2 = Finished first recruitment quest (so +1 settlements for the first time, aside from Sanctuary)
 	3 = Ready to start Min02
 	4 = Completed Min02
 	5 = Completed Min03
 	6 = Recruitment to 75% - ready to trigger MinDefendCastle
 }

bool property RadioStationActive = false auto conditional
{ true when the Castle radio transmitter is "on" - manned, powered up, etc. }

group PrestonFlags
	Bool Property PrestonKnowsPlayerIsPrewar Auto Conditional
	{Player has told Preston about being 200 years old}

	Bool Property PrestonKnowsSonIsMissing Auto Conditional
	{Player has told Preston about missing BABY son}

	bool Property PrestonLastMinuteman = false auto conditional
	{ set to true if Preston tells player he's one of the last Minutemen in Concord }
endGroup

workshopparentscript Property WorkshopParent Auto Const

group RadiantQuests
	int property ActiveRecruitmentQuests auto conditional
	{ number of active - visible to player - recruitment quests 
		managed by Add/CompleteRecruitmentQuest() functions }

	Bool Property PrestonGiveRecruitmentQuest Auto Conditional
	{set to true to turn on Preston's intro greetings AND radio intro to radiant quests
	 }

	Bool Property ReadyToTurnInRecruitmentQuest Auto Conditional
	{set to true when player has a recruitment quest ready to turn in to Preston
	  - this turns off Preston's greeting
	 }

	FormList Property MinutemenRecruitmentQuests Auto Const
	{stores active recruitment quests }

	FormList Property MinutemenRadiantQuestMasterList Auto Const
	{master list of radiant quests }

	Keyword Property MinRecruitmentStart Auto Const
	{ keyword to start recruitment quest }

	Keyword Property MinRadiantStart Auto Const
	{ keyword to start random Minutemen quest }

	GlobalVariable property XPRadiant auto const
	{ quest reward for success }

	LeveledItem property MinRadiantReward auto const mandatory
endGroup

group RecruitmentEnums
	int property MinRecruitment01 = 2 auto const
	int property MinRecruitment02 = 4 auto const
	int property MinRecruitment03 = 8 auto const
endGroup


Faction property CurrentCompanionFaction auto Const

group QuestProperties
	MQ00Script property MQ00 auto Const
	MinDefendCastleAttackScript property MinDefendCastle auto Const
	Quest property MQ302 auto Const
	Quest property MQ207 auto Const

	Quest property Min207 auto Const
	Quest property Min301 auto Const
	Quest property MinDestBoS auto Const

	Quest property Min03 auto const mandatory

	Quest property BoS303 auto const mandatory
	{ don't start Min301 while this is in progress }

	Quest property BoS304 auto const mandatory
	{ don't start Min301 while this is in progress }

	REParentScript Property REParent Auto mandatory
endGroup

QuestStage[] Property ProgressStages Auto
{ array of quest stages to set, indexed by MinutemenProgress }

int randomQuestChance = 25 const	; % chance to start a random quest each time CheckForRandomQuest is called

group MinutemenRadio
	int property MinutemenRadioFrequency = 105 auto 

	int property NextSong = 1 auto conditional
	{ used to condition next song to play }
	int property LastSong = -1 auto conditional
	{ last song played }

	int property SongCount = 11 auto
	{ how many songs are in the playlist - used to randomize }

	FormList Property MinutemenRadioPlaylist auto Const
	{ used to randomize song list }

	FormList Property MinutemenRadioStartList auto Const
	FormList Property MinutemenRadioRandomList auto Const
	{ these are used during randomization process }

	ReferenceAlias Property CastleWorkshop Auto Const

	ReferenceAlias Property CastleRadioTransmitter Auto Const

	Location Property TheCastleLocation Auto Const

	GlobalVariable Property DN133CastleRadioSpeakersAreOn auto const

	Scene Property MinutemenRadioMainLoop Auto Const

	ReferenceAlias Property MinutemenRadioStation Auto Const

	ObjectReference Property MinutemenRadioTransmitterREF Auto Const

	Scene[] Property RadioScenes Auto Const
	{array of song scenes}
endGroup

group GlobalVariables
	globalVariable property MinutemenMaxActiveRecruitmentQuests auto const mandatory
	globalVariable property PlayerInstitute_KickedOut auto Const
	globalVariable property PlayerBOS_KickedOut auto Const
	globalVariable property PlayerRailroad_KickedOut auto Const

	globalVariable property PlayerBOS_Destroyed auto Const

	globalVariable property MQ206TeleporterFaction auto const
	{ see MQ206 for values }

	globalVariable property MQComplete auto const
	{ set to 1 when main quest is complete }

	globalVariable property MQ302Faction auto const mandatory
	{ set to which faction player did MQ302 with - non-zero means MQ302 is started with some faction }
endGroup

ReferenceAlias Property WarwickWorkshop Auto Const

group Keywords
	keyword property CA__CustomEvent_MinSettlementHelp auto const mandatory
	keyword Property CA__CustomEvent_MinSettlementRefuseHelp const auto mandatory
	keyword property CA__CustomEvent_SynthSuspectRelease auto const mandatory
	keyword property CA__CustomEvent_SynthSuspectKillTrue auto const mandatory
	keyword property CA__CustomEvent_SynthSuspectKillFalse auto const mandatory

endGroup

group Factions
	Faction property BrotherhoodofSteelFaction auto const mandatory
	Faction property InstituteFaction auto const mandatory
	Faction property RailroadFaction auto const mandatory
	Faction property MinutemenFaction auto const mandatory
endGroup

function CheckForRandomQuest()
	debug.trace(self + " CheckForRandomQuest: RadioStationActive=" + RadioStationActive + ", IsPlayerRadioOn=" + Game.IsPlayerRadioOn() + ", GetPlayerRadioFrequency=" + Game.GetPlayerRadioFrequency())
	if RadioStationActive && Game.IsPlayerListening(MinutemenRadioFrequency) 
		; player is listening to MM radio - roll for random quest
		debug.trace(self + " 	... send story event" + MinRadiantStart)
		if MinRadiantStart.SendStoryEventAndWait(aiValue1 = 2)
			PrestonGiveRecruitmentQuest = true
		endif
	endif
endFunction

function PickNextSong()
	; if random list is empty, rerandomize
	if MinutemenRadioRandomList.GetSize() == 0
		; clear form lists
		MinutemenRadioRandomList.Revert()
		MinutemenRadioStartList.Revert()

		; put everything from master list into start list
		int i = 0
		while i < MinutemenRadioPlaylist.GetSize()
			MinutemenRadioStartList.AddForm(MinutemenRadioPlaylist.GetAt(i))
			i+=1
		endWhile

		; now randomly "move" songs from start list into random list, until start list is empty
		while MinutemenRadioStartList.GetSize() > 0
			; make sure we don't repeat the last song played as the first song
			NextSong = Utility.RandomInt(1, MinutemenRadioStartList.GetSize()) - 1
			while LastSong == NextSong
				;debug.trace(self + "  ... picked same as LastSong for first song... rerolling")
				NextSong = Utility.RandomInt(1, MinutemenRadioStartList.GetSize()) - 1
			endWhile
			; clear LastSong
			LastSong = -1
			Form nextSongForm = MinutemenRadioStartList.GetAt(NextSong)
			debug.trace(self + "  " + MinutemenRadioPlaylist.Find(nextSongForm) + ": " + nextSongForm)
			MinutemenRadioRandomList.AddForm(nextSongForm)
			MinutemenRadioStartList.RemoveAddedForm(nextSongForm)
		endWhile

	endif

	; find the next song and remove it from the random list
	Form nextSongForm = MinutemenRadioRandomList.GetAt(0)
	MinutemenRadioRandomList.RemoveAddedForm(nextSongForm)
	; what is its index in the master list?
	NextSong = MinutemenRadioPlaylist.Find(nextSongForm) + 1
	LastSong = NextSong
	;debug.trace(self + " PickNextSong: NextSong=" + NextSong)
endFunction

; called prior to starting new recruitment dialogue scene
function TryToStartRecruitmentQuest()
	; send cleanup event
	REParent.SendCustomEvent("RECheckForCleanup")

	; update globals
	WorkshopParent.UpdateMinutemenRecruitmentAvailable()
	; send story event
	if MinRecruitmentStart.SendStoryEventAndWait(aiValue1 = 1) ; 1 = PrestonIntroOn
		PrestonGiveRecruitmentQuest = true
;	else
;		PrestonGiveRecruitmentQuest = false
	endif
	debug.trace(self + " TryToStartRecruitmentQuest: " + PrestonGiveRecruitmentQuest)
endFunction

; call this when a recruitment quest starts
function AddRecruitmentQuest(Quest newQuest)
	debug.trace(self + " AddRecruitmentQuest "+ newQuest)
	if MinutemenRecruitmentQuests.HasForm(newQuest) == false
		MinutemenRecruitmentQuests.AddForm(newQuest)
	endif
	UpdateActiveRecruitmentQuests()
endFunction

; call this when the player completes a recruitment quest
function CompleteRecruitmentQuest(Quest completedQuest)
	UpdateActiveRecruitmentQuests()

	; check recruitment progress
	WorkshopParent.UpdateMinutemenRecruitmentAvailable()

	; waiting for first successful recruitment mission
	if MinutemenProgress == 1
		if WorkshopParent.MinutemenOwnedSettlements.GetValue() >= MinRecruitment01
			setProgress(2)
		endif
	endif

	; waiting to hit x% and start Min02
	if MinutemenProgress == 2
		if WorkshopParent.MinutemenOwnedSettlements.GetValue() >= MinRecruitment02
			setProgress(3)
		endif
	endif

	; waiting to hit "75%" ?
	if MinutemenProgress == 5
		if WorkshopParent.MinutemenOwnedSettlements.GetValue() >= MinRecruitment03
			setProgress(6)
		endif
	endif

	CheckForMQAdvance()
endFunction

; remove any quests that aren't running (failsafe) and update the active count
function UpdateActiveRecruitmentQuests()
	debug.tracestack(self + " UpdateActiveRecruitmentQuests: current count=" + MinutemenRecruitmentQuests.GetSize())
	; failsafe - check if any of these quests are running and if so, add them
	int m = 0
	while m < MinutemenRadiantQuestMasterList.GetSize()
		MinRecruitQuestScript theQuest = MinutemenRadiantQuestMasterList.GetAt(m) as MinRecruitQuestScript
		if theQuest && theQuest.IsRunning() || theQuest.IsStarting()
			MinutemenRecruitmentQuests.AddForm(theQuest)
		endif
		m += 1
	endWhile

	debug.trace(self + " UpdateActiveRecruitmentQuests: after failsafe check: count=" + MinutemenRecruitmentQuests.GetSize())

	int i = MinutemenRecruitmentQuests.GetSize() - 1 ; count down from top so finish loop when removing things from the list
	int inactiveCount = 0 ; how many quests are in the list but not accepted by the player yet?
	int activeCount = 0 ; how many are active?
	int turnInCount = 0 ; how many are ready to turn in?

	while (i >= 0)
		Form theForm = MinutemenRecruitmentQuests.GetAt(i)
		MinRecruitQuestScript theQuest = theForm as MinRecruitQuestScript
		debug.trace(self + "	" + i + ": " + theQuest + ": current stage=" + theQuest.GetStage())
		if theQuest == None || ( theQuest.IsRunning() == false && theQuest.IsStarting() == false ) || ( theQuest.IsStopping() || theQuest.GetStageDone(theQuest.minRecruitStopStage) )
			debug.trace(self + " 	removing " + theQuest + " from list")
			MinutemenRecruitmentQuests.RemoveAddedForm(theForm)
		elseif theQuest && theQuest.GetStageDone(theQuest.activeStage) == false
			debug.trace(self + " 	" + theQuest + " not yet active - increment inactiveCount")
			inactiveCount += 1
		else
			debug.trace(self + " 	" + theQuest + " active - increment activeCount")
			activeCount += 1
			; is quest ready to turn in to Preston?
			if theQuest.PrestonIntroOn && ( theQuest.GetStageDone(theQuest.turnInStage) || theQuest.GetStageDone(theQuest.successStage) || theQuest.GetStageDone(theQuest.failureStage) )
				turnInCount += 1
			endif
		endif

		i -= 1
	endwhile
	
	; update recruitment quest count
	ActiveRecruitmentQuests = activeCount
	ReadyToTurnInRecruitmentQuest = (turnInCount > 0)

	debug.trace(self + " UpdateActiveRecruitmentQuests: final count=" + ActiveRecruitmentQuests)
	if inactiveCount > 0 && activeCount < MinutemenMaxActiveRecruitmentQuests.GetValue()
		debug.trace(self + " UpdateActiveRecruitmentQuests: inactiveCount= " + inactiveCount + ", activeCount=" + activeCount + ": turn ON Preston's intro")
		PrestonGiveRecruitmentQuest = true
	else
		debug.trace(self + " UpdateActiveRecruitmentQuests: inactiveCount= " + inactiveCount + ", activeCount=" + activeCount + ": turn OFF Preston's intro")
		; turn off Preston giving quest - player got them all some other way
		PrestonGiveRecruitmentQuest = false
	endif
endFunction

; call this function with new status
; NOTE: can never go down, so won't do anything if status is already higher than newStatus
function SetProgress(int newLevel)
	debug.trace(self + " SetProgress to level " + newLevel)
	; clear out inactive quests
	UpdateActiveRecruitmentQuests()
	; make sure registered for faction kickout event
	RegisterForCustomEvent(MQ00, "MQFactionKickOut")
	if MinutemenProgress < newLevel
		MinutemenProgress = newLevel
		; set quest stage for all previous levels
		int i = 0
		debug.trace(self + " ProgressStages.length=" + ProgressStages.length)
		while i < ProgressStages.length && i < MinutemenProgress
			debug.trace(self + " i=" + i)
			if !Quest.GetQuestStageDone(ProgressStages[i])
				debug.trace(self + "   setting stage " + ProgressStages[i].stageToSet + " on " + ProgressStages[i].QuestToSet)
				Quest.SetQuestStage(ProgressStages[i])
			endif
			i += 1
		endwhile
		CheckForMQAdvance()
	endif
endFunction

function IncrementAllyCount()
	; count new allied settlements for achievement
	GlobalVariable achievementCount = WorkshopParent.AlliedSettlementAchievementCount
	achievementCount.SetValue(achievementCount.GetValue() + 1)
	int currentCount = achievementCount.GetValueInt()
	debug.trace(self + " IncrementAllyCount: currentCount=" + currentCount)
	if currentCount >= WorkshopParent.AlliedSettlementsForAchievement
		debug.Trace(self + " IncrementAllyCount: ACHIEVEMENT UNLOCKED!!!!")
		Game.AddAchievement(WorkshopParent.AlliedSettlementAchievementID)
	endif
endFunction

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	CheckForMQAdvance()
EndEvent


; checks if time to advance the main quest
; function called by:
; - MQFactionKickOut event
; - SetProgress function
function CheckForMQAdvance()
	debug.trace(self + "CheckForMQAdvance")

	; make kickout factions mutually hostile if player in Minutemen
	if MinutemenProgress > 0
		if PlayerBOS_KickedOut.GetValueInt() > 0
 			MinutemenFaction.SetEnemy(BrotherhoodofSteelFaction)
 		endif

		if PlayerRailroad_KickedOut.GetValueInt() > 0
 			MinutemenFaction.SetEnemy(RailroadFaction)
 		endif

		if PlayerInstitute_KickedOut.GetValueInt() > 0
 			MinutemenFaction.SetEnemy(InstituteFaction)
		endif 			
	endif


	; check if need to start Min301/MinDefendCastle
	; * Kicked out of Institute
	; * MQ207 completed
	if MQComplete.GetValue() == 0 && MQ302Faction.GetValue() == 0
		; don't start either of these until the player has joined the Minutemen
		if MinutemenProgress > 0 && MinDefendCastle.GetStage() == 0 && PlayerInstitute_KickedOut.GetValueInt() > 0 && MQ207.IsCompleted() && (BoS303.IsRunning() == false || BoS303.GetStage() != 30)
			debug.trace(self + "	check to see if we need to start MinDefendCastle")
			; check if need to start MinDefendCastle
			; always required:
			; * Minutemen progress == 5 (75% settlements recruited)
			; * Min207 completed (gave Sturges the holotape)
			; * Min03 completed
			debug.trace(self + "	MinutemenOwnedSettlements=" + WorkshopParent.MinutemenOwnedSettlements.GetValue() + ", MinRecruitment03=" + MinRecruitment03)
			;if BoS304.IsRunning() == false
				; if BoS304 is running, you've hit point of no return in BOS attack on Institute
				if WorkshopParent.MinutemenOwnedSettlements.GetValue() >= MinRecruitment03 && Min207.IsCompleted() && Min03.IsCompleted()
			 		debug.trace(self + "	 starting MinDefendCastle")
			 		MinDefendCastle.ForceCastleAttacker(4) ; Institute
			 		MinDefendCastle.SetStage(15)
				else
					; not enough settlements to trigger MinDefendCastle
			 		debug.trace(self + "	 starting Min301")
					Min301.SetStage(10)
				endif
			;endif
			; make sure Min207 is in right state if player is kicked out of BOS
			if MinutemenProgress >= 1 && PlayerBOS_KickedOut.GetValueInt() > 0 && MQ207.GetStageDone(5)
				if Min207.GetStageDone(10) == false
					; Start Min207 with "other faction" stage
					Min207.SetStage(5)
				endif
			endif
		endif
	endif

	; check if need to start MinDestBoS
	; * kicked out of Brotherhood
	; * MQ302 done
	; * Minutemen progress == 5
	if MQ302.IsCompleted() && PlayerBOS_KickedOut.GetValueInt() > 0 && MinDestBoS.GetStage() == 0 && MinutemenProgress >= 5 && PlayerBOS_Destroyed.GetValueInt() == 0
		MinDestBoS.Start()
	endif
endFunction

; called by MQ302 if started with another faction
function HandleAttackOnInstituteByOtherFaction()
	; need to shut down Min301
	if Min301.IsRunning()
		Min301.Stop()
	endif
	; need to shut down MinDefendCastle
	if MinDefendCastle.IsRunning()
		MinDefendCastle.Stop()
	endif
endFunction

;*********************************************************************
; ************** Radio station functions *****************************
;*********************************************************************

function TurnOnRadioStation()
	RegisterForCustomEvent(WorkshopParent, "WorkshopObjectDestroyed")
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorAssignedToWork")
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorUnassigned")

	RegisterForRemoteEvent(CastleRadioTransmitter.GetRef(), "OnPowerOn")
	RegisterForRemoteEvent(CastleRadioTransmitter.GetRef(), "OnPowerOff")

	; "enable" radio station
	MinutemenRadioTransmitterRef.Enable()
	MinutemenRadioStation.ForceRefTo(MinutemenRadioTransmitterRef)
	
	UpdateRadioStationStatus()
endFunction

function RadioSetStage(Quest questToSet, int stageToSet)
	; make sure radio is on and tuned in before setting stage
	debug.trace(self + "RadioSetStage from " + questToSet + ": IsPlayerListening=" + Game.IsPlayerListening(MinutemenRadioFrequency))
	if RadioStationActive
		Actor player = Game.GetPlayer()
		if Game.IsPlayerListening(MinutemenRadioFrequency) || (DN133CastleRadioSpeakersAreOn.GetValueInt() > 0 && player.GetCurrentLocation() == TheCastleLocation && player.IsInInterior() == false )
			questToSet.SetStage(stageToSet)
		endif
	endif
endFunction

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		Debug.Trace(self + " WorkshopObjectDestroyed event received for workshop " + workshopRef + ": " + newObject)
		if workshopRef == CastleWorkshop.GetRef() && newObject == CastleRadioTransmitter.GetRef()
			UpdateRadioStationStatus()
		endif
	endif
EndEvent

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript

		debug.trace(self + " WorkshopActorAssignedToWork received from " + newObject)

		if workshopRef == CastleWorkshop.GetRef() && newObject == CastleRadioTransmitter.GetRef()
			UpdateRadioStationStatus()
		endif
	endif
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript

		debug.trace(self + " WorkshopActorUnassigned received from " + newObject)

		if workshopRef == CastleWorkshop.GetRef() && newObject == CastleRadioTransmitter.GetRef()
			UpdateRadioStationStatus()
		endif
	endif
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn received from " + akSender)
	UpdateRadioStationStatus()
EndEvent

Event ObjectReference.OnPowerOff(ObjectReference akSender)
	debug.trace(self + " OnPowerOff received from " + akSender)
	UpdateRadioStationStatus()
EndEvent

bool bRadioAlwaysOn = false

function UpdateRadioStationStatus(bool forceActive = false)
	if forceActive
		bRadioAlwaysOn = true
	endif

	debug.trace(self + "UpdateRadioStationStatus START")
	; make sure radio transmitter is operational
	WorkshopObjectScript transmitterWorkObject = CastleRadioTransmitter.GetRef() as WorkshopObjectScript
	bool transmitterCanProduce = false
	; can only check CanProduceForWorkshop when loaded - otherwise, keep current state
	if transmitterWorkObject.Is3DLoaded()
		transmitterCanProduce = transmitterWorkObject.CanProduceForWorkshop()
	else
		transmitterCanProduce = RadioStationActive
	endif

	if  transmitterCanProduce || bRadioAlwaysOn
		debug.trace(self + "	radio station active - make sure playing scenes")
		; turn radio station on
		RadioStationActive = true
		; restart if not currently playing anything
		if RadioSceneIsPlaying() == false
			debug.trace(self + "	no scenes currently playing - restarting main loop")
			if MinDefendCastle.IsRunning() && MinDefendCastle.GetStageDone(150) && MinDefendCastle.GetStageDone(200) == false
				; if MinDefendCastle is in correct state, restart MinDefendCastle radio loop
				(MinDefendCastle as MinDefendCastleAttackScript).StartRadioScene()
			else
				; otherwise, main radio loop
				MinutemenRadioMainLoop.Start()
			endif
		endif
	else
		debug.trace(self + "	radio station inactive - shutting down scenes")
		RadioStationActive = false
		MinutemenRadioMainLoop.Stop()
		StopRadioScenes()
	endif
	debug.trace(self + "UpdateRadioStationStatus DONE")
endFunction

; returns true if any of the Minutemen radio scenes is currently playing
bool function RadioSceneIsPlaying()
	if MinutemenRadioMainLoop.IsPlaying()
			debug.trace(self + " RadioSceneIsPlaying:  MinutemenRadioMainLoop is playing")
		return true
	endif

	int i = 0
	while i < RadioScenes.Length
		if RadioScenes[i].IsPlaying()
			debug.trace(self + " RadioSceneIsPlaying: " + RadioScenes[i] + " is playing")
			return true
		endif
		i+=1
	endWhile
			debug.trace(self + " RadioSceneIsPlaying: no scenes are playing")
	return false
endFunction

; call to stop all scenes in RadioScenes array
function StopRadioScenes()
	int i = 0
	while i < RadioScenes.Length
		debug.trace(self + " stopping " + RadioScenes[i])
		RadioScenes[i].Stop()
		i+=1
	endWhile
	RadioSceneIsPlaying() ; temp
endFunction

