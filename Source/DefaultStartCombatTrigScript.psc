ScriptName DefaultStartCombatTrigScript extends ObjectReference
{Default trigger script that starts combat on one (or a chain of) linked actors when a trigger is entered.}
; KMK - removed default keyword - should be script reviewed before making a real default script (Actor property = bad idea)

Group Optional_Properties
	Actor property CombatTarget Auto Const
	{Default=Player. Actor that the linked actor(s) will be forced into combat with.}

	bool property onlyPlayer = True Auto Const
	{Default=TRUE. Only accept trigger events from the player?}

	bool property onlyOnce = True Auto Const
	{Default=TRUE. Only set AVs once? If True, disables and deletes the trigger when done.}

	Keyword property linkKeyword Auto Const
	{Link Keyword for the actor (or chain of actors) whose AVs we're going to set.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

Event OnTriggerEnter(ObjectReference akActionRef)
	if (!onlyPlayer || akActionRef == Game.GetPlayer())
		if (CombatTarget == None)
			ForceCombat(Self.GetLinkedRef(linkKeyword) as Actor, Game.GetPlayer())
		Else
			ForceCombat(Self.GetLinkedRef(linkKeyword) as Actor, CombatTarget)
		EndIf
		if (onlyOnce)
			Self.Disable()
			Self.Delete()
		EndIf
	EndIf
EndEvent

;Recursive helper function that starts combat on the actors.
Function ForceCombat(Actor akActor, Actor target)
	if (akActor != None)
		DefaultScriptFunctions.DefaultScriptTrace("StartCombat on " + akActor, ShowTraces)
		;Set the actor into combat.
		akActor.StartCombat(target)
		akActor.EvaluatePackage()

		;Recur.
		ForceCombat(akActor.GetLinkedRef(linkKeyword) as Actor, target)
	EndIf
EndFunction