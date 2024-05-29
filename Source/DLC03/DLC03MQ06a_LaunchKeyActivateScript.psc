Scriptname DLC03:DLC03MQ06a_LaunchKeyActivateScript extends ObjectReference

Key Property DLC03MQ06_NukeLaunchKey Auto Const Mandatory
{Nuclear launch key}

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory
{Quest to set launch stage}

Sound Property OBJKeyCardActivateFail Auto Const Mandatory
{Block activation sound}

Auto State Ready
	Event OnActivate(ObjectReference akActionRef)
		Actor PA = Game.GetPlayer()
		if PA.GetItemCount(DLC03MQ06_NukeLaunchKey) >= 1
			GoToState("Busy")
			PA.RemoveItem(DLC03MQ06_NukeLaunchKey, abSilent = true)
			if PlayAnimationAndWait("PLAY01", "Done")
				DLC03MQ06_NukeHandling.SetStage(100)
				GoToState("Complete")
			else
				DLC03MQ06_NukeHandling.SetStage(100)
				GoToState("Complete")
			endif
		else
			OBJKeyCardActivateFail.PlayandWait(self)
		endif
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActionRef)
		;Do Nothing
	EndEvent
EndState

State Complete
	Event OnActivate(ObjectReference akActionRef)
		OBJKeyCardActivateFail.PlayandWait(self)
	EndEvent
EndState