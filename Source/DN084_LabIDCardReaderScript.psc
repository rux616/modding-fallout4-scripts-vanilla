Scriptname DN084_LabIDCardReaderScript extends IDCardReaderScript Hidden
{Script for the ID Card Reader that controls the elevator leading out of the DN084 reactor area. Plays a scene when activated while in the lockdown state.}

Group DN084_Properties
	Scene property DN084_SecurityAlertKeypadFail Auto Const Mandatory
	{DN084 Lab Lockdown scene.}
EndGroup


State Red_Lockdown
	Event OnActivate(ObjectReference akActionRef)
		Actor player = Game.GetPlayer()
		if (akActionRef == player)
			if (player.GetItemCount(IDCard) > 0)
				Self.playAnimationAndWait("play02", "End")
				LockdownFailureSound.Play(Self)
				DN084_SecurityAlertKeypadFail.Start()
			Else
				NeedsCardFailureSound.Play(Self)
				IDCardReaderMessageNeedsCard.Show()
				Player_IDCardReaderActivation.Start()
				if (myQuest != None && myLockdownStage >= 0)
					myQuest.SetStage(myLockdownStage)
				EndIf
			EndIf
		EndIf
	EndEvent
EndState