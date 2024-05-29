Scriptname DefaultAlias extends ReferenceAlias Const hidden Default
{Master script for the DefaultAlias scripts.}
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

	 bool Property TurnOffWhenDead = false auto Const
	 { if TRUE, don't set any stage if actor is dead when event happens }
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup


Function TryToSetStage(Bool PlayerCheckOverride = FALSE, ObjectReference RefToCheck = NONE, Form FormToCheck = NONE, ObjectReference[] ReferenceArray = NONE, ReferenceAlias[] AliasArray = NONE, Faction[] FactionArray = NONE, Form[] FormArray = NONE, Location[] LocationArray = NONE, LocationAlias[] LocationAliasArray = NONE, bool LocationMatchIfChild = false)
	DefaultScriptFunctions.DefaultScriptTrace("DefaultAlias: TryToSetStage()", ShowTraces)
	if TurnOffWhenDead
		Actor myActor = GetActorRef()
		if myActor && myActor.IsDead()
			; do nothing
			return
		endif
	endif
	DefaultScriptFunctions.TryToSetStage(GetOwningQuest(), StageToSet, PrereqStage, TurnOffStage, PlayerCheckOverride, RefToCheck, FormToCheck, ReferenceArray, AliasArray, FactionArray, FormArray, LocationArray, LocationAliasArray, LocationMatchIfChild)
EndFunction