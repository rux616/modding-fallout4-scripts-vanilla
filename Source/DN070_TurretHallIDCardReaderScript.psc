Scriptname DN070_TurretHallIDCardReaderScript extends IDCardReaderScript Hidden
{Script for ID Card Reader in the turret hall area. Accepts two different ID Cards.}

Group DN070_Properties
	DN070_TurretHallManagerScript property DN070_TurretHallManagerRef Auto Const Mandatory
	{The turret hall manager this ID Card Reader operates.}

	MiscObject property DN070_MayorIDCard Auto Const Mandatory
	{The Mayor's ID Card.}

	MiscObject property DN070_JanitorIDCard Auto Const Mandatory
	{The Janitor's ID Card.}
EndGroup


Auto State Red
	Event OnActivate(ObjectReference akActionRef)
		Actor player = Game.GetPlayer()
		if (akActionRef == player)
			if ((player.GetItemCount(DN070_MayorIDCard) > 0) || (player.GetItemCount(DN070_JanitorIDCard) > 0))
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
					if (player.GetItemCount(DN070_MayorIDCard) > 0)
						DN070_TurretHallManagerRef.IDCardSwiped(True)
					Else
						DN070_TurretHallManagerRef.IDCardSwiped(False)
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

State Red_Lockdown
	Event OnActivate(ObjectReference akActionRef)
		Actor player = Game.GetPlayer()
		if (akActionRef == player)
			if ((player.GetItemCount(DN070_MayorIDCard) > 0) || (player.GetItemCount(DN070_JanitorIDCard) > 0))
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