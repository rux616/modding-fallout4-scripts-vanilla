Scriptname RR101TourBotManagerScript extends ObjectReference Hidden
{Script for the DefaultDummy that manages the RR101 Tourbot.}

Keyword property LinkCustom01 Auto Const Mandatory
{Link to the Tourbot Protectron.}

DN131_SwanAliasScript property Swan Auto Const Mandatory
{Swan's reference alias on DN131.}

ObjectReference property RR101TourBotTrigger Auto Const Mandatory
{The Tourbot's trigger.}

ObjectReference property RR101TourBotButton Auto Const Mandatory
{The Tourbot's button.}

ActorValue property RR101_TourbotState Auto Const Mandatory
{Actor value used to control the Tourbot's package conditions.}

Sound property OBJSwitchGenericFail Auto Const Mandatory
{Failure sound for the button.}

int playerEntryCount	;Count incremented by OnTriggerEnter and decremented by OnTriggerLeave.
bool playerHasUsedButton ;Has the player interacted with the tourbot button?

Event OnInit()
	Actor Tourbot = Self.GetLinkedRef(LinkCustom01) as Actor
	;RegisterForRemoteEvent(Tourbot, "OnDeath")
	;RegisterForRemoteEvent(RR101TourBotButton, "OnActivate")
EndEvent


Auto State Ready
	;Tourbot has been killed.
	Event Actor.OnDeath(Actor akSource, Actor akKiller)
		;Debug.Trace("Tourbot killed.")
		;Disable the trigger.
		RR101TourBotTrigger.Disable()
		RR101TourBotTrigger.Delete()
		;Don't respond to further events.
		GoToState("Dead")
	EndEvent

	;Button has been activated.
	Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
		;Ignore button activations if Swan is active.
		if (!Swan.IsActive())
			;Debug.Trace("Button activated.")
			;Player has used the button.
			playerHasUsedButton = True

			;Disable the trigger from this point forward.
			RR101TourBotTrigger.Disable()
			RR101TourBotTrigger.Delete()

			;It doesn't matter what we pass to UpdateTriggerCount now.
			UpdateTriggerCount(0)
		Else
			OBJSwitchGenericFail.Play(akSource)
		EndIf
	EndEvent

	Function UpdateTriggerCount(int modCount)
		;Update the counter.
		if (playerHasUsedButton)
			if (playerEntryCount > 0)
				modCount = -1
				playerEntryCount = 0
			Else
				modCount = 1
				playerEntryCount = 1
			EndIf
		Else
			playerEntryCount = playerEntryCount + modCount
			
			;If the count is off for some reason, fix it up. For example, the count will be -1
			;if the player enters and leaves the trigger while Swan is active (since we ignore the Enter).
			if (playerEntryCount > 1)
				playerEntryCount = 1
			ElseIf (playerEntryCount < 0)
				playerEntryCount = 0
			EndIf
		EndIf
		Debug.Trace("TourBot: " + Self + ": Update: " + modCount + ", " + playerEntryCount + ", " + playerHasUsedButton)

		if ((modCount == 1) && (playerEntryCount == 1))
			CancelTimer(1)
			CancelTimer(2)
			Actor TourBot = Self.GetLinkedRef(LinkCustom01) as Actor
			TourBot.SetUnconscious(False)
			TourBot.SetValue(RR101_TourbotState, 3)
			TourBot.EvaluatePackage()
			Debug.Trace("Waking Tourbot")
		ElseIf ((modCount == -1) && (playerEntryCount == 0))
			if (playerHasUsedButton)
				StartTimer(0, 1)
				Debug.Trace("Sleeping Tourbot 1")
			Else
				StartTimer(5, 1)
				Debug.Trace("Sleeping Tourbot 1")
			EndIf
		EndIf
	EndFunction

	Event OnUnload()
		Debug.Trace("RR101TourBotRef Unloaded")
		CancelTimer(1)
		CancelTimer(2)
		playerEntryCount = 0
		Actor TourBot = Self.GetLinkedRef(LinkCustom01) as Actor
		;TourBot.SetUnconscious(True)
		TourBot.SetValue(RR101_TourbotState, 0)
		TourBot.MoveToMyEditorLocation()
	EndEvent

	Event OnTimer(int timerID)
		Actor Tourbot = Self.GetLinkedRef(LinkCustom01) as Actor
		if (timerID == 1)
			Debug.Trace("Tourbot Timer: Waiting for Travel")
			if ((Game.GetPlayer().GetDistance(Tourbot) > 3500) || playerHasUsedButton || Swan.IsActive())
				TourBot.SetValue(RR101_TourbotState, 2)
				TourBot.EvaluatePackage()
				StartTimer(2, 2)
				Debug.Trace("Sleeping Tourbot 2")
			Else
				Debug.Trace("Waiting for player to leave...")
				StartTimer(2, 1)
			EndIf
		ElseIf (timerID == 2)
			if (Tourbot.GetValue(RR101_TourbotState) == 1)
				;TourBot.SetUnconscious(True)
				TourBot.SetValue(RR101_TourbotState, 0)
				Debug.Trace("Sleeping Tourbot 3")
			Else
				Debug.Trace("Waiting for travel...")
				StartTimer(2, 2)
			EndIf
		EndIf
	EndEvent
EndState

State Dead
	;Do nothing.
EndState

;Called by DN131_SwanAliasScript to force the Tourbot into a sleeping state while Swan is active.
Function ForceTourbotToSleep()
	Actor Tourbot = Self.GetLinkedRef(LinkCustom01) as Actor
	if (!Tourbot.IsUnconscious())
		StartTimer(0, 1)
	EndIf
EndFunction

Event Actor.OnDeath(Actor akSource, Actor akKiller)
	;Do nothing.
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
	;Do nothing.
EndEvent

Function UpdateTriggerCount(int modCount)
	;Do nothing.
EndFunction