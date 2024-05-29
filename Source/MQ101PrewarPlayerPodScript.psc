Scriptname MQ101PrewarPlayerPodScript extends ReferenceAlias

Quest Property MQ101 Auto

Auto State WaitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		debug.trace(Self + "Player Pod Triggered. Lock Controls.")
		If (akActionRef == Game.GetPlayer()) && (MQ101.GetStageDone(720) == 0)
			gotoState("hasbeentriggered")
			Game.ForceFirstPerson()
			(MQ101 as MQ101QuestScript).MQ101EnableLayer.DisablePlayerControls(abactivate=false, abCamSwitch=True, abLooking=True)
			MQ101.SetStage(720)
		EndIf
	EndEvent
EndState

State hasbeentriggered
	Event OnActivate(ObjectReference akActionRef)
		;empty state
	EndEvent
EndState
