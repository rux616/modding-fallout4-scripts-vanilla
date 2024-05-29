Scriptname Min03Script extends WorkshopEventsQuestScript Conditional

MinutemenCentralScript property MinutemenCentralQuest auto const

bool initialized = false
WorkshopEventsQuestScript myWorkshopEvents

int QuestStartTimerID = 1
float QuestStartHours = 70.0 ; start quest 70 hours after Min02 completes

int RadioObjectiveTimerID = 2
float RadioObjectiveIntervalSeconds = 1.0

; called once by startup stage
function InitializeQuest()
	if initialized
		return
	endif
	myWorkshopEvents = (self as Quest) as WorkshopEventsQuestScript

	; start timer for Ronnie to show up
	StartTimerGameTime(QuestStartHours, QuestStartTimerID)

	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopMode")
	RegisterForRemoteEvent(Alias_Workshop.GetRef(), "OnWorkshopObjectDestroyed")

	initialized = true
endFunction

function StartRadioObjectiveTimer()
	; start timer for radio objective
	StartTimer(RadioObjectiveIntervalSeconds, RadioObjectiveTimerID)
endFunction

; called when Ronnie enters armory to check how much cleared out it is
function CheckArmoryState()
	debug.trace(self + " CheckArmoryState " + ArmoryObjects.GetCount())
	int i = 0
	while i < ArmoryObjects.GetCount()
		ObjectReference theObject = ArmoryObjects.GetAt(i)
		; if not in anyone's inventory, assume still in armory
		if theObject.GetContainer() == None
			RonnieArmoryObjectsRemain += 1 ; increment count
		endif
		i += 1
	endwhile
	debug.trace(self + " CheckArmoryState: items left = " + RonnieArmoryObjectsRemain)
endFunction


Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == QuestStartTimerID
		if Game.GetPlayer().IsInLocation(TheCastleLocation)
			debug.trace(self + " enable timer expired - player still at Castle - run another timer")
			; if player is at the Castle, run another timer
			StartTimerGameTime(5.0, QuestStartTimerID)
		else
			setStage(20)
			; register for events
			RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
		endif
	endif
endEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == RadioObjectiveTimerID
		if Game.IsPlayerListening(MinutemenCentralQuest.MinutemenRadioFrequency)
			setStage(805)
		elseif GetStageDone(900) == false
			StartTimer(RadioObjectiveIntervalSeconds, RadioObjectiveTimerID)
		endif
	endif
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " received OnLocationChange from " + akSender)
	; watch for player OnLocationChange events:
	if akSender == Game.GetPlayer()
		if GetStageDone(20) && !GetStageDone(100) && akNewLoc == TheCastleLocation
	    	; player has arrived in the Castle after Ronnie is enabled
	   		SetStage(100)
		endif

	endif
EndEvent

Event ObjectReference.OnWorkshopMode(ObjectReference akSender, bool aStart)
	; TEMP - until we have a scrapping event
	debug.trace(self + " OnWorkshopMode " + aStart)
	if aStart == false
		; check to see if rubble has been disabled
		CheckForRubbleCleared()
	endif
endEvent

; watch for these from brawl quest
Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	if akSender == GenericBrawl && GetStageDone(120) && !GetStageDone(130)
		debug.trace(self + " OnStageSet: stage=" + auiStageID + ", item=" + auiItemID)
		if auiStageID == (GenericBrawl as GenericBrawlScript).QuestDoneStage ; stop stage
			setStage(130)
		endif
	endif
endEvent

Function BypassInitialize()
	CancelTimer(QuestStartTimerID)
;	UnRegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
EndFunction

;/
; get this event directly from the workshop (rather than the custom workshopParent event)
Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akReference)
	debug.trace(self + "OnWorkshopObjectDestroyed " + akReference)
	if akReference == SecretTunnelRubblePile.GetRef()
		CheckForRubbleCleared()
	endif
endEvent

