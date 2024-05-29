Scriptname DLC04:DLC04MQ04QuestScript extends Quest Conditional

ReferenceAlias Property Shank Auto Const Mandatory
{Reference alias for Shank}

WorkshopParentScript Property WorkshopParent Auto Const mandatory

RefCollectionAlias Property Workshops Auto Const Mandatory

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent auto const mandatory 

int Property iPlayerRaidChoice = -1 Auto Conditional
{Players most recent choice for how they want to attack the first settlement. Reset in job selection scene.
1 = Chase off settlement
2 = Wipe out settlement
3 = Coerce settlement
4 = Subdue settlement}

int Property iPlayerGangChoice = -1 Auto Conditional
{Players most recent choice for gang. reset on start of job selection scene.}

bool Property bFoundRaid = false Auto Conditional
{Did the quest successfully start a raid quest?
Currently set false on starting job selection scene}

bool Property bSearchingForRaid = false Auto Conditional
{Are we currently searching for a Raid?
Currently set false on starting job selection scene}

bool Property bChosenRaidAvailable = false Auto Conditional
{If the player chooses a raid for which there are no targets, mark this var and let the player know}

Keyword Property DLC04RaidInitKeyword Auto Const Mandatory
{Raid init keyword}

bool Property bPlayerChoseLocation = false Auto Conditional
{Did the player choose a location? Reset when player enters location selection phase of job selection scene}

bool Property bPlayerChoseOwnedLocation = false Auto Conditional
{Did the player choose a location they own? Used to provide an extra confirmation for the player}

bool Property bRaiderQuestActive = false Auto Conditional
{Is one of the first Raider quests active? Used to manage where Objective 10 and 110 point}

