Scriptname DLC01:DLC01Caravan_CaravanSiteScript extends ObjectReference
{Kills the reference on load. For an actor where StartsDead results in a broken pose.}

Quest property DLC01MQ01Caravan Auto Const Mandatory
ReferenceAlias property DLC01MQ01Caravan_Porter Auto Const Mandatory
RefCollectionAlias property DLC01MQ01_MechBots Auto Const Mandatory
ObjectReference property RobotSelfDestructerREF Auto Const Mandatory

Auto State Inactive
EndState

State Active
	Event OnLoad()
		StartTimer(0, 1)
	EndEvent

	Event OnUnload()
		CancelTimer(1)
	EndEvent

	Event OnTimer(int timerID)
		if (DLC01MQ01Caravan.GetStageDone(100))
			GoToState("Inactive")
		Else
			;Failsafe: If any of the MechBots are more than 4500u from this marker, self-destruct
			;them to make sure the quest won't get stuck if a robot runs off.
			int i = 0
			While (i < DLC01MQ01_MechBots.GetCount())
				Actor a = DLC01MQ01_MechBots.GetAt(i) as Actor
				if ((a != None) && (a.GetDistance(Self) > 4500))
					a.Activate(RobotSelfDestructerREF)
				EndIf
				i = i + 1
			EndWhile

			;Check whether we should set any of the Player Approach stages for the fight.
			Actor player = Game.GetPlayer()
			float playerDistance = player.GetDistance(Self)
			Actor porter = DLC01MQ01Caravan_Porter.GetActorRef()
			if (playerDistance < 1250)
				DLC01MQ01Caravan.SetStage(40)
			ElseIf (playerDistance < 3000)
				DLC01MQ01Caravan.SetStage(30)
			ElseIf ((porter != None) && (player.HasDetectionLoS(porter)))
				DLC01MQ01Caravan.SetStage(20)
			EndIf

			;Then restart the timer.
			StartTimer(2, 1)
		EndIf
	EndEvent
EndState

Function SetActive()
	GoToState("Active")
	StartTimer(0, 1)
EndFunction