; override event on parent script
Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " workshop event received")
	WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
	WorkshopScript workshopRef = akArgs[1] as WorkshopScript

	; if this is the rubble, set correct stage
	CheckForRubbleCleared()

	WorkshopParent.UpdateWorkshopObjectives(self, WorkshopObjectives, Alias_Workshop.GetRef() as WorkshopScript, akArgs)
EndEvent
/;

function CheckForRubbleCleared()
	ObjectReference rubble = SecretTunnelRubblePile.GetRef()
	if rubble && rubble.IsDisabled() && GetStageDone(290) && GetStageDone(400) == false
		setStage(400)
	endif
endFunction

; call when starting artillery objective to check for artillery already made
function InitializeArtilleryObjective()
	float Artillery = WorkshopParent.GetRating(Alias_Workshop.GetRef() as WorkshopScript, WorkshopParent.WorkshopRatingArtillery)
	debug.trace(self + " InitializeArtilleryObjective: starting artillery=" + Artillery)
	if Artillery > 0
		WorkshopParent.UpdateWorkshopObjectivesSpecific(self, WorkshopObjectives, Alias_Workshop.GetRef() as WorkshopScript)
	endif
endFunction

; override parent script function
function HandleWorkshopEvent()
	; if this is the rubble, set correct stage
	CheckForRubbleCleared()

	debug.trace(self + " HandleWorkshopEvent: bArtilleryBuilt=" + bArtilleryBuilt)
	UpdateArtilleryObjective()
endFunction

function UpdateArtilleryObjective()
	WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
	; wait for recalc to finish
	workshopRef.WaitForWorkshopResourceRecalc()

	; check if artillery is built at the Castle
	float Artillery = WorkshopParent.GetRating(workshopRef, WorkshopParent.WorkshopRatingArtillery)
	bArtilleryBuilt = (Artillery > 0)

	; ready to fire if:
	; * all objectives are complete
	; * radio station is active
	bReadyToFireArtillery = bArtilleryBuilt && MinutemenCentralQuest.RadioStationActive
	debug.trace(self + " UpdateArtilleryObjective: bReadyToFireArtillery=" + bReadyToFireArtillery)

	; quest is at "ready to fire" point
	if GetStageDone(700) && GetStageDone(900) == false
		SetObjectiveCompleted(ObjectiveBuildArtillery, bArtilleryBuilt)
		if bReadyToFireArtillery
			SetObjectiveCompleted(ObjectivePowerRadioTransmitter)
			; ready to fire
			if GetStageDone(810)
				SetObjectiveDisplayed(ObjectiveFireArtillery)
			endif
		else
			SetObjectiveCompleted(ObjectivePowerRadioTransmitter, MinutemenCentralQuest.RadioStationActive)
			if MinutemenCentralQuest.RadioStationActive == false
				SetObjectiveDisplayed(ObjectivePowerRadioTransmitter)
			endif
			SetObjectiveCompleted(ObjectiveFireArtillery, false)
		endif
	endif
endFunction

Location Property TheCastleLocation Auto Const mandatory

Quest Property GenericBrawl const auto mandatory

bool property RonnieIntroInsult auto Conditional

int property RonnieArmoryObjectsRemain auto Conditional
{ how many objects are still in armory when Ronnie arrives - used to conditionalize scene dialogue }

RefCollectionAlias Property ArmoryObjects auto conditional mandatory
{ collection of armory inventory objects }

ReferenceAlias Property SecretTunnelRubblePile auto conditional mandatory
{ rubble pile alias }

bool Property bArtilleryBuilt auto conditional

bool Property bReadyToFireArtillery auto conditional
{ when TRUE, artillery is ready to fire:
  * exists
  * radio is working
  }

int property ObjectivePowerRadioTransmitter = 105 auto const
int property ObjectiveFireArtillery = 110 auto const
int property ObjectiveBuildArtillery = 80 auto const
