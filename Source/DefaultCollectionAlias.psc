Scriptname DefaultCollectionAlias extends RefCollectionAlias hidden Default
{Master script for the DefaultCollectionAlias scripts.}

import CommonArrayFunctions

Group Required_Properties
	Int Property StageToSet = -1 Auto Const
	{Stage to Set}
EndGroup

Group Optional_Properties
	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this event to fire.}

	Int Property TurnOffStage = -1 Auto Const
	{If the quest stage is equal or greater than TurnOffStage, further events are ignored
	 NOTE: this stage does not actually have to be set - any quest stage equal or higher will turn off this script}

	 GlobalVariable Property TriggerCount Auto Const
	 { optionally - global will be incremented as each trigger ref is added }
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

ObjectReference[] TriggeredRefArray
int TriggeredRefArrayIndex = -1

; setStageOnSingleTrigger:
;	true = any single valid call to this function will set the stage
;	false = stage will be set only after ALL refs in the collection are triggered (e.g. for OnActivate)
;	NOTE: do not use FALSE for ref collections that might change while the trigger condition is in progress, since that will change the size of the TriggeredRefArray
; RETURN:
;	true = stage was set
;	false = stage wasn't set

bool Function TryToSetStage(ObjectReference TriggeredRef, Bool setStageOnSingleTrigger = true, Bool PlayerCheckOverride = FALSE, ObjectReference RefToCheck = NONE, Form FormToCheck = NONE, ObjectReference[] ReferenceArray = NONE, ReferenceAlias[] AliasArray = NONE, Faction[] FactionArray = NONE, Form[] FormArray = NONE, Location[] LocationArray = NONE, LocationAlias[] LocationAliasArray = NONE)
	DefaultScriptFunctions.DefaultScriptTrace("DefaultCollectionAlias: TryToSetStage() by " + TriggeredRef, ShowTraces)
	
	bool returnVal = false

	if setStageOnSingleTrigger
		returnVal = DefaultScriptFunctions.TryToSetStage(GetOwningQuest(), StageToSet, PrereqStage, TurnOffStage, PlayerCheckOverride, RefToCheck, FormToCheck, ReferenceArray, AliasArray, FactionArray, FormArray, LocationArray, LocationAliasArray)
	else

		; for now, let's do the collection checks here
		if TriggeredRefArray == NONE
			DefaultScriptFunctions.DefaultScriptTrace("		first trigger - initialize TriggeredRefArray to length " + GetCount(), ShowTraces)
			; not yet initialized, so do that first - initialize to size of ref collection
			TriggeredRefArray = new ObjectReference[GetCount()]
			TriggeredRefArrayIndex = 0
		endif
		if TriggeredRefArray.Find(triggeredRef) < 0
			DefaultScriptFunctions.DefaultScriptTrace("		adding to TriggeredRefArray", ShowTraces)
			; not already in triggered array, meaning this is new - so add to array
			TriggeredRefArray[TriggeredRefArrayIndex] = triggeredRef
			TriggeredRefArrayIndex += 1
			if TriggerCount
				TriggerCount.SetValue(TriggerCount.GetValue() + 1)
			endif
			; if we've filled the array - everything's been triggered - set the stage
			if TriggeredRefArrayIndex >= TriggeredRefArray.Length
				returnVal = DefaultScriptFunctions.TryToSetStage(GetOwningQuest(), StageToSet, PrereqStage, TurnOffStage, PlayerCheckOverride, RefToCheck, FormToCheck, ReferenceArray, AliasArray, FactionArray, FormArray, LocationArray, LocationAliasArray)
			endif
		else
			DefaultScriptFunctions.DefaultScriptTrace("		already in TriggeredRefArray - do nothing", ShowTraces)
		endif
	endif

	return returnVal
EndFunction

Event OnAliasShutdown()
	; clear the array on shutdown
	TriggeredRefArray.Clear()
EndEvent