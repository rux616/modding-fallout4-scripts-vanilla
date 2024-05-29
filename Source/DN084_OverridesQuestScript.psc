Scriptname DN084_OverridesQuestScript extends Quest Hidden Conditional
{Quest script for DN084 Overrides, a max-priority quest for overriding follower behavior in Mass Fusion.}

Group Basic_Properties
	;NOTE: These can change mid-quest, so it's better not to save off local refs in this case.

	ReferenceAlias property QuestCompanion Auto Const Mandatory
	{The DN084 Quest Companion, Ingram or Filmore.}

	ReferenceAlias property Companion Auto Const Mandatory
	{The Companion alias.}

	ReferenceAlias property Dogmeat Auto Const Mandatory
	{The Dogmeat alias.}

	ObjectReference property DN084_ControlRoomSandboxTriggerRef Auto Const Mandatory
	{The sandbox trigger in MassFusion02.}
EndGroup


;--------------------------
;Descent Sequence Override
;--------------------------

Group Descent_Overrides
	bool property isDescentSequenceActive Auto Hidden Conditional
	{Is the Descent Sequence active? If so, the Descent Override packages will be used.}
EndGroup

;Set the Descent Sequence bool and EVP.
Function SetDescentSequenceOverride(bool descentActive)
	isDescentSequenceActive = descentActive
	QuestCompanion.TryToEvaluatePackage()
	Companion.TryToEvaluatePackage()
	Dogmeat.TryToEvaluatePackage()
EndFunction


;----------------------
;Control Room Override
;----------------------
;
;The Control Room Override is designed to keep the player's followers from entering the airlock or reactor areas, where they would be exposed to
;lethal radiation and could become stuck. It does this by setting an actor value that controls an override package. Values for DN084_ControlRoomOverride are:
; 0 - Normal
; 1 - Actor not in trigger, moving to trigger.
; 2 - Actor in trigger, in sandbox override.
; 3 - Actor in trigger, moving out of trigger.
;
;As an additional failsafe, we also remove these overrides when the cell unloads (via an OnCellDetach on the trigger).


Group Control_Room_Overrides
	ActorValue property DN084_ControlRoomOverride Auto Const Mandatory
	{Actor value that controls the Control Room Override package.}
EndGroup

;Local refs
int playerTriggerEnterCount


;Sent by DN084_ControlRoomSandboxTriggerScript when the player or any of the quest aliases enter the control room trigger.
Function ControlRoomTriggerEntered(Actor akActor)
	;Debug.Trace("ControlRoomTriggerEntered: " + akActor)
	if (akActor == Game.GetPlayer())
		;Increment the player trigger entry counter.
		playerTriggerEnterCount = playerTriggerEnterCount + 1

		;Double check and make sure the player is really inside the trigger. In the rare event that we got a TriggerLeft
		;before a TriggerEntered, and the player isn't inside anymore, we don't want to apply the override.
		if (playerTriggerEnterCount > 0)
			;Debug.Trace("Actors sent in.")
			SetControlRoomOverride(QuestCompanion.GetActorRef(), 1)
			SetControlRoomOverride(Companion.GetActorRef(), 1)
			SetControlRoomOverride(Dogmeat.GetActorRef(), 1)
			FollowersScript.SetAutonomy(DN084_ControlRoomSandboxTriggerRef, False)
		EndIf
	Else
		;The player likely commanded the follower to enter the trigger. Apply the override to prevent them from doing
		;something we can't support, like entering the airlock.
		;Debug.Trace("Actor entered: " + akActor)
		SetControlRoomOverride(akActor, 2)
		;Start a timer to release them from the override.
		if (akActor == QuestCompanion.GetActorRef())
			StartTimer(0, 5)
		ElseIf (akActor == Companion.GetActorRef())
			StartTimer(1, 5)
		Else
			StartTimer(2, 5)
		EndIf
	EndIf
EndFunction


Event OnTimer(int timerID)
	;When that timer expires, determine who we're dealing with.
	Actor currentActor
	if (timerID == 0)
		currentActor = QuestCompanion.GetActorRef()
	ElseIf (timerID == 1)
		currentActor = Companion.GetActorRef()
	Else
		currentActor = Dogmeat.GetActorRef()
	EndIf

	;Check if the player is inside the trigger.
	if (playerTriggerEnterCount > 0)
		;If so, do nothing. The actor will leave when the player does, not before.
	Else
		;Otherwise, have the actor walk out.
		;Debug.Trace("Actor timer expired: " + currentActor)
		SetControlRoomOverride(currentActor, 3)
	EndIf
EndEvent


;Sent by DN084_ControlRoomSandboxTriggerScript when the player or any of the quest aliases leaves the trigger.
Function ControlRoomTriggerLeft(Actor akActor)
	;Debug.Trace("ControlRoomTriggerLeft: " + akActor)
	if (akActor == Game.GetPlayer())
		;Decrement the player trigger entry counter.
		playerTriggerEnterCount = playerTriggerEnterCount + 1
		;Debug.Trace("Actors recalled.")

		;Have all of the other actors walk out.
		SetControlRoomOverride(QuestCompanion.GetActorRef(), 3)
		SetControlRoomOverride(Companion.GetActorRef(), 3)
		SetControlRoomOverride(Dogmeat.GetActorRef(), 3)
	Else
		;When an actor walks out of the trigger, return them to their normal behavior.
		;Debug.Trace("Actor trigger left: " + akActor)
		SetControlRoomOverride(akActor, 0)
		FollowersScript.SetAutonomy(DN084_ControlRoomSandboxTriggerRef, True)
	EndIf
EndFunction


;Sent by DN084_ControlRoomSandboxTriggerScript when the player leaves the cell. Clear all of the overrides
;to make sure the player's followers will resume working normally.
Function ControlRoomCellDetach()
	QuestCompanion.GetActorRef().SetValue(DN084_ControlRoomOverride, 0)
	Companion.GetActorRef().SetValue(DN084_ControlRoomOverride, 0)
	Dogmeat.GetActorRef().SetValue(DN084_ControlRoomOverride, 0)
	FollowersScript.SetAutonomy(DN084_ControlRoomSandboxTriggerRef, True)
EndFunction


;Utility function: Set the actor value, clear any command states, and EVP the actor.
Function SetControlRoomOverride(Actor a, int overrideValue)
	int currentValue = a.GetValue(DN084_ControlRoomOverride) as int
	if ((currentValue == 0) && (overrideValue == 3))
		;Ignore. An actor not in the trigger was asked to walk out.
		overrideValue = 0
	ElseIf ((currentValue == 1) && (overrideValue == 3))
		;Set OverrideValue to 0. An actor not in the trigger was asked to walk out, but they're already out.
		overrideValue = 0
	ElseIf ((currentValue == 2) && (overrideValue == 0))
		;Set OverrideValue to 3. An actor in the trigger can't be forced out except by CellDetach, which doesn't use this function. Make sure they exit.
		overrideValue = 3	
	ElseIf ((currentValue == 3) && (overrideValue == 1))
		;Set OverrideValue to 2. An actor in the trigger was asked to walk in, but they're already there.
		overrideValue = 2
	EndIf
	;Debug.Trace("Override: " + a + " changed from " + currentValue + " to " + overrideValue)
	a.SetValue(DN084_ControlRoomOverride, overrideValue)
	a.FollowerFollow()
	a.EvaluatePackage()
EndFunction