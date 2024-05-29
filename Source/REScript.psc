Scriptname REScript extends Quest Conditional
{Extends Quest. Used for Random Encounter quests, has common properties, functions, etc.}

REParentScript Property REParent Auto mandatory
{MANDATORY: All RExx quests must set this property. Pointer to REParentScript on REParent Quest}

RETriggerScript Property myTrigger Auto Hidden
{The trigger associated with this RE.}

group Registration
	ReferenceAlias[] Property RegisteredAliases Auto
	int property registeredAliasCount = 0 auto hidden	; index of how many aliases have been registered

	RefCollectionAlias[] Property RegisteredCollectionAliases Auto
	int property registeredRefCollectionCount = 0 auto hidden	; index of how many alias collections have been registered
	bool Property StopQuestWhenAliasesUnloaded = True auto
	{Default = true, once all the aliases are unloaded, the quest should stop}

	bool Property StopQuestWhenAliasesDead = False auto
	{Default = true, once all the aliases are dead, the quest should stop}

	int Property StopStage = -1 auto const
	{ optional - if left at -1, Stop will be called on the quest; otherwise, this stage will be set when the quest wants to "Stop"
		this is for special cases where you actually need the quest to stay running }
endGroup

; These properties are used to track deaths and automatically set a stage when the specified "dead count" is reached.
; You can set up multiple groups to track using the arrays, and setting the correct GroupIndex on the alias's REAliasScripts.
struct DeadCount
	int groupSize
	int stageToSet
	string description
	int currentCount
endStruct

DeadCount[] Property DeadCountGroups Auto
{ OPTIONAL: used to track dead counts of multiple groups for quest purposes
  If using, set up this array with the data for each group:
  	groupSize: total number of actors in group
	stageToSet: quest stage to set when dead count reaches groupSize
	description: Optional - description of each group
}

