Scriptname DLC01:DLC01MQ00Script extends Quest conditional

Quest property MQ102 const auto mandatory
ObjectReference Property DLC01_CaravanSiteMarker Auto Const
Formlist property DLC01MQRadiantQuestList const auto mandatory

GlobalVariable property DLC01MQRadiantQuestCount const auto mandatory
{ global which holds number of MQ radiants currently running - should normally be 1 or 0 }

Quest property DLC01MQ04 const auto mandatory

DLC01:MQ02QuestScript property DLC01MQ02 const auto mandatory
{ used to update MQ02 objective when robot workbenches are build/destroyed }

WorkshopParentScript property WorkshopParent const auto mandatory

ReferenceAlias property SanctuaryWorkshop const auto mandatory
{ Sanctuary Workshop - use as failsafe when previous workbench deleted and no other workshop available }

refCollectionAlias property Alias_WorkbenchRobots auto const mandatory
{ collection of all robot workbenches built by player }

ReferenceAlias property RobotWorkbench const auto mandatory
{ alias to hold last built workbench }

ReferenceAlias property RobotWorkbenchQuestTarget const auto mandatory
{ alias to use as quest target to last built workbench - will point to Sanctuary if nothing else available }

Keyword property DLC01WorkbenchRobotKeyword Auto Const mandatory

ActorValue property DLC01WorkshopRatingWorkbenchRobot auto const mandatory
{ resource value from robot workbench }

; called when DLC01 starts
function Startup()
	; ready to start quest? If not, register for events as needed
	if CheckForMQStart() == false
		; use location change events to start DLC01 main quest
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif

	; handle robot creation
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerCreateRobot")

	; watch for most recent robot workbench
	RegisterForWorkshopEvents()

	; initialize robot workbench aliases
	ClearRobotWorkbench(NONE)
endFunction

bool function CheckForMQStart()
	debug.trace(self + " CheckForMQStart")
	if Game.GetPlayer().GetLevel() >= 15
		If Game.GetPlayer().IsInLocation(DLC01CaravanLocation) == 0
		   SetStage(100)
		   return true
	    EndIf
	else
		return false
	endif
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    ; check if time to start
    If DLC01_CaravanSiteMarker.Is3DLoaded() == 0
    		debug.trace(self + "Passed requirements")
    	CheckForMQStart()
	EndIf
EndEvent

; track number of MQRadiant quests currently running
function TrackRadiantQuest(Quest theQuest, bool bAddToList = true)
	if bAddToList
		if DLC01MQRadiantQuestList.Find(theQuest) == -1
			DLC01MQRadiantQuestList.AddForm(theQuest)
		endif
	else
		DLC01MQRadiantQuestList.RemoveAddedForm(theQuest)
	endif
	DLC01MQRadiantQuestCount.SetValue(DLC01MQRadiantQuestList.GetSize())
	debug.trace(self + " TrackRadiantQuest: count=" + DLC01MQRadiantQuestCount.GetValue())
endFunction

; called by radiants when completed
function CompleteRadiantQuest(Quest theQuest)
	; update MQ03 globals if appropriate
	int currentCount = DLC01MQ03Count.GetValueInt()
	int total = DLC01MQ03Total.GetValueInt()

	if currentCount < total
		currentCount += 1
		DLC01MQ03Count.SetValue(currentCount)
	endif

	; time to start MQ04?
	if currentCount >= total
		DLC01MQ04.Start()
	endif

	; remove from list when completed
	TrackRadiantQuest(theQuest, false)
endFunction

Event Actor.OnPlayerCreateRobot(Actor akSender, Actor akRobot)
	Debug.trace(self + "OnPlayerCreateRobot " + akRobot)
	if akRobot is DLC01:WorkshopRobotScript
		(akRobot as DLC01:WorkshopRobotScript).CreatedByWorkbench()
	endif
EndEvent

; watch for robot workshop built/destroyed to keep alias up to date
function RegisterForWorkshopEvents(bool bRegister=true)
	; watch for most recent robot workbench
	if bRegister
		RegisterForCustomEvent(WorkshopParent, "WorkshopObjectBuilt")
		RegisterForCustomEvent(WorkshopParent, "WorkshopObjectDestroyed")
		RegisterForCustomEvent(WorkshopParent, "WorkshopPlayerOwnershipChanged")
	else
		UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectBuilt")
		UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectDestroyed")
		UnregisterForCustomEvent(WorkshopParent, "WorkshopPlayerOwnershipChanged")
		; clear aliases
		RobotWorkbench.Clear()
		RobotWorkbenchQuestTarget.Clear()
		Alias_WorkbenchRobots.RemoveAll()
	endif		
endFunction

Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if IsRobotWorkbench(newObject)
			debug.trace(self + " WorkshopObjectBuilt received for " + newObject)
			UpdateRobotWorkbenchCount(newObject, workshopRef, true)
		endif
	endif	
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if IsRobotWorkbench(newObject)
			debug.trace(self + " WorkshopObjectDestroyed received for " + newObject)
			UpdateRobotWorkbenchCount(newObject, workshopRef, false)
		endif
	endif
