Scriptname DLC03:WorkshopRadiantOwnedScript extends MinRecruitQuestScript Conditional

ActorValue property DLC03WorkshopLastRadiantQuest auto const mandatory
{ actor value used to timestamp last time player got a radiant quest from a workshop }

GlobalVariable property DLC03WorkshopRadiantQuestResetTimeDays auto const mandatory
{ reset time to create timestamp for next time a radiant quest can run on this workshop }

float property CustomQuestResetTimeDays auto const
{ if > 0, will be used instead of DLC03WorkshopRadiantQuestResetTimeDays for this quest }

RefCollectionAlias property WorkshopNPCs auto const
{ collection of all workshop NPCs at settlement }

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
	; check for player ownership
	startsOwned = ( (Workshop.GetRef() as WorkshopScript).GetActorOwner() == Game.GetPlayer().GetActorBase() )

	; 1.3: stop quest if picked dead questgiver
	StopQuestIfQuestgiverDead()	
endEvent

; NOTE: FinishQuest on MinRecruitQuestScript does a lot of Minutemen-specific stuff, but none of it is bad to call from these quests:
; * MinutemenCentralQuest.IncrementAllyCount()  - this is for the achievement, OK to get achievement for DLC settlements
; * MinutemenCentralQuest.CompleteRecruitmentQuest(self) - no effect since this isn't in the Minutemen quest form lists (because we never called AddRecruitmentQuest() for this quest)
; * MinutemenCentralQuest.TryToStartRecruitmentQuest() - this is only called if PrestonIntroOn, which it never will be
function DLC03FinishQuest(bool bSuccess, bool bGiveReward = true, bool bReadyToStop = true)
	debug.trace(self + "FinishQuest bSuccess=" + bSuccess + ", bGiveReward=" + bGiveReward + ", bReadyToStop=" + bReadyToStop)
	FinishQuest(bSuccess, bGiveReward)
	SetReadyToStop(bReadyToStop)
	; timestamp of radiant quest activity
	UpdateResetTime()
endFunction

Function EndQuest()
	; if never active, undo applied happiness modifier
	if GetStageDone(activeStage) == false
		UndoAppliedHappinessModifier()
	endif
	; timestamp of radiant quest start
	UpdateResetTime()
endFunction

; NOTE: overriding parent function, because we do not want to call MinutemenCentralQuest.AddRecruitmentQuest(self) for these quests
function Startup()
	Debug.Trace(self + " WorkshopRadiantOwnedScript Startup")
	parent.Startup()
	; register for update events
	RegisterForCustomEvent(WorkshopParent, "WorkshopDailyUpdate")

	; put all workshop NPCs into collection
	UpdateWorkshopNPCsCollection()

	; timestamp of radiant quest start
	UpdateResetTime()

	StartupCustom()
endFunction

; empty function for child scripts to override
function StartupCustom()
endFunction

function UpdateResetTime()
	; timestamp of next time a radiant quest can run on this workshop

	; use custom time if there is one
	float resetTime = CustomQuestResetTimeDays
	if resetTime == 0.0
		; otherwise use default reset time
		resetTime = DLC03WorkshopRadiantQuestResetTimeDays.GetValue()
	endif
	
	Workshop.GetRef().SetValue(DLC03WorkshopLastRadiantQuest, Utility.GetCurrentGameTime() + resetTime)
endFunction

; used to make sure we grab all the workshop NPCs
; NOTE: this works because all these quests start when the location is loaded
function UpdateWorkshopNPCsCollection()
	ObjectReference[] workshopActors = WorkshopParent.GetWorkshopActors((Workshop.GetRef() as WorkshopScript))
	WorkshopNPCs.AddArray(workshopActors)
endFunction