bool Property bRaidTargetsAvailable = true Auto Conditional
{Are there any Raid targets available for the player's current selection?}

bool Property bAllowVassalScene = true Auto Conditional
{Should we bypass the vassal section of MQ04 (if the player has no vassal available to them)?}

bool Property bShankQuestionRaidTargetsAvailable = true Auto Conditional
{Are there any Raid targets available for the player's current selection? This var is used specifically for Shank's question hub}

bool Property bSettlementsStillAvailableToTarget = false Auto Conditional
{Bool to check if there are any places left for the player that aren't Raider outposts}

bool Property bNoTargetsAvailableMessageDisplaying = false Auto Conditional
{Var used to prevent multiple instances of the "No targets available message" showing at once}

bool Property bBuildBeaconMessageDisplaying = false Auto Conditional
{Var used to prevent multiple instances of the "Build Radio Beacons" showing at once}

bool Property bChaseOffAvailableForInitialRaid = true Auto Conditional
{Bool to check if there's any places available that wil support the Chase off raid for the player's firs left for the player that aren't Raider outposts}

int Property iInitialRaidIndex = 0 Auto Conditional
{int to track which of the raids the player did (used for dialogue variations)}

int Property iSecondRaidIndex = 0 Auto Conditional
{int to track which of the raids the player did (used for dialogue variations)}
	
Message Property DLC04RaidTargetSettlementMessage Auto Const Mandatory
{Message to show when making a target selection}

Formlist Property DLC04RaidExcludedSettlementKeywords Auto Const Mandatory
{List of keyword types to exclude from list}

bool Property bShankHasWorkshopTarget Auto Conditional
{Bool to know if Shank is being sent to a workshop target}

bool Property bPlayerHasSingleVassalAvailable = false Auto Conditional
{Bool used to mark if player only has a single vassal target available}

Message Property DLC04TutorialNoTargetsAvailable_ChaseOff_IntialBatch01 Auto Const Mandatory
{Message to display when there are no settlements with population available for Chase off quest, 1/2}

Message Property DLC04TutorialNoTargetsAvailable_ChaseOff_IntialBatch02 Auto Const Mandatory
{Message to display when there are no settlements with population available for Chase off quest, 1/2}

Message Property DLC04TutorialNoTargetsAvailable_ChaseOff_PostIntialBatch Auto Const Mandatory
{Message to display when there are no settlements with population available for Chase off quest, post-intial batch}

Message Property DLC04RaidNoTargetsAvailable_WipeOut Auto Const
{Message to display when there are no settlements left to target}

Keyword Property WorkshopType02AlwaysExclude Auto Const Mandatory
{Always exclude from Raids property}

Keyword Property ObjectTypeFood Auto Const Mandatory
Keyword Property ObjectTypeWater Auto Const Mandatory

GlobalVariable Property DLC04RaidVassalDistance Auto Const Mandatory
{Vassal distance global}

int Property iShankAnimFailsafeTimerLength = 10 Auto Const
{Length of failsafe timer to pull Shank out of his flavor anim}

int Property iNoTargetsCooldownTimerLength = 40 Auto Const
{Length of cooldown timer before the "No targets available" tutorial will show again}

int Property iBuildBeaconsCooldownTimerLength = 30 Auto Const
{Length of cooldown timer before the "Build Radio Beacons" tutorial will show again}

Keyword Property AnimFlavorReadingBook Auto Const Mandatory
{Anim flavor for Shank reading his notebook}

Formlist Property DLC04SubdueRaidExcludedSettlementKeywords Auto Const Mandatory
{List of Subude excluded raid keywords}

Formlist Property DLC04CoerceRaidExcludedSettlementKeywords Auto Const Mandatory
{List of Coerce excluded raid keywords}

Quest Property DLC04MQ04TutorialQuest Auto Const Mandatory
{Tutorial quest}

Quest Property DLC04MQ04 Auto Const Mandatory
{DLC04MQ04 quest}

GlobalVariable Property DLC04RaidBuildBeaconsTutorialThreshold Auto Const Mandatory
{How many targets its okay for the player to have before we show the tutorial}

Message Property DLC04TutorialBuildRadioBeacons01 Auto Const Mandatory
{Message for Radio Beacon tutorial - 1 of 3}

Message Property DLC04TutorialBuildRadioBeacons02 Auto Const Mandatory
{Message for Radio Beacon tutorial - 2 of 3}

Message Property DLC04TutorialBuildRadioBeacons03 Auto Const Mandatory
{Message for Radio Beacon tutorial - 3 of 3}

Message Property DLC04TutorialBuildRadioBeaconsVassal01 Auto Const Mandatory
{Message for Radio Beacon tutorial, vassal edition - 1 of 2}

Message Property DLC04TutorialBuildRadioBeaconsVassal02 Auto Const Mandatory
{Message for Radio Beacon tutorial, vassal edition - 2 of 2}

Message Property DLC04TutorialNoTargetsAvailable_Vassal_PreFirstVassal Auto Const Mandatory
{Message informing player to build radio beacons near outposts before they've claimed their first vassal}

Message Property DLC04TutorialNoTargetsAvailable_Vassal_PreFirstVassal02 Auto Const Mandatory
{Message informing player to build radio beacons near outposts before they've claimed their first vassal}

Message Property DLC04TutorialNoTargetsAvailable_Vassal_PostFirstVassal Auto Const Mandatory
{Message informing player to build radio beacons near outposts after they've claimed their first vassal}

Message Property DLC04TutorialNoTargetsAvailable_Vassal_PostMQ04_01 Auto Const Mandatory
{Message informing player to build radio beacons near outposts after they've finished MQ04, 1/2}

Message Property DLC04TutorialNoTargetsAvailable_Vassal_PostMQ04_02 Auto Const Mandatory
{Message informing player to build radio beacons near outposts after they've finished MQ04, 2/2}

GlobalVariable Property DLC04RaidChaseOffBuildBeaconsTutorialOnce Auto Const Mandatory
{Global to ensure the Chase Off low beacons tutorial only fires once}

GlobalVariable Property DLC04RaidVassalBuildBeaconsTutorialOnce Auto Const Mandatory
{Global to ensure the Vassal low beacons tutorial only fires once}

Message Property DLC04TutorialBuildRadioBeaconsPostIntial01 Auto Const Mandatory
{Message informing player to build more beacons after they've claimed the initial one, 1/2}

Message Property DLC04TutorialBuildRadioBeaconsPostIntial02 Auto Const Mandatory
{Message informing player to build more beacons after they've claimed the initial one, 2/2}

Struct ShankAnimData
	Quest OwningQuest
	Scene AnimScene
EndStruct

ShankAnimData[] Property ShankAnimScenes Auto Const Mandatory
{Array of Anim data scructs to check to see if we should call Shank's anim failsafe}

;Local vars
Location myLoc
int iShankAnimFailsafeTimerID = 222 const
int iNoTargetsWipeoutCooldownTimerID = 221 const
int iBuildBeaconsCooldownTimerID = 220 const
int iNoTargetsChaseOffCooldownTimerID = 219 const
int iNoTargetsVassalsCooldownTimerID = 218 const
bool bNoTargetsWipeOutMessageBlocked = false
bool bNoTargetsChaseOffMessageBlocked = false
bool bNoTargetsVassalMessageBlocked = false

group happinessObjectives
	WorkshopParentScript:WorkshopObjective[] Property WorkshopObjectives const auto
	{ array of objective data }

	int property SettlementsToTrackCurrent = 1 auto 
	{ how many settlements to track - switch to 3 later in the quest }

	int property SettlementsToTrackTotal = 3 auto const 
	{ set SettlementsToTrack to this once first objective is complete }

	int property AllCompleteStage = 500 auto const 

	ActorValue property WorkshopRatingHappinessTarget auto const mandatory

	GlobalVariable Property DLC04MQ04Settlement01Count Auto Const
	GlobalVariable Property DLC04MQ04Settlement01Total Auto Const
	GlobalVariable Property DLC04MQ04Settlement01Percent Auto Const

	GlobalVariable Property DLC04MQ04Settlement02Count Auto Const
	GlobalVariable Property DLC04MQ04Settlement02Total Auto Const
	GlobalVariable Property DLC04MQ04Settlement02Percent Auto Const

	GlobalVariable Property DLC04MQ04Settlement03Count Auto Const
	GlobalVariable Property DLC04MQ04Settlement03Total Auto Const
	GlobalVariable Property DLC04MQ04Settlement03Percent Auto Const

	ReferenceAlias[] Property RaiderSettlementAliases auto const 
	{ array of aliases for quest targets for the happiness objectives }
endGroup

bool bAllHappinessObjectivesComplete = false Conditional
int iHappinessObjectiveUpdateTimerID = 1 const
float fHappinessObjectiveUpdateTimerSeconds = 2.0 const 
bool bHappinessObjectiveUpdateTimer		 ; true while timer is running
bool bNukaWorldRemoved = false 

Function FindWorkshopsWithSetting()
	;Print out all the spots that have the chosen workshop setting
	int i = 0
	int iCount = WorkshopParent.Workshops.Length

	while i < iCount
		WorkshopScript myShop = WorkshopParent.Workshops[i]

		if !myShop.EnableAutomaticPlayerOwnership 
			debug.trace("DLC04MQ04: Location doesn't allow Auto Player Ownership: " + myShop)
		endif
		i += 1
	endwhile
EndFunction

WorkshopScript Function FindWorkshopsInVassalDistance()

	int i = 0
	int iCount = Workshops.GetCount()
	WorkshopScript raiderWorkshop = NONE
	while i < iCount
		int j = 0
		int jCount = Workshops.GetCount()
		int iSpecificTargets = 0
		float fVassalDistance = DLC04RaidVassalDistance.GetValue()
		ObjectReference obj = Workshops.GetAt(i)
		;if obj.HasKeyword(WorkshopParent.WorkshopType02)
			raiderWorkshop = obj as WorkshopScript
			debug.trace("FindWorkshopsInVassalDistance: ("+ i +"): Checking raider outpost for possible vassal locations: " + obj)
														;Keyword akActionKW, 	Message astrConfirm = None, 	Location aLocToHighlight = None, FormList akIncludeKeywordList = None, FormList akExcludeKeywordList = None, bool abExcludeZeroPopulation = false, bool abOnlyOwnedWorkshops = true, bool abTurnOffHeader = false, bool abOnlyPotentialVassalSettlements = false, bool abDisableReservedByQuests = false
			iSpecificTargets = obj.RaidTargetsAvailable(DLC04RaidInitKeyword, DLC04RaidTargetSettlementMessage, 			none, 							none, 						DLC04RaidExcludedSettlementKeywords, 				true, 								false, 						true, 									true, 										true)
			debug.trace("		RaidTargetsAvailable()=" + iSpecificTargets + " vassals available")
			debug.trace("		Check workshops within range manually:")
				iSpecificTargets = 0
				while j < jCount
					ObjectReference obj01 = Workshops.GetAt(j)
					float population = obj01.GetBaseValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingPopulation].resourceValue)
					if obj.GetDistance(obj01) <= fVassalDistance && obj != obj01 && population > 0 && !obj01.HasKeyword(WorkshopType02AlwaysExclude)
						debug.trace("			Workshop" + obj01 + " (" + j + ") has population and is within vassal distance.")
						iSpecificTargets += 1
					else
						;debug.trace("DLC04MQ04: Workshop" + obj01 + " NOT within vassal distance of " + obj)
					endif 

					j += 1
				endwhile
			debug.trace("		Manual vassal count for " + obj + "=" + iSpecificTargets)
		;endif
		i += 1
	endwhile

	return raiderWorkshop
EndFunction

Function SelectRaidLocation(bool bRequiresPop = false, bool bPotentialVassalsOnly = false, Formlist aiExcludedSettlements = none, Formlist aiIncludedSettlements = none)
	;Use this function to have the player select the location they want to target with the current raid
	debug.trace(self + " SelectRaidLocation: aiExcludedSettlements=" + aiExcludedSettlements + ", aiIncludedSettlements=" + aiIncludedSettlements + ", bRequiresPop=" + bRequiresPop + ", bPotentialVassalsOnly=" + bPotentialVassalsOnly)
	;Reset vars
	bPlayerChoseLocation = false
	bPlayerChoseOwnedLocation = false
	bRaidTargetsAvailable = true
	myLoc = none
	int iSpecificTargets = 0
	ObjectReference PlayerRef = Game.GetPlayer()


	;Check to ensure there will be raid targets available 
	bRaidTargetsAvailable = CheckRaidLocation(bRequiresPop, bPotentialVassalsOnly, aiExcludedSettlements, aiIncludedSettlements)

	;Check to see how many targets the player has available
	iSpecificTargets = PlayerRef.RaidTargetsAvailable(DLC04RaidInitKeyword, DLC04RaidTargetSettlementMessage, 		none,						aiIncludedSettlements,				aiExcludedSettlements, 					bRequiresPop, 							false, 								true, 							bPotentialVassalsOnly, 						true)
	debug.trace(self + "DLC04 Raid Init: Checking specific number of targets available: " + iSpecificTargets)

	;If there are Raid targets available, start turning off the Minutemen quests
	if bRaidTargetsAvailable
		Utility.Wait(0.5)
		;Stop Minutemen quests running
		;DLC04WorkshopParent.StopInactiveMinutemenQuests()
	endif

	;If the player has # of targets below a certain threshold, throw a tutorial informing them how to get more
	if iSpecificTargets > 0 && iSpecificTargets <= DLC04RaidBuildBeaconsTutorialThreshold.GetValue()
		;Only show this after the player's claimed their first vassal so it's not running over the
		;other tutorials
		if DLC04MQ04TutorialQuest.GetStageDone(50)
			ShowLowTargetsTutorial(iPlayerRaidChoice)
		endif
	endif

	;Only show the menu if there's something the player can target
	if bRaidTargetsAvailable
		if !DLC04MQ04TutorialQuest.GetStageDone(50)
  			DLC04MQ04TutorialQuest.SetStage(50)
		endif

		;Location Function OpenWorkshopSettlementMenuEx(Keyword akActionKW, 		Message astrConfirm = None, Location aLocToHighlight = None, FormList akIncludeKeywordList = None, FormList akExcludeKeywordList = None, bool abExcludeZeroPopulation = false, bool abOnlyOwnedWorkshops = true, bool abTurnOffHeader = false, bool abOnlyPotentialVassalSettlements = false, bool abDisableReservedByQuests = false)
		myLoc = PlayerRef.OpenWorkshopSettlementMenuEx(DLC04RaidInitKeyword, DLC04RaidTargetSettlementMessage, 		none,						aiIncludedSettlements,				aiExcludedSettlements, 					bRequiresPop, 							false, 								true, 							bPotentialVassalsOnly, 						true)
		debug.trace("MQ04 Raid Init. Loc: " + myLoc)

	else
		bRaidTargetsAvailable = false
	endif

	;If a location has been chosen, mark the appropriate bool
	if myLoc == none
		bPlayerChoseLocation = false
	else
		bPlayerChoseLocation = true 
	endif
EndFunction

bool Function CheckRaidLocation(bool bRequiresPop = false, bool bPotentialVassalsOnly = false, Formlist aiExcludedSettlements = none, Formlist aiIncludedSettlements = none)
	;Use this function to have the player select the location they want to target with the current raid
	debug.trace(self + " SelectRaidLocation: aiExcludedSettlements=" + aiExcludedSettlements + ", aiIncludedSettlements=" + aiIncludedSettlements + ", bRequiresPop=" + bRequiresPop + ", bPotentialVassalsOnly=" + bPotentialVassalsOnly)
	;Reset vars
	int iTargetsAvailable = 0
	ObjectReference PlayerRef = Game.GetPlayer()

	;Check to ensure there will be raid targets available 
														;Keyword akActionKW, 	Message astrConfirm = None, Location aLocToHighlight = None, FormList akIncludeKeywordList = None, FormList akExcludeKeywordList = None, bool abExcludeZeroPopulation = false, bool abOnlyOwnedWorkshops = true, bool abTurnOffHeader = false, bool abOnlyPotentialVassalSettlements = false, bool abDisableReservedByQuests = false
	iTargetsAvailable = PlayerRef.RaidTargetsAvailable(DLC04RaidInitKeyword, DLC04RaidTargetSettlementMessage, 		none,						aiIncludedSettlements,				aiExcludedSettlements, 					bRequiresPop, 							false, 								true, 							bPotentialVassalsOnly, 						true)
	debug.trace("MQ04 Check Raid Location. Raids available: " + iTargetsAvailable)

	;Are there raid targets available? If so, mark the var.
	if iTargetsAvailable > 0
		return true
	else
		return false
	endif

EndFunction

Function TryToStartRaid(Keyword aiKeyword, int iGangIndex)
	debug.trace(self + " TryToStartRaid aiKeyword=" + aiKeyword + " iGangIndex=" + iGangIndex)
	;Reset vars
	bSearchingForRaid = true
	bFoundRaid = false

	;Throw the story event for the current raid target
	if aiKeyword.SendStoryEventandWait(myLoc, none, none, iGangIndex)
		bFoundRaid = true
	endif

	;Set searching var back to false
	bSearchingForRaid = false
EndFunction

Function ToggleMQ04ClaimQuestVar(bool bToggle, bool bReflashObjective = false, int iObjToFlash = 0)

	;Toggle the quest var as needed
	if bToggle 
		if !bRaiderQuestActive
			bRaiderQuestActive = true
		endif
	else 
		if bRaiderQuestActive
			bRaiderQuestActive = false
		endif
	endif

	if bReflashObjective
		SetObjectiveDisplayed(iObjToFlash, true, true)
	endif
EndFunction

Function ShankNotebookAnim()
	;Check to make sure Shank is still in one of his applicable scenes and the player hasn't been kicked from the raiders
	if CheckIfShankInApplicableScene() && !GetStageDone(850)

		Actor ShankAct = Shank.GetActorRef()

		;Get Shank reading his book
		ShankAct.ChangeAnimFlavor(AnimFlavorReadingBook)

		;Eval Shank's package
		ShankAct.EvaluatePackage()

		;Start Shank's failsafe timer
		StartTimer(iShankAnimFailsafeTimerLength, iShankAnimFailsafeTimerID)
	endif
EndFunction

bool Function CheckIfShankInApplicableScene()
	int i = 0
	int iCount = ShankAnimScenes.Length
	bool bAnimSceneActive = false

	while !bAnimSceneActive && i < iCount
		debug.trace(self + "DLC04 Raid Script: Checking struct: " + ShankAnimScenes[i])
		Quest QuestToTest = ShankAnimScenes[i].OwningQuest

		if QuestToTest.IsRunning() && ShankAnimScenes[i].AnimScene.IsPlaying()
			debug.trace(self + "DLC04 Raid Script: Scene is playing: " + ShankAnimScenes[i].AnimScene)
			bAnimSceneActive = true
		endif
		i += 1
	endWhile

	;Return if one of Shank's anim scenes is still running
	debug.trace(self + "DLC04 Raid Script: Applicable scene playing is: " + bAnimSceneActive)
	return bAnimSceneActive
EndFunction

Function DisplayNoTargetsMessage(int iRaidIndex = 0)

	;Chase Off messages
	if iRaidIndex == 1 && !bNoTargetsChaseOffMessageBlocked
		bNoTargetsChaseOffMessageBlocked = true
		StartTimer(iNoTargetsCooldownTimerLength, iNoTargetsChaseOffCooldownTimerID)

		if !DLC04MQ04.GetStageDone(70)
			DLC04TutorialNoTargetsAvailable_ChaseOff_IntialBatch01.ShowAsHelpMessage("DLC04ChaseOffNoTargetsIntial01", 13, 0, 1, "NoMenu", 79)
			DLC04TutorialNoTargetsAvailable_ChaseOff_IntialBatch02.ShowAsHelpMessage("DLC04ChaseOffNoTargetsIntial02", 11, 0, 1, "NoMenu", 79)
		else
			DLC04TutorialNoTargetsAvailable_ChaseOff_PostIntialBatch.ShowAsHelpMessage("DLC04ChaseOffNoTargetsPostIntial", 13, 0, 1, "NoMenu")
		endif

	;Wipeout Messages
	elseif iRaidIndex == 2 && !bNoTargetsWipeOutMessageBlocked
		if DLC04MQ04.GetStageDone(70)
			bNoTargetsWipeOutMessageBlocked = true
			StartTimer(iNoTargetsCooldownTimerLength, iNoTargetsWipeoutCooldownTimerID)

			DLC04RaidNoTargetsAvailable_WipeOut.ShowAsHelpMessage("DLC04NoTargetsWipeOut", 8, 0, 1, "NoMenu")
		endif

	;Vassal messages
	elseif !bNoTargetsVassalMessageBlocked && iRaidIndex == 3 || iRaidIndex == 4
		bNoTargetsVassalMessageBlocked = true
		StartTimer(iNoTargetsCooldownTimerLength, iNoTargetsVassalsCooldownTimerID)

		if DLC04MQ04.GetStageDone(500)
			DLC04TutorialNoTargetsAvailable_Vassal_PostMQ04_01.ShowAsHelpMessage("DLC04NoTargetsVassalPostMQ04_01", 7, 0, 1, "NoMenu", 80)
			DLC04TutorialNoTargetsAvailable_Vassal_PostMQ04_02.ShowAsHelpMessage("DLC04NoTargetsVassalPostMQ04_02", 13, 0, 1, "NoMenu", 80)
		elseif DLC04MQ04.GetStageDone(150)
			DLC04TutorialNoTargetsAvailable_Vassal_PostFirstVassal.ShowAsHelpMessage("DLC04NoTargetsVassalPostFirst", 13, 0, 1, "NoMenu")
		else
			DLC04TutorialNoTargetsAvailable_Vassal_PreFirstVassal.ShowAsHelpMessage("DLC04NoTargetsVassalPreFirst", 9, 0, 1, "NoMenu")
			DLC04TutorialNoTargetsAvailable_Vassal_PreFirstVassal02.ShowAsHelpMessage("DLC04NoTargetsVassalPreFirst02", 13, 0, 1, "NoMenu")
		endif
	endif
EndFunction

Function ShowLowTargetsTutorial(int iRaidIndex)
	;Function to throw appropriate tutorial message when player is low on settlements to target
	if iRaidIndex == 1
		;Throw tutorial based on how far player has progressed in MQ04
		if DLC04RaidChaseOffBuildBeaconsTutorialOnce.GetValue() == 0
			DLC04RaidChaseOffBuildBeaconsTutorialOnce.Mod(1)
			if !DLC04MQ04.GetStageDone(300)
				DLC04TutorialBuildRadioBeacons01.ShowAsHelpMessage("DLC04Beacon01", 10, 0, 1, "", 77)
				DLC04TutorialBuildRadioBeacons02.ShowAsHelpMessage("DLC04Beacon02", 10, 0, 1, "", 77)
				DLC04TutorialBuildRadioBeacons03.ShowAsHelpMessage("DLC04Beacon03", 14, 0, 1, "", 77)
			else
				DLC04TutorialBuildRadioBeaconsPostIntial01.ShowAsHelpMessage("DLC04BeaconPostIntial01", 12, 0, 1, "", 81)
				DLC04TutorialBuildRadioBeaconsPostIntial02.ShowAsHelpMessage("DLC04BeaconPostInitial02", 12, 0, 1, "", 81)
			endif
		endif
	elseif iRaidIndex == 3 || iRaidIndex == 4
		;Only throw this message is the player has yet to claim their first vassal
		;or has completed MQ04
		if DLC04RaidVassalBuildBeaconsTutorialOnce.GetValue() == 0
			if !DLC04MQ04.GetStageDone(150) || DLC04MQ04.GetStageDone(500)
				DLC04RaidVassalBuildBeaconsTutorialOnce.Mod(1)
				;Throw tutorial
				DLC04TutorialBuildRadioBeaconsVassal01.ShowAsHelpMessage("DLC04BeaconVassal01", 12, 0, 1, "", 78)
				DLC04TutorialBuildRadioBeaconsVassal02.ShowAsHelpMessage("DLC04BeaconVassal02", 12, 0, 1, "", 78)
			endif
		endif
	endif
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == iHappinessObjectiveUpdateTimerID
    	if WorkshopParent.DailyUpdateInProgress
    		debug.trace(self + " OnTimer: daily update in progress - run timer again")
			StartHappinessObjectiveUpdateTimer()
		else
	    	bHappinessObjectiveUpdateTimer = false
	    	UpdateHappiestSettlements()
	    endif
	elseif aiTimerID == iShankAnimFailsafeTimerID
		if CheckIfShankInApplicableScene()
			;If an applicable scene is still running, restart the timer
			StartTimer(iShankAnimFailsafeTimerLength, iShankAnimFailsafeTimerID)
		else
			;Otherwise, remove his flavor anims
			Actor ShankAct = Shank.GetActorRef()
			ShankAct.ChangeAnimFlavor()
			ShankAct.EvaluatePackage()
		endif
	elseif aiTimerID == iNoTargetsWipeoutCooldownTimerID
		;Timer's expired for the No targets cooldown message. Okay to show it again.
		bNoTargetsWipeOutMessageBlocked = false

	elseif aiTimerID == iNoTargetsChaseOffCooldownTimerID
		bNoTargetsChaseOffMessageBlocked = false

	elseif aiTimerID == iNoTargetsVassalsCooldownTimerID
		bNoTargetsVassalMessageBlocked = false

	elseif aiTimerID == iBuildBeaconsCooldownTimerID
		;Cooldown timer complete. All beacon flag again
		bBuildBeaconMessageDisplaying = false

    endif
EndEvent
; ************* Happiness objective functions ***********

; call when happiness objective to initialize current status
function InitializeHappinessObjective()
	debug.trace(self + " InitializeHappinessObjective")

	RegisterForWorkshopEvents()
	UpdateHappiestSettlements(true)
endFunction

function FinishFirstHappinessObjective()
	debug.trace(self + " FinishFirstHappinessObjective")
	; switch to all settlements to track
	SettlementsToTrackCurrent = SettlementsToTrackTotal
	UpdateHappiestSettlements(true)
endFunction

function HandleWorkshopEvent(WorkshopScript workshopRef, float timerSeconds = 0.0)
	if workshopRef.HasKeyword(WorkshopParent.WorkshopType02)
		debug.trace(self + " workshop event received from raider settlement " + workshopRef)

		; run timer to update (so we don't spam the update)
		if bHappinessObjectiveUpdateTimer == false || timerSeconds > 0
			StartHappinessObjectiveUpdateTimer(timerSeconds)
		endif
	endif
endFunction

function StartHappinessObjectiveUpdateTimer(float timerSeconds = 0.0)
	bHappinessObjectiveUpdateTimer = true
	if timerSeconds == 0.0
		timerSeconds = fHappinessObjectiveUpdateTimerSeconds
	endif
	debug.trace(self + " StartHappinessObjectiveUpdateTimer " + timerSeconds)
	StartTimer(timerSeconds, iHappinessObjectiveUpdateTimerID)
endFunction

function RegisterForWorkshopEvents(bool bRegister = true)
	debug.trace(self + " RegisterForWorkshopEvents")
	; register for build events from workshop
	WorkshopParent.RegisterForWorkshopEvents(self, bRegister)

	if bRegister == false 
		; registration is handled in UpdateHappiestSettlements
		WorkshopScript[] raiderWorkshops = DLC04WorkshopParent.RaiderWorkshops
		int i = 0
		while i < raiderWorkshops.Length 
			UnregisterForRemoteEvent(raiderWorkshops[i], "OnWorkshopMode")
			; remove inventory events
			RemoveInventoryEventFilter(ObjectTypeFood)
			RemoveInventoryEventFilter(ObjectTypeWater)
			UnregisterForRemoteEvent(raiderWorkshops[i], "OnItemAdded")

			i += 1
		endWhile
		UnregisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopRaiderSettlementEvent")
		UnregisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopVassalIncomeEvent")
	else
		RegisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopRaiderSettlementEvent")
		RegisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopVassalIncomeEvent")
	endif
endFunction

; returns array of target # of happiest (target happiness) raider workshops
function UpdateHappiestSettlements(bool bInitialize = false)
	WorkshopScript[] raiderWorkshops = DLC04WorkshopParent.RaiderWorkshops

	debug.trace(self + "UpdateHappiestSettlements: BEFORE SORT: raiderWorkshops=" + raiderWorkshops)

	int low = 0
	int high = raiderWorkshops.Length - 1
 
	;quickSort(raiderWorkshops, low, high)

	debug.trace(self + "UpdateHappiestSettlements: AFTER SORT: raiderWorkshops=" + raiderWorkshops)

	; if all objectives are complete, then set completion variable
	bool allComplete = true

	; how many settlements do we care about?
	; count up (sort is high to low)
	int i = 0
	int settlementCount = 0
	while i < WorkshopObjectives.Length
		debug.trace(self + "   i=" + i)
			float currentRating = 0.0
			; in case we have fewer than settlementsToTrack raider settlements
			if i < raiderWorkshops.Length 
				WorkshopScript workshopRef = raiderWorkshops[i]
				if settlementCount < SettlementsToTrackCurrent
					RaiderSettlementAliases[i].ForceRefTo(workshopRef)
					; NOTE: do not increment settlementCount here - we check it again for the objective update below - increment in that block
					;settlementCount += 1

					; make sure registered
					RegisterForRemoteEvent(workshopRef, "OnWorkshopMode")

					; add events for workshop
					AddInventoryEventFilter(ObjectTypeFood)
					AddInventoryEventFilter(ObjectTypeWater)
					RegisterForRemoteEvent(workshopRef, "OnItemAdded")

					; do daily update if not already in progress
					if WorkshopParent.DailyUpdateInProgress == false 
						debug.trace(self + " UpdateHappiestSettlements: " + i + ": " + workshopRef + ": start DailyUpdate")
						workshopRef.DailyUpdate(bRealUpdate = false)
					else 
						debug.trace(self + " UpdateHappiestSettlements: " + i + ": " + workshopRef + ": SKIP DailyUpdate")
					endif

					currentRating = workshopRef.GetValue(WorkshopRatingHappinessTarget)
					debug.trace(self + " UpdateHappiestSettlements: " + i + ": " + workshopRef + ": happiness target = " + currentRating)
				else 
					debug.trace(self + " UpdateHappiestSettlements: " + i + ": " + workshopRef + ": IGNORE FOR NOW - SettlementsToTrackCurrent = " + SettlementsToTrackCurrent)
				endif
			else 
				debug.trace(self + " UpdateHappiestSettlements: " + i + ": NO RAIDER SETTLEMENT: happiness target = " + currentRating)
			endif 

			; only update objectives for settlements we are tracking
			if settlementCount < SettlementsToTrackCurrent
				; now increment settlementCount (for next iteration)
				settlementCount += 1

				WorkshopParentScript:WorkshopObjective theObjective = WorkshopObjectives[i]

				float objectiveCount = theObjective.currentCount.GetValue()
				int diff = Math.Floor(currentRating - objectiveCount)
				debug.trace(self + " UpdateHappiestSettlements: " + i + ": diff=" + diff)

				; don't do anything if already done - no rollback possible on any of the objectives
				if GetStageDone(theObjective.doneStage) == false 
					if diff != 0 || bInitialize || IsObjectiveDisplayed(theObjective.index) == false
						; get % complete - if there's a startingCount, reduce both current and max by that amount
						int percentComplete = (((currentRating  - theObjective.startingCount)/(theObjective.maxCount.GetValue() - theObjective.startingCount)) * 100 ) as int
						percentComplete = math.min(percentComplete, 100) as int
						debug.trace(self + " currentRating=" + currentRating + ", maxCount=" + theObjective.maxCount.GetValue() + ", percentComplete=" + percentComplete)
						theObjective.percentComplete.SetValue(percentComplete)
						UpdateCurrentInstanceGlobal(theObjective.percentComplete)
						if bInitialize && percentComplete == 100 && IsObjectiveCompleted(theObjective.index) == false && IsObjectiveDisplayed(theObjective.index) == false ; make sure to display first objective even if immediately completed
							debug.trace(self + " displaying objective " + theObjective.index + " for the first time since currently not displayed")
							SetObjectiveDisplayed(theObjective.index, true, true)
						endif
						if ModObjectiveGlobal_2(afModValue = diff, aModGlobal = theObjective.currentCount, aiObjectiveID = theObjective.index, afTargetValue = theObjective.maxCount.GetValue(), abAllowRollbackObjective = false)
							setStage(theObjective.doneStage)
						endif
					endif
				endif
				if IsObjectiveCompleted(theObjective.index) == false
					allComplete = false
				endif
			else
				; until we're using all objectives, allComplete can never be true
				allComplete = false
			endif
		i += 1
	endWhile

	bAllHappinessObjectivesComplete = allComplete

	if allComplete 
		RegisterForWorkshopEvents(false)
		SetStage(AllCompleteStage)
	endif

endFunction

;Quest theQuest, WorkshopObjective[] workshopObjectives, WorkshopScript theWorkshop,
Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectBuilt received")
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		HandleWorkshopEvent(workshopRef)
	endif
EndEvent

Event WorkshopParentScript.WorkshopObjectMoved(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectMoved received")
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		HandleWorkshopEvent(workshopRef)
	endif
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectDestroyed received")
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		HandleWorkshopEvent(workshopRef)
	endif
EndEvent

Event WorkshopParentScript.WorkshopObjectRepaired(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectRepaired received")
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		HandleWorkshopEvent(workshopRef)
	endif
EndEvent

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopActorAssignedToWork received")
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		HandleWorkshopEvent(workshopRef)
	endif
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopActorUnassigned received")
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		HandleWorkshopEvent(workshopRef)
	endif
EndEvent

Event WorkshopParentScript.WorkshopObjectDestructionStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectDestructionStageChanged received")
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		HandleWorkshopEvent(workshopRef)
	endif
EndEvent

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopObjectPowerStageChanged received")
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		HandleWorkshopEvent(workshopRef)
	endif
EndEvent

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
EndEvent

Event WorkshopParentScript.WorkshopEnterMenu(WorkshopParentScript akSender, Var[] akArgs)
EndEvent

Event DLC04:DLC04WorkshopParentScript.DLC04WorkshopRaiderSettlementEvent(DLC04:DLC04WorkshopParentScript akSender, Var[] akArgs)
	WorkshopScript workshopRef = akArgs[0] as WorkshopScript
	bool bCreated = akArgs[1] as bool
	int raiderGangValue = akArgs[2] as int
 
	if bCreated
		StartHappinessObjectiveUpdateTimer()
	endif
EndEvent

Event DLC04:DLC04WorkshopParentScript.DLC04WorkshopVassalIncomeEvent(DLC04:DLC04WorkshopParentScript akSender, Var[] akArgs)
;	WorkshopScript workshopRef = akArgs[0] as WorkshopScript
	StartHappinessObjectiveUpdateTimer()
EndEvent

; use native event to get start and exit
Event ObjectReference.OnWorkshopMode(ObjectReference akSource, bool aStart)
	debug.trace(self + " OnWorkshopMode received")
	if aStart == false
		HandleWorkshopEvent(akSource as WorkshopScript, 5.0) ; run longer timer to let daily update finish on WorkshopScript
	endif
endEvent 

Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace(self + " OnItemAdded to " + akSender + ": " + akBaseItem)
	StartHappinessObjectiveUpdateTimer()
EndEvent

; quick sort array HIGH (index 0) to LOW
function quickSort(WorkshopScript[] workshopArray, int low, int high)
		if (workshopArray == NONE || workshopArray.length == 0)
			return
		endif
 
		if (low >= high)
			return
		endif
 
		; pick the pivot
		int middle = low + (high - low) / 2
		WorkshopScript pivot = workshopArray[middle]
 
		; make left < pivot and right > pivot
		int i = low
		int j = high
		while (i <= j)
			while (workshopArray[i].GetValue(WorkshopRatingHappinessTarget) > pivot.GetValue(WorkshopRatingHappinessTarget))
				i += 1
			endWhile
 
			while (workshopArray[j].GetValue(WorkshopRatingHappinessTarget) < pivot.GetValue(WorkshopRatingHappinessTarget))
				j += -1
			endWhile
 
			if (i <= j)
				WorkshopScript temp = workshopArray[i]
				workshopArray[i] = workshopArray[j]
				workshopArray[j] = temp
				i += 1
				j += -1
			endif
		endWhile
 
		; recursively sort two sub parts
		if (low < j)
			quickSort(workshopArray, low, j)
		endif
 
		if (high > i)
			quickSort(workshopArray, i, high)
		endif
	endFunction

; DUPE OF Quest.ModObjectiveGlobal, but with the redisplay call removed if the objective is rolled back (since SetObjectiveCompleted now redisplays the objective on its own)

; thread-safe way to modify a global value
; optional parameters:
; aiObjectiveID = objective ID to redisplay
; afTargetValue = value you're counting up (or down) towards -- if included, function will return TRUE when the global reaches the target value
; abCountingUp = by default, function assumes you're counting up towards the target value; make this false to count DOWN towards target value
; abCompleteObjective = by default, function assumes you're completing the objective once you reach the target value; make this false to FAIL the objective
; abRedisplayObjective = by default, function asssume you want to redisplay the objective every time the global is incremeneted; make this FALSE to only display the objectives on complete or failure
; abAllowRollbackObjective = by default, function assumes you do not want to rollback a completed objective; make this TRUE to reopen an already completed objective if aModGlobal goes below/above target value
bool Function ModObjectiveGlobal_2(float afModValue, GlobalVariable aModGlobal, int aiObjectiveID = -1, float afTargetValue = -1.0, bool abCountingUp = true, bool abCompleteObjective = true, bool abRedisplayObjective = true, bool abAllowRollbackObjective = false)
	aModGlobal.Mod(afModValue)
	UpdateCurrentInstanceGlobal(aModGlobal)
	debug.trace(self + " ModObjectiveGlobal_2: " + aModGlobal + "=" + aModGlobal.value + ", afTargetValue=" + afTargetValue + ", abAllowRollbackObjective=" + abAllowRollbackObjective)
	if aiObjectiveID >= 0
		; display/complete objectives automatically
		if afTargetValue > -1
			if (abCountingUp && aModGlobal.value >= afTargetValue) || (!abCountingUp && aModGlobal.value <= afTargetValue)
				if (abCompleteObjective)
					debug.trace(self + " ModObjectiveGlobal_2: complete objective " + aiObjectiveID)
					; complete objective
					SetObjectiveCompleted(aiObjectiveID)
					return true
				Else
					debug.trace(self + " ModObjectiveGlobal_2: fail objective " + aiObjectiveID)
					; fail objective
					SetObjectiveFailed(aiObjectiveID)
					return true
				Endif
			else
				; rollback objective if completed and that's allowed
				if abAllowRollbackObjective && IsObjectiveCompleted(aiObjectiveID)
					debug.trace(self + " ModObjectiveGlobal_2: rollback objective " + aiObjectiveID)
					SetObjectiveCompleted(aiObjectiveID, false)
				;endif
				else ; NEW
					If (abRedisplayObjective)
						; redisplay objective
						SetObjectiveDisplayed(aiObjectiveID, true, true)
					Else
						SetObjectiveDisplayed(aiObjectiveID, true, false)
					endif
				endif ; NEW
			endif
		elseIf (abRedisplayObjective)
			; no target value, always redisplay objective
			SetObjectiveDisplayed(aiObjectiveID, true, true)
		Else
			SetObjectiveDisplayed(aiObjectiveID, true, false)
		endif
	Else
		;if no objective is given, then we just want to know when the count has been reached
		if (abCountingUp && aModGlobal.value >= afTargetValue) || (!abCountingUp && aModGlobal.value <= afTargetValue)
			return true
		EndIf
	endif
	return false
endFunction

bool Function CheckForSingleAvailableVassalLocation()
	int iSubdueTargetsAvailable = 0
	int iCoerceTargetsAvailable = 0
	ObjectReference PlayerRef = Game.GetPlayer()

	iSubdueTargetsAvailable = PlayerRef.RaidTargetsAvailable(DLC04RaidInitKeyword, DLC04RaidTargetSettlementMessage, none, none, DLC04SubdueRaidExcludedSettlementKeywords, true, false, true, true, true)
	debug.trace(self + "DLC04 Raid Setup: Subdue targets available: " + iSubdueTargetsAvailable)

	iCoerceTargetsAvailable = PlayerRef.RaidTargetsAvailable(DLC04RaidInitKeyword, DLC04RaidTargetSettlementMessage, none, none, DLC04CoerceRaidExcludedSettlementKeywords, true, false, true, true, true)
	debug.trace(self + "DLC04 Raid Setup: Coerce targets available: " + iCoerceTargetsAvailable)

	;If both jobs have only one target available, allow the bypass option to become available
	if iSubdueTargetsAvailable <= 1 && iCoerceTargetsAvailable <= 1
		return true
	else
		return false
	endif
EndFunction

;DEBUG. Used to kill off essential NPCs at workshops to test bypass functionality
Function KillEssentialTarget(Actor ActorToKill)
	ActorToKill.KillEssential()
EndFunction
