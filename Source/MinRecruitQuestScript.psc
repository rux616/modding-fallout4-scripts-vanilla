Scriptname MinRecruitQuestScript extends REScript Conditional
{base script for all Minutemen recruitment quests}

import WorkshopDataScript

group quests
	WorkshopParentScript Property WorkshopParent const auto
	MinutemenCentralScript property MinutemenCentralQuest auto const
endGroup

group aliases
	ReferenceAlias Property EventWorkshop const auto
	ReferenceAlias Property Workshop const auto
	ReferenceAlias property PrestonGarvey auto const

	LocationAlias property LocationToReset auto const
endGroup

group StartFlags
	bool property PrestonIntroOn auto Conditional		; set to true to turn on Preston's intro questgiver dialogue
	bool property RadioIntroOn auto Conditional			; set to true to turn on radio intro dialogue
	bool property PrestonWasCompanion auto conditional 	; set to true if Preston is/becomes companion at any time while quest is active
endGroup

group AutoShutdown
	bool property shutdownIfNotActive = true auto const
	{ if TRUE: quest will shutdown if player doesn't accept it after shutdownDays }

	int property shutdownDays = 2 auto
	{ days to shutdown if player doesn't accept quest }

	int property timeoutDays = 14 auto
	{ days to timeout when readyToShutDown is true }

	Message property TimeoutMessage auto const
	{ OPTIONAL - show 1 day before timeout }
endGroup

bool readyToStop = false ; when set to true, quest will stop on next daily update
bool timeoutActive = false ; when set to true, quest will stop if dailyUpdateCount >= timeoutDays

int property dailyUpdateCount auto hidden conditional ; this gets incremented prior to each daily update

bool property startsOwned = false auto Conditional
{ set to true if this settlement was already player-owned when the quest started }

group questStages
	int property activeStage = 20 auto const
	{ stage which indicates quest is active - accepted/visible }

	int property successStage = 200 auto const
	{ stage which indicates quest success }

	int property failureStage = 300 auto const
	{ stage which indicates quest failure }

	int property turnInStage = 450 auto const
	{ stage which indicates quest is ready to turn in to Preston - used only for GetStageDone checks }

	int property minRecruitStopStage = 500 auto const
	{ stage which means quest is stopping - used only by UpdateActiveRecruitmentQuests to check if quest should be removed from the active list }
endGroup

int Property happinessModifierApplied = 0 auto
{ track the amount applied to the workshop's HappinessModifier rating through ModifyWorkshopHappiness function
   call UndoWorkshopHappinessModifier to clear the applied modifier
}


Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
; aiValue1: 0 = started by change location
;			1 = started by Preston
;			2 = started by radio
	debug.trace(self + " OnStoryScript: akLocation=" + akLocation + " aiValue1=" + aiValue1)

	; check if started by event - if so, shut down immediately if event workshop != actual workshop
	; NOTE - this should never happen so this is a failsafe
	if aiValue1 == 0
		if EventWorkshop && ( EventWorkshop.GetRef() != Workshop.GetRef() )
			debug.trace(self + "    starting from change location, and event workshop != workshop picked (" + Workshop.GetRef() + ") - STOPPING QUEST")
			Stop()
			return
		endif
	elseif aiValue1 == 1
		PrestonIntroOn = true
	elseif aiValue1 == 2
		RadioIntroOn = true
	endif

	; check for player ownership
	startsOwned = ( (Workshop.GetRef() as WorkshopScript).GetActorOwner() == Game.GetPlayer().GetActorBase() )
	; check if Preston is a companion right now
	if PrestonGarvey.GetActorRef().IsInFaction(MinutemenCentralQuest.CurrentCompanionFaction)
		PrestonWasCompanion = true
	endif

	; 1.3: stop quest if picked dead questgiver
	StopQuestIfQuestgiverDead()	
endEvent

; called on the daily update
function DailyUpdate()
	debug.trace(self + " DailyUpdate: dailyUpdateCount=" + dailyUpdateCount)

	DailyUpdateCustom()	; a further function for scripts that extend this to use (so they don't override this DailyUpdate)

	; shutdown quest after 2 days if player hasn't accepted quest AND not assigned by Preston
	if shutdownIfNotActive && dailyUpdateCount >= shutdownDays && GetStageDone(activeStage) == false && PrestonIntroOn == false
		debug.trace(self + " DailyUpdate: shutdown days reached, quest not active - shutting down")
		Stop()
	endif

	; timeout warning message
	if readyToStop == false && timeoutActive && timeoutDays - dailyUpdateCount == 1
		if getStageDone(successStage) == false && TimeoutMessage
			TimeoutMessage.Show()
		endif
	EndIf

	; shutdown quest if quest is completed
	if readyToStop || (timeoutActive && dailyUpdateCount >= timeoutDays)
		debug.trace(self + " DailyUpdate: flagged ready to stop - shutting down")
		; if quest didn't succeed, count as failed
		if getStageDone(successStage) == false
			SetStage(failureStage)
		endif
		Stop()
	endif
endFunction

; call this to reset the timeout timer (e.g. when objective is completed)
function ResetTimeout()
	dailyUpdateCount = 0
endFunction


; blank function for extending scripts to override
function DailyUpdateCustom()
endFunction

function RadioSetStage(int stageToSet)
	MinutemenCentralQuest.RadioSetStage(self, stageToSet)
endFunction

function FinishQuest(bool bSuccess, bool bGiveReward = true)
	debug.traceStack(self + "FinishQuest " + bSuccess)
	ResetTimeout()
	if bSuccess
		WorkshopScript workshopRef = (Workshop.GetRef() as WorkshopScript)
		; if this is the first time the player takes control, count as a new ally for achievement
		if workshopRef.GetValue(WorkshopParent.WorkshopPlayerLostControl) == 0.0 && workshopRef.OwnedByPlayer == false
			MinutemenCentralQuest.IncrementAllyCount()
		endif

		; Make this workshop player owned
		workshopRef.SetOwnedByPlayer(true)

		; always give caps reward here
		if bGiveReward
			Game.GetPlayer().AddItem(MinutemenCentralQuest.MinRadiantReward)
		endif

		; if this farm has a discount vendor, add to farm discount faction
		FarmDiscountVendor[] FarmDiscountVendors = WorkshopParent.FarmDiscountVendors
		int vendorIndex = 0
		while vendorIndex < FarmDiscountVendors.Length
			FarmDiscountVendor theVendorData = FarmDiscountVendors[vendorIndex]
			if theVendorData.VendorLocation == workshopRef.GetEditorLocation()
				; correct location - find base actor in actor array
				ObjectReference[] WorkshopActors = WorkshopParent.GetWorkshopActors(workshopRef)
				int i = 0
				while i < WorkshopActors.Length
					Actor theActor = (WorkshopActors[i] as Actor)
					if theActor && theActor.GetActorBase() == theVendorData.VendorBaseActor
						theActor.AddToFaction(WorkshopParent.FarmDiscountFaction)
						i = WorkshopActors.Length ; break out of loop
					endif
					i += 1
				endWhile
			endif
			vendorIndex += 1
		endWhile
	else
		; ??
	endif
	; tell Minutemen system we completed recruitment quest
	MinutemenCentralQuest.CompleteRecruitmentQuest(self)

	; transition to next quest if Preston was questgiver
	if PrestonIntroOn
		if Game.GetPlayer().GetLevel() >= 10 ; at low level, don't start next recruitment quests settlements, to prevent picking new ones in hard zones
			MinutemenCentralQuest.TryToStartRecruitmentQuest()
		endif
	else
		; otherwise, flag for shutdown (next daily update)
		readyToStop = true
	endif
endFunction

Function EndQuest()
	; if never active, undo applied happiness modifier
	if GetStageDone(activeStage) == false
		UndoAppliedHappinessModifier()
	endif
	MinutemenCentralQuest.UpdateActiveRecruitmentQuests()
endFunction

Event WorkshopParentScript.WorkshopDailyUpdate(WorkshopParentScript akSender, Var[] akArgs)
	Debug.Trace(self + " WorkshopDailyUpdate event received")
	dailyUpdateCount += 1
	DailyUpdate()
EndEvent

Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] akArgs)
	Actor EventActor = akArgs[0] as Actor
	Bool IsNowCompanion = akArgs[1] as bool
	debug.trace(self + " FollowersScript.CompanionChange " + eventActor + " " + IsNowCompanion)

	If EventActor == PrestonGarvey.GetActorRef() && IsNowCompanion == True
		; turn off PrestonIntro (permanently) - try that and see how it feels
		PrestonWasCompanion = true
	Elseif EventActor == PrestonGarvey.GetActorRef() && IsNowCompanion == false
		; ?
	EndIf
EndEvent

function Startup()
	Debug.Trace(self + " MinRecruitQuestScript Startup")
	parent.Startup()
	; register for update events
	RegisterForCustomEvent(WorkshopParent, "WorkshopDailyUpdate")
	; register for follower events
	RegisterForCustomEvent(FollowersScript.GetScript(), "CompanionChange")

	; add to recruit quest list
	MinutemenCentralQuest.AddRecruitmentQuest(self)

	StartupCustom()
endFunction

; empty function for child scripts to override
function StartupCustom()
endFunction

; utility function to change the happiness modifier
function ModifyWorkshopHappiness(int modValue)
	debug.trace(self + "ModifyWorkshopHappiness " + modValue)
	WorkshopParent.ModifyHappinessModifier(Workshop.GetRef() as WorkshopScript, modValue)
	happinessModifierApplied += modValue
endFunction

; utility function to set the happiness modifier
function SetWorkshopHappinessModifier(int newValue)
	debug.trace(self + "SetWorkshopHappinessModifier " + newValue)
	WorkshopParent.SetHappinessModifier(Workshop.GetRef() as WorkshopScript, newValue)
endFunction

; call this to undo whatever happiness modifier(s) you applied using ModifyWorkshopHappiness
function UndoAppliedHappinessModifier()
	WorkshopParent.ModifyHappinessModifier(Workshop.GetRef() as WorkshopScript, happinessModifierApplied * -1)
	; clear modifier
	happinessModifierApplied = 0
endFunction

; utility function to update whether the quest can time out, as well as the elapsed time counter
function SetTimeOutStatus(bool abTimeoutActive, bool abResetElapsedTime = false)
	timeoutActive = abTimeoutActive
	if abResetElapsedTime
		dailyUpdateCount = 0
	endif
endFunction

; internal utility function
; factionID:
; 	-1 = remove from all factions
;   0 = Disappointed
;	1 = Hopeful
;	2 = Thankful
; 	3 = Worried
; 	4 = Failure
function AddNPCsToRadiantFaction(RefCollectionAlias theNPCs, int factionID = -1)
	; remove from all radiant factions, then add to new faction
	if theNPCs
		theNPCs.RemoveFromFaction(WorkshopParent.MinRadiantDialogueDisappointed)
		theNPCs.RemoveFromFaction(WorkshopParent.MinRadiantDialogueHopeful)
		theNPCs.RemoveFromFaction(WorkshopParent.MinRadiantDialogueThankful)
		theNPCs.RemoveFromFaction(WorkshopParent.MinRadiantDialogueWorried)
		theNPCs.RemoveFromFaction(WorkshopParent.MinRadiantDialogueFailure)
		; now add to new faction
		if factionID == 0
			theNPCs.AddToFaction(WorkshopParent.MinRadiantDialogueDisappointed)
		elseif factionID == 1
			theNPCs.AddToFaction(WorkshopParent.MinRadiantDialogueHopeful)
		elseif factionID == 2
			theNPCs.AddToFaction(WorkshopParent.MinRadiantDialogueThankful)
		elseif factionID == 3
			theNPCs.AddToFaction(WorkshopParent.MinRadiantDialogueWorried)
		elseif factionID == 4
			theNPCs.AddToFaction(WorkshopParent.MinRadiantDialogueFailure)
		endif
	endif

endFunction

function AddNPCsToDisappointedFaction(RefCollectionAlias theNPCs)
	AddNPCsToRadiantFaction(theNPCs, 0)
endFunction

function AddNPCsToHopefulFaction(RefCollectionAlias theNPCs)
	AddNPCsToRadiantFaction(theNPCs, 1)
endFunction

function AddNPCsToThankfulFaction(RefCollectionAlias theNPCs)
	AddNPCsToRadiantFaction(theNPCs, 2)
endFunction

function AddNPCsToWorriedFaction(RefCollectionAlias theNPCs)
	AddNPCsToRadiantFaction(theNPCs, 3)
endFunction

function AddNPCsToFailureFaction(RefCollectionAlias theNPCs)
	AddNPCsToRadiantFaction(theNPCs, 4)
endFunction

function ClearRadiantFactions(RefCollectionAlias theNPCs)
	AddNPCsToRadiantFaction(theNPCs, -1)
endFunction

; 1.3: check if questgiver is already dead - if so, stop quest (fail if appropriate)
ReferenceAlias property Alias_SettlementSpokesman auto const
function StopQuestIfQuestgiverDead()
	if Alias_SettlementSpokesman
		Actor questgiver = Alias_SettlementSpokesman.GetActorRef()
		if questgiver && questgiver.IsDead()
			; if quest already started, fail it
			if GetStageDone(activeStage)
				SetStage(failureStage)
			else
				; otherwise, just stop
				Stop()
			endif
		EndIf
	EndIf
endFunction

; 1.5 - to allow extended scripts to change this variable
function SetReadyToStop(bool bNewReadyToStop)
	readyToStop = bNewReadyToStop
endFunction