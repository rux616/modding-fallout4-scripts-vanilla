Scriptname DLC04:DLC04_GZVaultTecEnemyTriggerScript Extends ObjectReference

bool property ignoreIfGZMainQuestComplete = False Auto Const
Quest property DLC04GZMainQuest Auto Const Mandatory
Keyword property LinkCustom01 Auto Const Mandatory
ActorValue property ProtectronPodStatus Auto Const Mandatory


Event OnActivate(ObjectReference akActivator)
	TriggerEnemies()
EndEvent

Event OnTriggerEnter(ObjectReference akActivator)
	TriggerEnemies()
EndEvent

Auto State Waiting
	Function TriggerEnemies()
		GoToState("Done")
		Debug.Trace("---AAA")
		if (!ignoreIfGZMainQuestComplete || !DLC04GZMainQuest.IsCompleted())
			ObjectReference[] Enemies = Self.GetLinkedRefChain(LinkCustom01)
			int i = 0
			Debug.Trace("---BBB " + Enemies)
			While (i < Enemies.Length)
				Actor currentEnemy = (Enemies[i] as Actor)
				Debug.Trace("Current = " + currentEnemy)
				if ((currentEnemy != None) && (!currentEnemy.IsDead()) && (!currentEnemy.IsDisabled()) && (currentEnemy.IsUnconscious()))
					Debug.Trace("---CCC " + Enemies)
					currentEnemy.SetValue(ProtectronPodStatus, 1)
					currentEnemy.SetUnconscious(False)
					Utility.Wait(Utility.RandomFloat(0.0, 0.75))
				EndIf
				i = i + 1
			EndWhile
			Debug.Trace("---DDD " + Enemies)
		EndIf
	EndFunction
EndState

State Done
EndState

Function TriggerEnemies()
EndFunction