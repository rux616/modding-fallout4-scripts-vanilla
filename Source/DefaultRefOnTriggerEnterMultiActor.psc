Scriptname DefaultRefOnTriggerEnterMultiActor extends DefaultOnEnterMultiActor conditional default
{sets a quest stage when the specified multiple actors enter a trigger
}

import CommonArrayFunctions

Group Required_Properties
	Quest Property MyQuest Auto Const
	{Quest containing the Stage to Set}

	Int Property StageToSet = -1 Auto Const
	{Stage to Set}
EndGroup

Group Optional_Properties
	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this event to fire}

	Int Property TurnOffStage = -1 Auto Const
	{If the quest stage is equal or greater than TurnOffStage, further events are ignored
	 NOTE: this stage does not actually have to be set - any quest stage equal or higher will turn off this script}

	bool property DeleteWhenDone = True  auto
	{ Delete myself after I've been triggered. Defaults to TRUE }
EndGroup

Function TryToSetStage(Bool PlayerCheckOverride = FALSE, ObjectReference RefToCheck = NONE, Form FormToCheck = NONE, ObjectReference[] ReferenceArray = NONE, ReferenceAlias[] AliasArray = NONE, Faction[] FactionArray = NONE, Form[] FormArray = NONE, Location[] LocationArray = NONE, LocationAlias[] LocationAliasArray = NONE)
	DefaultScriptFunctions.DefaultScriptTrace("DefaultRef: TryToSetStage()", ShowTraces)
	DefaultScriptFunctions.TryToSetStage(MyQuest, StageToSet, PrereqStage, TurnOffStage, PlayerCheckOverride, RefToCheck, FormToCheck, ReferenceArray, AliasArray, FactionArray, FormArray, LocationArray, LocationAliasArray)
EndFunction

; what happens when all my targets are in the trigger?
; override on subclass to change behavior
function TriggerMe()
	TryToSetStage()
	if DeleteWhenDone && MyQuest.GetStageDone(StageToSet)
		Delete()
	endif
	parent.TriggerMe()
endFunction