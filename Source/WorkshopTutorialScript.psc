Scriptname WorkshopTutorialScript extends Quest Conditional

ReferenceAlias Property Alias_Workshop Auto Const
ReferenceAlias Property Alias_WorkerRequiredObject Auto Const
ReferenceAlias Property Alias_PowerRequiredObject Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

Keyword Property WorkshopWorkObject Auto Const mandatory
{ keyword on built object that indicates it is a "work" object for an actor }

Keyword Property WorkshopNoRepairKeyword Auto Const mandatory
{ keyword on object which indicates it can't be repaired }

String HelpMessageString = "WorkshopTutorialEvent"
float helpMessageInterval = 10.0 			; how long between repeating help messages
float helpMessageDurationLong = 10.0			; how long to display long help message
float helpMessageDurationShort = 3.0		; how long to display short (repeating) help message

Group EventTypes
	int property EventType_Build = 0 auto const
	int property EventType_Move = 1 auto const
	int property EventType_Destroy = 2 auto const
	int property EventType_Assign = 3 auto const
	int property EventType_Unassign = 4 auto const
	int property EventType_DestructionState = 5 auto const
	int property EventType_PowerState = 6 auto const
	int property EventType_EnterMenu = 7 auto const
endGroup

function TestDisplay()
	int i = 0
	while i < TutorialSteps.Length
		WorkshopTutorialStep theStep = TutorialSteps[i]
		debug.trace("Step " + i + ": status=" + theStep.status + " HelpMessage=" + theStep.HelpMessage + " CompletionMessage=" + theStep.CompletionMessage + " CompletionEvent=" + theStep.CompletionEvent)
		i += 1
	endWhile

	i = 0
	while i < Tutorials.Length
		WorkshopTutorial theTutorial = Tutorials[i]
		debug.trace("Tutorial " + i + ": active step=" + theTutorial.activeStep + ", workshop=" + theTutorial.workshopRef + ", bDone=" + theTutorial.bDone)
		i += 1
	endWhile

endFunction

bool debugUseMessageBox = false

function TestUseMessageBox(bool useMessageBox)
	debugUseMessageBox = useMessageBox
endFunction


;this is a set of data for a single tutorial steps that may be grouped with others in a sequence
struct WorkshopTutorialStep
	int tutorialID = -1
	{ which tutorial do I go with? (since we can't put arrays into structs) - matches ID of WorkshopTutorial }

	bool bStartingStep
	{ TRUE for the step that starts a tutorial sequence - should be only 1 of these }
	bool bFinalStep
	{ TRUE for the step that completes a tutorial sequence }

	Message	TriggerMessage
	{  message to display when starting this tutorial step - optional }
	Message	TriggerMessage2
	Message	TriggerMessage3

	bool bTriggerIsMessageBox = false
	{ set to true to display trigger messages as message boxes instead of help messages }

	Message HelpMessage
	{ help message to display during this step }

	Message	CompletionMessage
	{  message to display when completing this tutorial step - optional - usually just the final step needs this }

	Message	CompletionMessage2
	Message	CompletionMessage3

	int TriggerConditionIndex = -1
	{ OPTIONAL - index to Conditions index - all conditions must evaluate to TRUE for this to even consider triggering }

	int TriggerConditionIndex2 = -1
	{ OPTIONAL - index to Conditions index - all conditions must evaluate to TRUE for this to even consider triggering }

	int TriggerEvent
	{ event type that STARTS this step
		(I think this only applies to starting steps)
	}

	bool TriggerOnEventOnly = false
	{ if TRUE don't check anything but getting the event }

	actorValue TriggerResourceType
	{ Resource value we're looking for on the "event object" to trigger this}

	keyword TriggerKeyword
	{ keyword we're looking for on the "event object" to trigger this}

	int CompletionEvent
	{ event that completes this step
		-1 = immediately complete the step (no additional event needed)
	 }

	bool CompletionOnEventOnly = false
	{ if TRUE don't check anything but getting the event }

	actorValue CompletionResourceType
	{ Resource value we're looking for on the "event object" }

	keyword CompletionKeyword
	{ keyword we're looking for on the "event object" to complete}

	int Status = -1
	{ -1 = not started
	  0 = active
	  1 = done
	}
endStruct

struct WorkshopTutorial
	int tutorialID
	{ the ID of this tutorial (which is made up of 1 or more TutorialItems )}

	bool bDone
	{ if true, this whole sequence is done }

	int startingStep = -1
	{ set to index of starting step in TutorialSteps array }

	int activeStep = -1
	{ -1 = not active, otherwise the active step (index to TutorialSteps array) }

	WorkshopScript workshopRef
	{ the workshop where this tutorial is happening }

	ReferenceAlias AliasToFill
	{ optional - put the object into this alias
		will be cleared when step is completed
	 }

	; for now, let's try just having 1 "mutually exclusive" tutorial ID - can add more if we need to, sadly not as an array
	int mutuallyExclusiveTutorialID = -1
	{ if this tutorial is currently running, don't start this one
		AND automatically complete me if mutually exclusive tutorial completes }

	string description
	{ describe this so it's easier to parse later }

	int requiredTutorialID = -1
	{ if this tutorial isn't done, don't start this one }

	int UnregisterForEventTypeOnCompletion = -1
	{ if this is the final event of a type, unregister for that event when done }

endStruct

; conditions to check against values on the current workshop
struct Condition
	string description
	{ describe this so it's easier to parse later }

	actorValue ValueToCheck
	{ what value am I looking at }

	float TestValue
	{ what value am I testing against }

	int operator = 0
	{	0 : >
		1 : <
		2 : ==

	 the condition is of the form:
	  ValueToCheck OPERATOR TestValue, for example:
	  WorkshopRatingPopulation > 3
	}

endStruct

WorkshopTutorial[] property Tutorials auto
{ list of tutorials }

WorkshopTutorialStep[] property TutorialSteps auto
{ complete list of all tutorial steps - grouped by tutorialID }

Condition[] property Conditions auto
{ array of all conditions - access by index }


function InitializeQuest()
	; register for build events from workshop
	RegisterForCustomEvent(WorkshopParent, "WorkshopObjectBuilt")
	RegisterForCustomEvent(WorkshopParent, "WorkshopObjectMoved")
	RegisterForCustomEvent(WorkshopParent, "WorkshopObjectDestroyed")
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorAssignedToWork")
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorUnassigned")
	RegisterForCustomEvent(WorkshopParent, "WorkshopObjectDestructionStageChanged")
	RegisterForCustomEvent(WorkshopParent, "WorkshopObjectPowerStageChanged")
	RegisterForCustomEvent(WorkshopParent, "WorkshopEnterMenu")
endFunction

function HandleWorkshopEvent(Var[] akArgs, int iEventType)
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		debug.trace(" HandleWorkshopEvent: type " + iEventType + " from " + workshopRef)

		int completedCount = 0 ; count how many complete so we can unregister and shut down once all steps are done

		int tutorialIndex = 0
		while tutorialIndex < Tutorials.Length
			WorkshopTutorial theTutorial = Tutorials[tutorialIndex]
			if theTutorial.bDone == false
				debug.trace(" 	: tutorialID=" + theTutorial.tutorialID)
				if theTutorial.activeStep > -1
					debug.trace(" 		active tutorial - make sure we're still at " + theTutorial.workshopRef)
					; active tutorial
					; if this tutorial was at a different workshop, roll back - need to restart
					if theTutorial.workshopRef == workshopRef
						; same workshop - check active step
						EvaluateEvent(theTutorial, theTutorial.activeStep, workshopRef, newObject, iEventType)
					else
						; clear roll back all completed steps for this tutorial
						RollBackTutorial(theTutorial)
						; check if starting step should trigger
						EvaluateEvent(theTutorial, theTutorial.startingStep, workshopRef, newObject, iEventType)
					endif
				else
					debug.trace(" 		inactive tutorial - check to see if this event starts it")
					; see if first step is started by this event
					EvaluateEvent(theTutorial, theTutorial.startingStep, workshopRef, newObject, iEventType)
				endif
			else
				; make sure unregistered (failsafe)
				if theTutorial.UnregisterForEventTypeOnCompletion > -1
					UnregisterForWorkshopEvent(theTutorial.UnregisterForEventTypeOnCompletion)
				endif
				completedCount += 1
			endif
			tutorialIndex += 1
		endWhile

		; loop through TutorialSteps looking for anything that has no completion event
		int stepIndex = 0
		while stepIndex < TutorialSteps.Length
			WorkshopTutorialStep theStep = TutorialSteps[stepIndex]
			if theStep.Status == 0 && theStep.CompletionEvent == -1
				; no completion event - complete immediately
				debug.trace(self + " step " + stepIndex + " started, no completion event: completing tutorial " + theStep.tutorialID)
				CompleteTutorialStep(Tutorials[theStep.tutorialID], stepIndex, newObject)
			endif
			stepIndex += 1
		endWhile

		if completedCount >= Tutorials.Length
			debug.trace(self + " ALL TUTORIALS COMPLETE - shut down")
			Stop()
		else
			debug.trace(self + " 	" + completedCount + " out of " + Tutorials.Length + " tutorials completed")
		endif

	endif
endFunction

function RollBackTutorial(WorkshopTutorial theTutorial)
	debug.trace(self + " RollBackTutorial " + theTutorial.tutorialID)
	; reset this tutorial back to starting state
	theTutorial.workshopRef = NONE
	theTutorial.activeStep = -1
	; loop through TutorialSteps looking for something to complete or start
	int stepIndex = 0
	while stepIndex < TutorialSteps.Length
		WorkshopTutorialStep theStep = TutorialSteps[stepIndex]
		if theStep.tutorialID == theTutorial.tutorialID
			theStep.Status = -1
			; reset any current help messages for this step
			if theStep.TriggerMessage
				debug.trace(self + " trying to cancel help message " + theStep.TriggerMessage)
				theStep.TriggerMessage.UnshowAsHelpMessage()
			endif
			if theStep.TriggerMessage2
				debug.trace(self + " trying to cancel help message " + theStep.TriggerMessage2)
				theStep.TriggerMessage2.UnshowAsHelpMessage()
			endif
			if theStep.TriggerMessage3
				debug.trace(self + " trying to cancel help message " + theStep.TriggerMessage3)
				theStep.TriggerMessage3.UnshowAsHelpMessage()
			endif
			if theStep.HelpMessage
				debug.trace(self + " trying to cancel help message " + theStep.HelpMessage)
				theStep.HelpMessage.UnshowAsHelpMessage()
			endif
			if theStep.CompletionMessage
				debug.trace(self + " trying to cancel help message " + theStep.CompletionMessage)
				theStep.CompletionMessage.UnshowAsHelpMessage()
			endif
			if theStep.CompletionMessage2
				debug.trace(self + " trying to cancel help message " + theStep.CompletionMessage2)
				theStep.CompletionMessage2.UnshowAsHelpMessage()
			endif
			if theStep.CompletionMessage3
				debug.trace(self + " trying to cancel help message " + theStep.CompletionMessage3)
				theStep.CompletionMessage3.UnshowAsHelpMessage()
			endif

;			HelpMessage(theTutorial, stepIndex, false)
		endif
		stepIndex += 1
	endWhile

endFunction

function HelpMessage(WorkshopTutorial theTutorial, int iStepIndex, bool bShowMessage = true)
	debug.trace(self + " HelpMessage for tutorial " + theTutorial.tutorialID + ", stepIndex = " + iStepIndex + ", bShowMessage=" + bShowMessage)
	WorkshopTutorialStep theStep = TutorialSteps[iStepIndex]
	if theStep.HelpMessage
		if bShowMessage
			string eventString = HelpMessageString + "_" + theTutorial.tutorialID + "_" + iStepIndex
			theStep.HelpMessage.ShowAsHelpMessage(eventString, helpMessageDurationShort, helpMessageInterval, 0, "WorkshopMenu")
		else
			debug.trace(self + " trying to cancel help message " + theStep.HelpMessage)
			theStep.HelpMessage.UnshowAsHelpMessage()
		endif
	endif
endFunction


function EvaluateEvent(WorkshopTutorial theTutorial, int iStepIndex, WorkshopScript workshopRef, WorkshopObjectScript theObject, int iEventType)
	WorkshopTutorialStep theStep = TutorialSteps[iStepIndex]
	debug.trace(self + "EvaluateEvent for step " + iStepIndex)

	; make sure workshop is currently loaded (can receive some events during e.g. daily update)
	if workshopRef.Is3dLoaded() == false
		return
	endif

	; see if this step should respond to the event
	if theStep.Status == 1
		; failsafe - do nothing if already complete
		return
	elseif theStep.Status == -1
		debug.trace(self + "	not started - should I start?")
		; should I start?
		; check for required tutorial
		if theTutorial.requiredTutorialID > -1
			WorkshopTutorial requiredTutorial = Tutorials[theTutorial.requiredTutorialID]
			; if required tutorial not complete, don't start
			if requiredTutorial && requiredTutorial.bDone == false
				; do nothing
				return
			endif
		endif

		; check for mutually exclusive tutorial already active:
		if theTutorial.mutuallyExclusiveTutorialID > -1
			WorkshopTutorial nemesisTutorial = Tutorials[theTutorial.mutuallyExclusiveTutorialID]
			if nemesisTutorial && nemesisTutorial.activeStep > -1
				; do nothing
				return
			endif
		endif
		; if no active "nemesis tutorial", okay to try to start me
		if IsValidEvent(true, theStep, workshopRef, theObject, iEventType)
			debug.trace(self + "	event type matches, correct trigger resource type - show trigger message")
			StartTutorialStep(theTutorial, iStepIndex, theObject)
			theTutorial.workshopRef = workshopRef
		endif
	elseif theStep.Status == 0
		debug.trace(self + "	started - should I complete?")
		; should I complete?
		if IsValidEvent(false, theStep, workshopRef, theObject, iEventType)
			debug.trace(self + "	event type matches, correct completion resource type - COMPLETE")
			CompleteTutorialStep(theTutorial, iStepIndex, theObject)
		endif
	endif
endFunction

bool function IsValidEvent(bool bTriggerEvent, WorkshopTutorialStep theStep, WorkshopScript workshopRef, WorkshopObjectScript theObject, int iEventType)
	; bTriggerEvent:
	; 	TRUE = checking for trigger event
	;	FALSE = checking for completion event

	debug.trace(self + " IsValidEvent: bTriggerEvent = " + bTriggerEvent + ", theStep=" + TutorialSteps.Find(theStep) + ", theObject=" + theObject + ", iEventType=" + iEventType)
	bool bIsValid = false

	; first check condition if any
	if bTriggerEvent == false || ( IsConditionTrue(theStep.TriggerConditionIndex) && IsConditionTrue(theStep.TriggerConditionIndex2) )
		int eventToCheck
		actorValue resourceToCheck
		keyword keywordToCheck
		bool checkEventOnly = false

		if bTriggerEvent
			eventToCheck = theStep.TriggerEvent
			resourceToCheck = theStep.TriggerResourceType
			keywordToCheck = theStep.TriggerKeyword
			checkEventOnly = theStep.TriggerOnEventOnly
		else
			eventToCheck = theStep.CompletionEvent
			resourceToCheck = theStep.CompletionResourceType
			keywordToCheck = theStep.CompletionKeyword
			checkEventOnly = theStep.CompletionOnEventOnly
		endif

		if iEventType == eventToCheck
			debug.trace(self + " 	checkEventOnly=" + checkEventOnly + ", iEventType==EventType_DestructionState? " + (iEventType == EventType_DestructionState))
			if checkEventOnly
				; special case - damage should only trigger for objects that can be repaired
				if iEventType == EventType_DestructionState
					if theObject.HasKeyword(WorkshopNoRepairKeyword) == false
						bIsValid = true
					endif
				else
					bIsValid = true
				endif
			elseif resourceToCheck && theObject && theObject.GetBaseValue(resourceToCheck) > 0
				bIsValid = true
			elseif keywordToCheck && theObject && theObject.HasKeyword(keywordToCheck)
				; SPECIAL CASE - beds don't count as work objects
				if keywordToCheck == WorkshopWorkObject && theObject.IsBed()
					bIsValid = false
				else
					bIsValid = true
				endif
			; anything else... for future expansion
			endif
		endif
	endif

	debug.trace(self + " 		IsValidEvent=" + bIsValid)
	return bIsValid
endFunction

bool function IsConditionTrue(int iConditionIndex)
	debug.trace(self + " IsConditionTrue: index = " + iConditionIndex)
	bool bIsTrue = true ; invalid data = true (otherwise it will ALWAYS be false which is worse)
	if iConditionIndex > -1 && iConditionIndex < Conditions.Length
		debug.trace(self + "  	evaluating condition " + iConditionIndex)
		Condition theCondition = Conditions[iConditionIndex]
		; evaluate the condition
		WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
		if workshopRef
			string operatorString
			float currentValue = workshopRef.GetValue(theCondition.ValueToCheck)
			if theCondition.operator == 0
				;   >
				operatorString = ">"
				if currentValue > theCondition.TestValue
				else
					bIsTrue = false
				endif
			elseif theCondition.operator == 1
				operatorString = "<"
				;   <
				if currentValue < theCondition.TestValue
				else
					bIsTrue = false
				endif
			elseif theCondition.operator == 2
				operatorString = "=="
				;   ==
				if currentValue == theCondition.TestValue
				else
					bIsTrue = false
				endif
			endif
			debug.trace(self + "  	 " + theCondition.ValueToCheck + " (" + currentValue + ") " + operatorString + theCondition.TestValue + " : " + bIsTrue)
		endif			
	endif
	return bIsTrue
endFunction

function StartTutorialStep(WorkshopTutorial theTutorial, int iStepIndex, WorkshopObjectScript theObject)
	debug.trace(self + " StartTutorialStep " + iStepIndex)
	WorkshopTutorialStep theStep = TutorialSteps[iStepIndex]
	theStep.status = 0
	theTutorial.activeStep = iStepIndex
	; fill alias if there is one
	if theTutorial.AliasToFill
		theTutorial.AliasToFill.ForceRefTo(theObject)
	endif
	if theStep.TriggerMessage
		if theStep.bTriggerIsMessageBox
			theStep.TriggerMessage.Show()
		else
			string eventString = HelpMessageString + "_" + theTutorial.tutorialID + "_" + iStepIndex + "_START"
			theStep.TriggerMessage.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0, 1, "WorkshopMenu")
			if theStep.TriggerMessage2
				theStep.TriggerMessage2.ShowAsHelpMessage(eventString + "2", helpMessageDurationLong, 0, 1, "WorkshopMenu")
			endif
			if theStep.TriggerMessage3
				theStep.TriggerMessage3.ShowAsHelpMessage(eventString + "3", helpMessageDurationLong, 0, 1, "WorkshopMenu")
			endif
		endif
	endif
	if theStep.HelpMessage
		HelpMessage(theTutorial, iStepIndex)
	endif
endFunction

function CompleteTutorialStep(WorkshopTutorial theTutorial, int iStepIndex, WorkshopObjectScript theObject)
	debug.trace(self + " CompleteTutorialStep " + iStepIndex)
	WorkshopTutorialStep theStep = TutorialSteps[iStepIndex]
	theStep.status = 1
	; turn off help message
	if theStep.HelpMessage
		HelpMessage(theTutorial, iStepIndex, false)
	endif

	; if there's a completion message, show it
	if theStep.CompletionMessage
		if debugUseMessageBox
			theStep.CompletionMessage.Show()
		else
			string eventString = HelpMessageString + "_" + theTutorial.tutorialID + "_" + iStepIndex + "_COMPLETE"
			theStep.CompletionMessage.ShowAsHelpMessage(eventString, helpMessageDurationLong, 0, 1, "WorkshopMenu")
			if theStep.CompletionMessage2
				theStep.CompletionMessage2.ShowAsHelpMessage(eventString + "2", helpMessageDurationLong, 0, 1, "WorkshopMenu")
			endif
			if theStep.CompletionMessage3
				theStep.CompletionMessage3.ShowAsHelpMessage(eventString + "3", helpMessageDurationLong, 0, 1, "WorkshopMenu")
			endif

		endif
	endif
	
	if theTutorial.AliasToFill
		theTutorial.AliasToFill.Clear()
	endif

	; if there's a next step, make it active automatically
	bool bFoundNextStep = false
	int i = iStepIndex + 1
	while i < TutorialSteps.Length && bFoundNextStep == false
		WorkshopTutorialStep nextStep = TutorialSteps[i]
		if nextStep.tutorialID == theTutorial.tutorialID
			debug.trace(self + " 	found next step: " + i)
			; found a new step - make it active
			bFoundNextStep = true
			StartTutorialStep(theTutorial, i, theObject)
		endif
		i += 1
	endWhile
	if bFoundNextStep == false
		; no next step - tutorial is complete
		debug.trace(self + "	TUTORIAL " + theTutorial.tutorialID + " COMPLETE")
		theTutorial.bDone = true
		theTutorial.activeStep = -1
		theTutorial.workshopRef = NONE
		; unregister for this event if appropriate
		if theTutorial.UnregisterForEventTypeOnCompletion > -1
			UnregisterForWorkshopEvent(theTutorial.UnregisterForEventTypeOnCompletion)
		endif

		; also complete any mutually exclusive tutorials
		if theTutorial.mutuallyExclusiveTutorialID > -1
			WorkshopTutorial nemesisTutorial = Tutorials[theTutorial.mutuallyExclusiveTutorialID]
			if nemesisTutorial
				nemesisTutorial.bDone = true
				nemesisTutorial.workshopRef = NONE
				; unregister for this event if appropriate
				if nemesisTutorial.UnregisterForEventTypeOnCompletion > -1
					UnregisterForWorkshopEvent(nemesisTutorial.UnregisterForEventTypeOnCompletion)
				endif
			endif
		endif
	endif
endFunction

Event WorkshopParentScript.WorkshopObjectBuilt(WorkshopParentScript akSender, Var[] akArgs)
	HandleWorkshopEvent(akArgs, EventType_Build)
EndEvent

Event WorkshopParentScript.WorkshopObjectMoved(WorkshopParentScript akSender, Var[] akArgs)
	HandleWorkshopEvent(akArgs, EventType_Move)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestroyed(WorkshopParentScript akSender, Var[] akArgs)
	HandleWorkshopEvent(akArgs, EventType_Destroy)
EndEvent

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	HandleWorkshopEvent(akArgs, EventType_Assign)
EndEvent

Event WorkshopParentScript.WorkshopActorUnassigned(WorkshopParentScript akSender, Var[] akArgs)
	HandleWorkshopEvent(akArgs, EventType_Unassign)
EndEvent

Event WorkshopParentScript.WorkshopObjectDestructionStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	HandleWorkshopEvent(akArgs, EventType_DestructionState)
EndEvent

Event WorkshopParentScript.WorkshopObjectPowerStageChanged(WorkshopParentScript akSender, Var[] akArgs)
	HandleWorkshopEvent(akArgs, EventType_PowerState)
EndEvent

Event WorkshopParentScript.WorkshopPlayerOwnershipChanged(WorkshopParentScript akSender, Var[] akArgs)
;	debug.tracefunction()
	if (akArgs.Length > 0)
		bool bPlayerOwned = akArgs[0] as bool
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if workshopRef == (Alias_Workshop.GetRef() as WorkshopScript)
			HandleWorkshopPlayerOwnershipChanged(bPlayerOwned)
		endif
	endif
EndEvent

function HandleWorkshopPlayerOwnershipChanged(bool bPlayerOwned)
	; empty function for child scripts to override
endFunction

Event WorkshopParentScript.WorkshopEnterMenu(WorkshopParentScript akSender, Var[] akArgs)
	HandleWorkshopEvent(akArgs, EventType_EnterMenu)
EndEvent

function UnregisterForWorkshopEvent(int eventType)
	debug.trace(self + " UnregisterForWorkshopEvent type=" + eventType)
	if eventType == EventType_Build
		UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectBuilt")
	elseif eventType == EventType_Move
		UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectMoved")
	elseif eventType == EventType_Destroy
		UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectDestroyed")
	elseif eventType == EventType_Assign
		UnregisterForCustomEvent(WorkshopParent, "WorkshopActorAssignedToWork")
	elseif eventType == EventType_Unassign
		UnregisterForCustomEvent(WorkshopParent, "WorkshopActorUnassigned")
	elseif eventType == EventType_DestructionState
		UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectDestructionStageChanged")
	elseif eventType == EventType_PowerState
		UnregisterForCustomEvent(WorkshopParent, "WorkshopObjectPowerStageChanged")
	elseif eventType == EventType_EnterMenu
		UnregisterForCustomEvent(WorkshopParent, "WorkshopEnterMenu")
	endif
endFunction

; 90051 - fix damaged object workshop tutorial
function FixWorkshopTutorial_1_4()
	WorkshopTutorialStep damageStep = TutorialSteps[8]
	debug.trace(self + " damageStep.TriggerMessage=" + damageStep.TriggerMessage)
	damageStep.CompletionMessage = NONE ; remove completion message which is where the problematic text replacement is
	damageStep.CompletionEvent = -1 ; have it complete instantly, since I don't actually have a repair event
endFunction