group RangeCheck
	;These properties perform a standardized range check (distance between the player and the trigger). This is used
	float Property RangeCheckDistance Auto
	{Optional - When player's distance to trigger is less than this, stage RangeCheckStage will be set.}
	int Property RangeCheckStage Auto
	{Optional - When player's distance to trigger is less than RangeCheckDistance, set this stage.}
endGroup

; Properties for timers
int[] Property TimerStages Auto
{ quest stages when the timer with ID matching the array index is received
  for example, if you start timer 0, the stage in TimerStages[0] will be set when that timer expires
}

;Property for Trigger reset
bool Property SetResetTimer = true Auto Const
{ Should this quest set the Reset Timer on the RETriggerScript
}

int startupTimerID = 99			; unique ID for quest startup timer
float startupTimerLength = 30.0		; length of startup timer in seconds - how long after quest starts does it register for cleanup events?

bool bFinishedOnStoryEvent = false 	; gets set to true after OnStoryScript event finishes - blocks Startup function from proceeding

;int rangeCheckTimerID = 100		; unique ID for quest range check timer
;float rangeCheckTimerLength = 1.0		; length of the range check timer in seconds.

; Called by OnInit in REAliasScript
function RegisterAlias(ReferenceAlias newAlias)
	if !RegisteredAliases
		; create the alias array
		RegisteredAliases = new ReferenceAlias[25]
	endif
	RegisteredAliases[registeredAliasCount] = newAlias
	registeredAliasCount = registeredAliasCount + 1
EndFunction

; Called by OnInit in RECollectionAliasScript
function RegisterCollectionAlias(RefCollectionAlias newCollectionAlias)
	if !RegisteredCollectionAliases
		; create the alias array
		RegisteredCollectionAliases = new RefCollectionAlias[10]
	endif
	RegisteredCollectionAliases[registeredRefCollectionCount] = newCollectionAlias
	registeredRefCollectionCount = registeredRefCollectionCount + 1
EndFunction


; on startup, tell my trigger that a quest has started
Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
	Debug.Trace(self + " OnStoryScript akRef1=" + akRef1)
	; tell my trigger that I've started (if I have a trigger)
	SetTrigger(akRef1 as RETriggerScript)

	; done with this event - allow Startup to proceed
	bFinishedOnStoryEvent = true
endEvent

; called by startup stage
function Startup()
	Debug.Trace(self + " REScript Startup")
	; failsafe counter
	int failsafeCounter = 20
	while bFinishedOnStoryEvent == false && failsafeCounter > 0
		debug.trace(self + " REScript Startup - waiting for OnStoryScript to finish...")
		utility.wait(0.1)
		failsafeCounter -= 1
	endWhile

	; put this at the end so we don't check for cleanup before we've finished starting up
	StartTimer(startupTimerLength, startupTimerID)

	; start a timer for the range check if necessary.
	if (RangeCheckDistance > 0)
		Debug.Trace(self + " Start range check for " + RangeCheckDistance + " units")
		RegisterForDistanceLessThanEvent(Game.GetPlayer(), myTrigger, RangeCheckDistance)
;		StartTimer(rangeCheckTimerLength, rangeCheckTimerID)
	endif

	; set global cooldown - next time any random encounter can trigger
	REParent.UpdateGlobalCooldown()
EndFunction

function SetTrigger(RETriggerScript akTrigger)
	myTrigger = akTrigger
	if myTrigger
		myTrigger.QuestStarted(self)
	endif
endFunction

Event OnTimer(int aiTimerID)
	; startup timer
	if aiTimerID == startupTimerID
		Debug.Trace(self + " OnTimer: startup timer expired: registeredAliasCount=" + registeredAliasCount)
		debug.trace(self + " OnTimer: registering for RECheckForCleanup events")
		RegisterForCustomEvent(REParent, "RECheckForCleanup")
	;user-created timers
	else
		CheckForTimerStage(aiTimerID)
	endif
endEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	; NOTE: need to add more checks if we add additional distance checks
	; for now, we know what this is
	Debug.Trace(Self + " IN RANGE. " + afdistance)
	SetStage(RangeCheckStage)
endEvent

Event OnTimerGameTime(int aiTimerID)
    CheckForTimerStage(aiTimerID)
EndEvent

function CheckForTimerStage(int aiTimerID)
	; if quest is running (important), and we have that timer ID in the TimerStages array, set the stage
	if IsRunning() && TimerStages && aiTimerID < TimerStages.length
		debug.trace(self + " CheckForTimerStage: aiTimerID=" + aiTimerID + ", setting stage " + TimerStages[aiTimerID])
		; set the stage assigned to this timerID
		SetStage(TimerStages[aiTimerID])
	endif
endFunction

Event REParentScript.RECheckForCleanup(REParentScript akSender, Var[] akArgs)
	Debug.Trace(self + " received RECheckForCleanup event")
	; do I shut down when all my aliases are unloaded?
	if StopQuestWhenAliasesUnloaded || StopQuestWhenAliasesDead

		int iDeadCount = 0
		int iUnloadedCount = 0

		; loop through registered collections
		int iCollectionIndex = 0
		; how many refs are in the collections? we'll count as we go
		int iCollectionRefCount = 0
		while iCollectionIndex < registeredRefCollectionCount
			debug.trace(self + " RECheckForCleanup: iCollectionIndex=" + iCollectionIndex)
			RefCollectionAlias registeredCollection = RegisteredCollectionAliases[iCollectionIndex]
			int i = 0
			; running total of refs in the collections
			iCollectionRefCount += registeredCollection.GetCount()
			while i < registeredCollection.GetCount()
				Actor myActor = RegisteredCollectionAliases[iCollectionIndex].GetAt(i) as Actor
				; only actors can be dead...
				if myActor
					if myActor.IsDead() || myActor.IsInFaction(REParent.REIgnoreForCleanup)
						iDeadCount = iDeadCount + 1
					endif
				EndIf
				; any ref can be unloaded
				if !RegisteredCollectionAliases[iCollectionIndex].GetAt(i).Is3DLoaded() || (myActor && myActor.IsInFaction(REParent.REIgnoreForCleanup))
					iUnloadedCount = iUnloadedCount + 1
				endif
				i += 1
			endWhile
			iCollectionIndex = iCollectionIndex + 1
		endWhile

		; loop through registered aliases
		int iAliasIndex = 0
		while iAliasIndex < registeredAliasCount
			debug.trace(self + " RECheckForCleanup: iAliasIndex=" + iAliasIndex)
			Actor myActor = RegisteredAliases[iAliasIndex].GetActorRef()
			; only actors can be dead...
			if myActor
				if myActor.IsDead() || myActor.IsInFaction(REParent.REIgnoreForCleanup)
					iDeadCount = iDeadCount + 1
				endif
			EndIf
			; any ref can be unloaded
			if !RegisteredAliases[iAliasIndex].GetRef().Is3DLoaded() || (myActor && myActor.IsInFaction(REParent.REIgnoreForCleanup))
				iUnloadedCount = iUnloadedCount + 1
			endif
			iAliasIndex = iAliasIndex + 1
		endWhile

		int registeredRefCount = registeredAliasCount + iCollectionRefCount
		debug.trace(self + "registeredRefCount = " + registeredRefCount + " iDeadCount = " + iDeadCount + " iUnloadedCount = " + iUnloadedCount)
		if StopQuestWhenAliasesDead && iDeadCount >= registeredRefCount
			if StopStage > -1
				debug.trace(self + " all aliases dead: calling stop stage " + stopStage)
				setStage(StopStage)
			else
				debug.trace(self + " all aliases dead: no stop stage, stopping quest")
				Stop()
			endif
		endif
		if StopQuestWhenAliasesUnloaded && iUnloadedCount >= registeredRefCount
			if StopStage > -1
				debug.trace(self + " all aliases unloaded: calling stop stage " + stopStage)
				setStage(StopStage)
			else
				debug.trace(self + " all aliases unloaded: no stop stage, stopping quest")
				Stop()
			endif
		endif

	endif
EndEvent

function IncrementDeadCount(int aiGroupIndex = 0)
	DeadCountGroups[aiGroupIndex].currentCount += 1 
	if DeadCountGroups[aiGroupIndex].currentCount >= DeadCountGroups[aiGroupIndex].groupSize
		SetStage(DeadCountGroups[aiGroupIndex].stageToSet)
	endif
endFunction

function SetDeadCounts(int index, int newValue)
	DeadCountGroups[index].groupSize = newValue
	if DeadCountGroups[index].currentCount >= DeadCountGroups[index].groupSize
		setStage(DeadCountGroups[index].stageToSet)
	endif
endFunction

function AdjustDeadCounts(int index, int newValue)
	DeadCountGroups[index].groupSize = DeadCountGroups[index].groupSize + newValue
	if DeadCountGroups[index].currentCount >= DeadCountGroups[index].groupSize
		setStage(DeadCountGroups[index].stageToSet)
	endif
endFunction

; utility function called by quest stage
; register this quest for WorkshopAddActor events
function RegisterForWorkshopAddActor()
	RegisterForCustomEvent(REParent.WorkshopParent, "WorkshopAddActor")	
endFunction

; handle workshopAddActor event
Event WorkshopParentScript.WorkshopAddActor(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		Actor assignedActor = akArgs[0] as Actor
		int workshopID = akArgs[1] as int

		if assignedActor
			Debug.Trace(self + " WorkshopAddActor event received for " + assignedActor)
			AddGroupToWorkshop(assignedActor, workshopID)
		endif
	endif
EndEvent

; called by REParentScript when an RE actor has been assigned to a workshop
; if that actor is in a group on this quest, assign rest of group as well
function AddGroupToWorkshop(Actor assignedActor, int workshopID)
	; find the alias or collection that this assigned actor is in
	int groupIndex = -1
	; check collection aliases
	int i = 0
	int actorIndex = -1
	while (i < RegisteredCollectionAliases.Length) && groupIndex == -1
		if RegisteredCollectionAliases[i]
			actorIndex = RegisteredCollectionAliases[i].Find(assignedActor)
			if actorIndex > -1
				; the actor is in this collection - check the script for group ID
				groupIndex = (RegisteredCollectionAliases[i] as RECollectionAliasScript).GroupIndex
			endif
		endif
		i += 1
	endwhile
	; if not found, check the aliases
	i = 0
	while (i < RegisteredAliases.Length) && groupIndex == -1
		if RegisteredAliases[i] && RegisteredAliases[i].GetActorRef() == assignedActor
			; get group index
			groupIndex = (RegisteredAliases[i] as REAliasScript).GroupIndex
		endif
		i += 1
	endwhile

	; if we found a group, go back and assign all the actors in that group to the same workshop
	if groupIndex > -1
		; unregister for future events - otherwise we get new events for each actor we add
		UnregisterForCustomEvent(REParent.WorkshopParent, "WorkshopAddActor")	

		; look for this group in the collections array
		i = 0
		while (i < RegisteredCollectionAliases.Length)
			if RegisteredCollectionAliases[i] && (RegisteredCollectionAliases[i] as RECollectionAliasScript).GroupIndex == groupIndex
				; assign everyone in this collection to the workshop
				int collectionIndex = 0
				while (collectionIndex < RegisteredCollectionAliases[i].GetCount())
					REParent.WorkshopParent.AddPermanentActorToWorkshopPUBLIC(RegisteredCollectionAliases[i].GetAt(collectionIndex) as Actor, workshopID)
					collectionIndex += 1
				endwhile
			endif
			i += 1
		endwhile
		; look for this group in the aliases array
		i = 0
		while (i < RegisteredAliases.Length)
			if RegisteredAliases[i] && (RegisteredAliases[i] as REAliasScript).GroupIndex == groupIndex
				; assign to the workshop
				REParent.WorkshopParent.AddPermanentActorToWorkshopPUBLIC(RegisteredAliases[i].GetActorRef(), workshopID)
			endif
			i += 1
		endwhile

	endif
endFunction

Function UpdateDeadCountGroupSize(int groupIndex, int newSize)
	DeadCountGroups[groupIndex].groupSize = newSize
EndFunction