EndEvent

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopPlayerOwnershipChanged received")
	if (akArgs.Length > 0)
		bool bPlayerOwned = akArgs[0] as bool
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		WorkshopObjectScript robotWorkbenchRef = RobotWorkbench.GetRef() as WorkshopObjectScript

		WorkshopScript currentWorkbenchWorkshop = GetRobotWorkbenchWorkshop()

		if bPlayerOwned
			; new workshop - update if current workshop is Sanctuary or NONE (which should never happen)
			if workshopRef && ( SanctuaryWorkshop.GetRef() == currentWorkbenchWorkshop || currentWorkbenchWorkshop == NONE )
				; pass in new workshop to pick if possible
				UpdateRobotWorkbenchCount(robotWorkbenchRef, workshopRef, false)
			endif
		elseif workshopRef && workshopRef == currentWorkbenchWorkshop
			UpdateRobotWorkbenchCount(robotWorkbenchRef, NONE, false)
		endif
	endif
EndEvent

; get workshop for current robot workbench alias
WorkshopScript function GetRobotWorkbenchWorkshop()
	WorkshopObjectScript robotWorkbenchRef = RobotWorkbench.GetRef() as WorkshopObjectScript
	if robotWorkbenchRef
		return WorkshopParent.GetWorkshop(robotWorkbenchRef.workshopID)
	else
		return RobotWorkbenchQuestTarget.GetRef() as WorkshopScript
	endif
endFunction

bool function IsRobotWorkbench(WorkshopObjectScript objectToCheck)
	return (objectToCheck && objectToCheck.HasKeyword(DLC01WorkbenchRobotKeyword))
endFunction

function UpdateRobotWorkbenchCount(WorkshopObjectScript newWorkbench, WorkshopScript workshopRef, bool bAddingWorkbench)
	if newWorkbench
		if bAddingWorkbench == false
			Alias_WorkbenchRobots.RemoveRef(newWorkbench)
		else
			Alias_WorkbenchRobots.AddRef(newWorkbench)
		endif
	EndIf

	if bAddingWorkbench && newWorkbench
		UpdateRobotWorkbench(newWorkbench, workshopRef)
	else
		ClearRobotWorkbench(workshopRef)
	EndIf

	; now update MQ02 if appropriate
	if DLC01MQ02.GetStageDone(DLC01MQ02.BuildWorkbenchStartStage) && DLC01MQ02.GetStageDone(DLC01MQ02.BuildWorkbenchStopStage) == false
		int currentCount = Alias_WorkbenchRobots.GetCount()
		DLC01MQ02.UpdateObjective(currentCount, newWorkbench, workshopRef)
	endif
endFunction

function UpdateRobotWorkbench(WorkshopObjectScript newWorkbench, WorkshopScript newWorkshop)
	debug.trace(self + " UpdateRobotWorkbench newWorkbench=" + newWorkbench + ", newWorkshop=" + newWorkshop)
	if newWorkbench
		; if we have a workbench use that as quest target
		RobotWorkbench.ForceRefTo(newWorkbench)
		RobotWorkbenchQuestTarget.ForceRefTo(newWorkbench)
	else
		; no workbench - use workshop as quest target
		RobotWorkbench.Clear()
		RobotWorkbenchQuestTarget.ForceRefTo(newWorkshop)
	endif
endFunction

function ClearRobotWorkbench(WorkshopScript currentWorkshop)
	debug.trace(self + " ClearRobotWorkbench currentWorkshop=" + currentWorkshop)
	; try to find another robot workbench in current location
	WorkshopObjectScript newWorkbench = NONE
	WorkshopScript newWorkshop = currentWorkshop ; default

	if currentWorkshop
		ObjectReference[] otherWorkbenches = WorkshopParent.GetResourceObjects(currentWorkshop, DLC01WorkshopRatingWorkbenchRobot)
		if otherWorkbenches.Length > 0
			newWorkbench = otherWorkbenches[0] as WorkshopObjectScript
			debug.trace(self + "      found another workbench in current location: " + newWorkbench)
		endif
	EndIf

	; didn't find one - keep looking
	if newWorkbench == NONE
		; find another workbench somewhere
		if Alias_WorkbenchRobots.GetCount() > 0
			newWorkbench = Alias_WorkbenchRobots.GetAt(0) as WorkshopObjectScript
			debug.trace(self + "      found another workbench somewhere else: " + newWorkbench)
		elseif newWorkshop == NONE
			; find another owned workshop if we don't already have one
			WorkshopScript[] workshops = WorkshopParent.Workshops 
			int i = 0
			WorkshopScript ownedWorkshop = NONE
			; look for workshops with workbenches
			while i < workshops.Length && newWorkshop == NONE
				WorkshopScript workshopToCheck = workshops[i]
				if workshopToCheck.OwnedByPlayer
					; save owned workshop so we don't have to run through list again if we don't find workbench
					ownedWorkshop = workshopToCheck
				 	if workshopToCheck.GetValue(DLC01WorkshopRatingWorkbenchRobot) > 0
						newWorkshop = workshopToCheck
						debug.trace(self + "      no workbenches in list - found workshop to use: " + newWorkshop)
					EndIf
				endif
				i += 1
			endWhile

			if newWorkshop == NONE
				; just use any owned workshop
				newWorkshop = ownedWorkshop
				debug.trace(self + "      no workbenches in list - found workshop to use: " + newWorkshop)
			endif

			if newWorkshop == NONE
				; failsafe - use Sanctuary
				newWorkshop = SanctuaryWorkshop.GetRef() as WorkshopScript
				debug.trace(self + "      no owned workshops - point to Sanctuary")
			endif
		endif
	endif

	; update with whatever we found
	UpdateRobotWorkbench(newWorkbench, newWorkshop)
endFunction

GlobalVariable Property DLC01MQ03Count Auto Const Mandatory
GlobalVariable Property DLC01MQ03Total Auto Const Mandatory
Location Property DLC01CaravanLocation Auto Const Mandatory

