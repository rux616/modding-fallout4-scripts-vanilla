Scriptname DLC04:DLC04GZMainQuestEnemyCollection extends RefCollectionAlias
{Script for the Enemy RefCollectionAliases on DLC04GZMainQuest.}

Group Autofill_Properties
	DLC04:DLC04GZMainQuestScript property DLC04GZMainQuest Auto Const Mandatory
	ActorValue property Aggression Auto Const Mandatory
EndGroup

Group RefCollection_Properties
	bool property CollectionCleared Auto Hidden
	int property ObjectiveDisplayedStage Auto Const
	int property QuestTargetStageThreshold = 3 Auto Const
	int property QuestTargetStageToSet = -1 Auto Const 
	int property ClearedStageToSet = -1 Auto Const
EndGroup

bool RegisterLock
Actor[] ActorsToBecomeUnconscious
int ActorsToBecomeUnconsciousIndex = 0
int SetUnconsciousNoWaitTimerID = 101 Const

Function SetupEnemies()
	int i = 0
	While (i < Self.GetCount())
		Self.GetAt(i).SetValue(Aggression, 1)
		i = i + 1
	EndWhile
	ActorsToBecomeUnconscious = new Actor[0]
EndFunction


Event OnDeath(ObjectReference source, Actor killer)
	Debug.Trace("--- " + Self + " Got OnDeath for " + source)
	Self.RemoveRef(source)
	UpdateQuestObjectives()
EndEvent

;Star Control 'locks' robots of specific races in the Unconscious state.
;If something later tries to set them conscious (another script, native terminal, etc.) force them back to being unconscious.
;In the Galactic Zone, Star Control always wins, no exceptions.
Event OnConsciousnessStateChanged(ObjectReference source, bool abUnconscious)
	;Debug.Trace("Got OnConsciousnessStateChanged for " + source)
	if (!abUnconscious)
		Actor sourceActor = source as Actor
		if ((sourceActor != None) && \
			((DLC04GZMainQuest.SelectiveShutdownFaction1Index >= 0) && (sourceActor.IsInFaction(DLC04GZMainQuest.GalacticZoneEnemyFactions[DLC04GZMainQuest.SelectiveShutdownFaction1Index]))) || \
			((DLC04GZMainQuest.SelectiveShutdownFaction2Index >= 0) && (sourceActor.IsInFaction(DLC04GZMainQuest.GalacticZoneEnemyFactions[DLC04GZMainQuest.SelectiveShutdownFaction2Index]))))
				;Debug.Trace("Forcing Unconscious again.")
				;Call SetUnconscious twice with a small delay, as Protectrons getting out of pods won't respond to the first call.
				sourceActor.SetUnconscious(True)
				Utility.Wait(7)
				sourceActor.SetUnconscious(True)
		EndIf
	EndIf
EndEvent


Function UpdateEnemies(bool takingControl=False)
	if (CollectionCleared)
		return
	EndIf

	While (RegisterLock)
		Utility.Wait(1)
	Endwhile
	RegisterLock = True

	;Debug.Trace("UpdateEnemies for " + Self)
	Faction shutdownFaction1
	Faction shutdownFaction2
	Faction controlledFaction1
	if (!takingControl)
		if (DLC04GZMainQuest.SelectiveShutdownFaction1Index >= 0)
			shutdownFaction1 = DLC04GZMainQuest.GalacticZoneEnemyFactions[DLC04GZMainQuest.SelectiveShutdownFaction1Index]
		EndIf
		if (DLC04GZMainQuest.SelectiveShutdownFaction2Index >= 0)
			shutdownFaction2 = DLC04GZMainQuest.GalacticZoneEnemyFactions[DLC04GZMainQuest.SelectiveShutdownFaction2Index]
		EndIf
		if (DLC04GZMainQuest.LimitedControlFaction1Index >= 0)
			controlledFaction1 = DLC04GZMainQuest.GalacticZoneEnemyFactions[DLC04GZMainQuest.LimitedControlFaction1Index]
		EndIf
	EndIf

	bool settingActorsUnconscious = False

	int i = Self.GetCount() - 1
	While (i >= 0)
		;Debug.Trace("Update While Loop: i=" + i)
		Actor current = Self.GetAt(i) as Actor
		;Debug.Trace("PROCESSING: " + Self + ", i=" + i + ", " + Self.GetAt(i))
		if (current == None)
			;Debug.Trace("ERROR: Index " + i + " in collection " + Self + " is NONE.", 2)
		ElseIf (current.IsDead())
			Self.RemoveRef(current)
			;Debug.Trace("-- " + current + " was dead; removing.")
		ElseIf (takingControl) 
			Self.RemoveRef(current)
			current.StopCombat()
			;Debug.Trace("-- " + current + " set Taken Control.")
		ElseIf ((controlledFaction1 != None) && current.IsInFaction(controlledFaction1))
			Self.RemoveRef(current)
			current.StopCombat()
			DLC04GZMainQuest.DLC04GalacticZone_SubvertedEnemies.AddRef(current)
		ElseIf ((shutdownFaction1 != None) && current.IsInFaction(shutdownFaction1))
			;Debug.Trace("--Update found " + current + "; needs to be shut down 1.")
			Self.RemoveRef(current)
			ActorsToBecomeUnconscious.Add(current)
			DLC04GZMainQuest.DLC04GalacticZone_SubvertedEnemies.AddRef(current)
			settingActorsUnconscious = True
		ElseIf ((shutdownFaction2 != None) && current.IsInFaction(shutdownFaction2))
			;Debug.Trace("--Update found " + current + "; needs to be shut down 2.")
			Self.RemoveRef(current)
			ActorsToBecomeUnconscious.Add(current)
			DLC04GZMainQuest.DLC04GalacticZone_SubvertedEnemies.AddRef(current)
			settingActorsUnconscious = True
		;Else
			;Debug.Trace("--No update for " + current)
		EndIf
		i = i - 1
	EndWhile

	if (settingActorsUnconscious)
		;Debug.Trace("Starting SetUnconsciousNoWaitTimerID")
		StartTimer(0, SetUnconsciousNoWaitTimerID)
	EndIf

	UpdateQuestObjectives()
	RegisterLock = False
EndFunction

Function SetUnconsciousNoWait()
	While (ActorsToBecomeUnconscious.Length > 0)
		ActorsToBecomeUnconscious[0].SetUnconscious(True)
		ActorsToBecomeUnconscious.Remove(0)
	EndWhile
	;Debug.Trace("SetUnconsciousNoWait for " + Self + " done.")
EndFunction

Event OnTimer(int timerID)
	if (timerID == SetUnconsciousNoWaitTimerID)
		SetUnconsciousNoWait()
	EndIf
EndEvent


Function UpdateQuestObjectives()
	if (DLC04GZMainQuest.GetStageDone(ObjectiveDisplayedStage))
		if ((ClearedStageToSet >= 0) && (Self.GetCount() == 0))
			DLC04GZMainQuest.SetStage(ClearedStageToSet)
		ElseIf ((QuestTargetStageThreshold >= 0) && (Self.GetCount() <= QuestTargetStageThreshold))
			DLC04GZMainQuest.SetStage(QuestTargetStageToSet)
		EndIf
	EndIf
	if (Self.GetCount() == 0)
		CollectionCleared = True
		DLC04GZMainQuest.UpdateQuestObjectives()
	EndIf
EndFunction