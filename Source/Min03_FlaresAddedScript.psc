Scriptname Min03_FlaresAddedScript extends ReferenceAlias

weapon property FormToBeAcquired auto
Group Stages
	int property StageToSet auto
	int property PrereqStage = -1 auto
	int property TurnOffStage = -1 auto
endGroup

Event OnAliasInit()
	AddInventoryEventFilter(FormToBeAcquired)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.Trace(self + ": has item added")
	debug.Trace("      akBaseItem == " + akBaseItem)
	;debug.Trace("      akItemReference == " + akItemReference)
	debug.Trace("      FormToBeAcquired == " + FormToBeAcquired)
	if akBaseItem != FormToBeAcquired
		debug.Trace("      Failed " + akBaseItem + " != " + FormToBeAcquired)
		RETURN
	endif
	debug.Trace("      Passed " + akBaseItem + " == " + FormToBeAcquired)
	Quest QuestToSet = getOwningQuest()
	if QuestToSet.GetStageDone(StageToSet)
		;debug.Trace("DefaultScriptFunctions: TryToSetStage() Stage Already Set, returning early")
		RETURN
	else
		if (PrereqStage > -1 && QuestToSet.GetStagedone(PrereqStage) == FALSE)
			;debug.Trace("DefaultScriptFunctions: TryToSetStage(): Prereq stage not set - do nothing")
		elseif (TurnOffStage > -1 && QuestToSet.GetStage() >= TurnOffStage)
			;debug.Trace("DefaultScriptFunctions: TryToSetStage(): Current stage >= TurnOffStage - do nothing")
		else
			QuestToSet.SetStage(StagetoSet)
		endif
	endif
endEvent