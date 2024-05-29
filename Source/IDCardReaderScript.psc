Scriptname IDCardReaderScript extends ObjectReference
{Script for IDCardReader01.}

Group Fixed_Properties
	Message property IDCardReaderMessageNeedsCard auto const mandatory
	{Failure message to display if the player doesn't have the card.}

	Sound property NeedsCardFailureSound auto const mandatory
	{Failure sound to play if the player doesn't have the card.}

	Message property IDCardReaderMessageLockdown auto const mandatory
	{Failure message to display if the card reader is locked down.}

	Sound property LockdownFailureSound auto const mandatory
	{Failure sound to play if the card reader is locked down.}

	Scene property Player_IDCardReaderActivation auto const mandatory
	{Player dialogue to play when the player activates the card reader without the card.}
EndGroup

Group Required_Properties
	MiscObject property IDCard auto const
	{The ID Card associated with this reader.}

	Scene property Player_IDCardLockdownActivation auto const
	{Player dialogue to play when the player activates the card reader while it's in the Lockdown state.}
EndGroup

Group Optional_Properties
	Quest property myQuest auto const
	{Quest to set a stage on when the card reader is used.}

	int property myStage = -1 auto const
	{Stage to set when the card reader is used successfully.}

	int property myFailStage = -1 auto const
	{Stage to set when the card reader is used but the player doesn't have the card.}

	int property myFailStagePrereq = -1 auto const
	{Stage that must be set before myFailStage can be set.}

	int property myLockdownStage = -1 auto const
	{Stage to set when the card reader is used and the player has the card, but the reader has been locked down.}

	Keyword property myLinkedRefToActivate auto const
	{Keyword of a linkedref to activate when the card reader is used successfully.}

	Keyword property myLinkedCardReader auto const
	{Keyword of the linkref'd card reader that should stay in sync with this card reader's state.}

	bool property shouldAutoReset = False auto const
	{Should the ID Card Reader reset itself to red after each successful use?}

	bool property shouldActivateAsPlayer = False auto const
	{Should the ID Card Reader activate myLinkedRefToActivate, passing the player as the activating ref instead of the card reader?}
EndGroup


Auto State Red
	Event OnActivate(ObjectReference akActionRef)
		Actor player = Game.GetPlayer()
		if (akActionRef == player)
			if (player.GetItemCount(IDCard) > 0)
				;Debug.Trace("Calling play01")
				GoToState("Green")
				Self.WaitFor3DLoad()
				Self.playAnimationAndWait("play01", "End")

				if (myLinkedCardReader != None)
					IDCardReaderScript syncedReader = Self.GetLinkedRef(myLinkedCardReader) as IDCardReaderScript
					if (syncedReader != None)
						syncedReader.PlayAnimation("startgreen")
						syncedReader.GoToState("Green")
					EndIf
				endif

				if (myQuest != None && myStage >= 0)
					myQuest.SetStage(myStage)
				EndIf

				ObjectReference objToActivate = Self.GetLinkedRef(myLinkedRefToActivate)
				if (objToActivate != None)
					;Debug.Trace("ID Card accepted. " + Self.GetLinkedRef(myLinkedRefToActivate) + " activated.")
					if (shouldActivateAsPlayer)
						objToActivate.Activate(Game.GetPlayer())
					Else
						objToActivate.Activate(Self)
					EndIf
				EndIf
				
				if (shouldAutoReset)
					ResetIDCardReader()
				EndIf
			Else
				NeedsCardFailureSound.Play(Self)
				IDCardReaderMessageNeedsCard.Show()
				Player_IDCardReaderActivation.Start()
				if ((myQuest != None) && ((myFailStagePrereq < 0) || (myQuest.GetStageDone(myFailStagePrereq))) && (myFailStage >= 0))
					myQuest.SetStage(myFailStage)
				EndIf
			EndIf
		EndIf
	EndEvent
EndState

State Green
	Event OnActivate(ObjectReference akActionRef)
		;Do Nothing.
	EndEvent
EndState

State Red_Lockdown
	Event OnActivate(ObjectReference akActionRef)
		Actor player = Game.GetPlayer()
		if (akActionRef == player)
			if (player.GetItemCount(IDCard) > 0)
				Self.playAnimationAndWait("play02", "End")
				LockdownFailureSound.Play(Self)
				IDCardReaderMessageLockdown.Show()
			Else
				NeedsCardFailureSound.Play(Self)
				IDCardReaderMessageNeedsCard.Show()
				Player_IDCardLockdownActivation.Start()
				if (myQuest != None && myLockdownStage >= 0)
					myQuest.SetStage(myLockdownStage)
				EndIf
			EndIf
		EndIf
	EndEvent
EndState


Function StartGreen()
	;Debug.Trace("Received StartGreen")
	Self.WaitFor3DLoad()
	Self.PlayAnimation("startgreen")
	GoToState("Green")
EndFunction

Function LockdownIDCardReader(bool shouldLockdown)
	if (shouldLockdown)
		GoToState("Red_Lockdown")
		ResetIDCardReader()
	Else
		GoToState("Red")
		ResetIDCardReader()
	EndIf
EndFunction

Function ResetIDCardReader(bool activateLinkedRefs = False)
	Self.WaitFor3DLoad()
	Self.playAnimation("reset")

	if (myLinkedCardReader != None)
		IDCardReaderScript syncedReader = Self.GetLinkedRef(myLinkedCardReader) as IDCardReaderScript
		if (syncedReader != None)
			syncedReader.PlayAnimation("reset")
			syncedReader.GoToState("Red")
		EndIf
	Endif

	if (activateLinkedRefs)
		Self.GetLinkedRef().Activate(Self)
		if (myLinkedRefToActivate != None)
			ObjectReference objToActivate = Self.GetLinkedRef(myLinkedRefToActivate)
			if (objToActivate != None)
				;Debug.Trace("ID Card accepted. " + Self.GetLinkedRef(myLinkedRefToActivate) + " activated.")
				if (shouldActivateAsPlayer)
					objToActivate.Activate(Game.GetPlayer())
				Else
					objToActivate.Activate(Self)
				EndIf
			EndIf
		EndIf
	Endif
	if (GetState() != "Red_Lockdown")
		GoToState("Red")
	EndIf
EndFunction