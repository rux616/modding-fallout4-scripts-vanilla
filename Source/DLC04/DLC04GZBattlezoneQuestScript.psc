Scriptname DLC04:DLC04GZBattlezoneQuestScript extends Quest
{To be cleaned up.}

Faction property DLC04GZHostileRobotsFaction Auto Const Mandatory
RefCollectionAlias property RepairShop_OtherRobots Auto Const Mandatory
RefCollectionAlias property Arena_Enemies Auto Const Mandatory

Function StartAmbush(RefCollectionAlias col)
	int i = 0
	Debug.Trace("Starting ambush for " + col)
	While (i < col.GetCount())
		Actor current = col.GetAt(i) as Actor
		if (current != None)
			Debug.Trace("-- Activating " + current)
			current.setValue(ProtectronPodStatus, 1)
			current.Activate(DLC04GZBattlezoneActivator)
		EndIf
		i = i + 1
	EndWhile
EndFunction


ObjectReference property DLC04GZBattlezoneActivator Auto Const Mandatory
ActorValue property ProtectronPodStatus Auto Const Mandatory

ReferenceAlias property RepairShop_SentryBot Auto Const Mandatory
Sound property ObjTurretAlarmWarning Auto Const Mandatory
int countdownCount

Function StartCountdown()
	StartTimer(1, 1)
EndFunction

Event OnTimer(int timerID)
	if (timerID == 1)
		if (!RepairShop_SentryBot.GetActorRef().IsDead())
			if (countdownCount < 10)
				ObjTurretAlarmWarning.Play(RepairShop_SentryBot.GetActorRef())
				countdownCount = countdownCount + 1
				StartTimer(1, 1)
			Else
				RepairShop_SentryBot.GetActorRef().SetValue(Game.GetAggressionAV(), 3)
				if (GetStageDone(30))
					Actor RepairShopSentryBotAct = RepairShop_SentryBot.GetActorRef()
					RepairShopSentryBotAct.Kill()
					Utility.Wait(2)
					int i = RepairShop_OtherRobots.GetCount() - 1
					While (i > 0)
						Actor current = RepairShop_OtherRobots.GetAt(i) as Actor
						if (current != None)
							current.Activate(RepairShopSentryBotAct)
						EndIf
						i = i - 1
					EndWhile
				ElseIf (GetStageDone(31))
					Actor RepairShopSentryBotAct = RepairShop_SentryBot.GetActorRef()
					RepairShopSentryBotAct.Activate(RepairShopSentryBotAct)
					int i = RepairShop_OtherRobots.GetCount() - 1
					While (i > 0)
						Actor current = RepairShop_OtherRobots.GetAt(i) as Actor
						if (current != None)
							current.Activate(RepairShopSentryBotAct)
							RepairShopSentryBotAct.StartCombat(current)
						EndIf
						i = i - 1
					EndWhile
				EndIf
				SetStage(32)
			EndIf
		EndIf
	EndIf
EndEvent

Function GhostRefCollection(RefCollectionAlias col, bool shouldGhost)
	int i = 0
	While (i < col.GetCount())
		Actor a = col.GetAt(i) as Actor
		if (a != None)
			a.SetGhost(shouldGhost)
		EndIf
		i = i + 1
	EndWhile
EndFunction