Scriptname WorkshopREScript extends REScript conditional
{base script for workshop random event quests to extend}

WorkshopParentScript Property WorkshopParent const auto

ReferenceAlias Property Workshop const auto

int Property dailyUpdateCount auto hidden conditional
{ this gets incremented prior to each daily update}

int Property happinessModifierApplied = 0 auto
{ track the amount applied to the workshop's HappinessModifier rating through ModifyWorkshipHappiness function
   call UndoWorkshopHappinessModifier to clear the applied modifier
}

Event WorkshopParentScript.WorkshopDailyUpdate(WorkshopParentScript akSender, Var[] akArgs)
	Debug.Trace(self + " WorkshopDailyUpdate event received")
	dailyUpdateCount += 1
	DailyUpdate()
EndEvent

; empty function for child scripts to override
; called on the daily update
function DailyUpdate()
endFunction

function Startup()
	parent.Startup()
	; register for update events
	RegisterForCustomEvent(WorkshopParent, "WorkshopDailyUpdate")	
	StartupCustom()
endFunction

; empty function for child scripts to override
function StartupCustom()
endFunction

; utility function to change the happiness modifier
function ModifyWorkshopHappiness(int modValue)
	WorkshopParent.ModifyResourceData(WorkshopParent.WorkshopRatingValues[WorkshopParent.WorkshopRatingHappinessModifier], Workshop.GetRef() as WorkshopScript, modValue)
	happinessModifierApplied += modValue
endFunction

; utility function to set the happiness modifier
function SetWorkshopHappinessModifier(int newValue)
	WorkshopParent.SetResourceData(WorkshopParent.WorkshopRatingValues[WorkshopParent.WorkshopRatingHappinessModifier], Workshop.GetRef() as WorkshopScript, newValue)
endFunction

; call this to undo whatever happiness modifier(s) you applied using ModifyWorkshopHappiness
function UndoAppliedHappinessModifier()
	; only remove modifier if current modifier is greater
	WorkshopScript workshopRef = Workshop.GetRef() as WorkshopScript
	if workshopRef
		float currentModifier = workshopRef.GetValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingHappinessModifier].resourceValue)
		if currentModifier > 0 && happinessModifierApplied > 0 && currentModifier > happinessModifierApplied
			WorkshopParent.ModifyResourceData(WorkshopParent.WorkshopRatingValues[WorkshopParent.WorkshopRatingHappinessModifier], Workshop.GetRef() as WorkshopScript, happinessModifierApplied * -1)
		elseif currentModifier < 0 && happinessModifierApplied < 0 && currentModifier < happinessModifierApplied
			WorkshopParent.ModifyResourceData(WorkshopParent.WorkshopRatingValues[WorkshopParent.WorkshopRatingHappinessModifier], Workshop.GetRef() as WorkshopScript, happinessModifierApplied * -1)
		endif
	endif
	; clear modifier
	happinessModifierApplied = 0
endFunction
