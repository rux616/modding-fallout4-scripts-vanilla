Scriptname DLC04:DLC04GZTrackingQuestStarCoreCollection extends RefCollectionAlias
{Script for the Star Core RefCollectionAliases on DLC04GZTrackingQuest.}

Group Autofill_Properties
	DLC04:DLC04GZMainQuestScript property DLC04GZMainQuest Auto Const Mandatory
EndGroup

Group RefCollection_Properties
	GlobalVariable property StarCoresTotalProperty Auto Const Mandatory
	GlobalVariable property StarCoresTakenProperty Auto Const Mandatory
	GlobalVariable property StarCoresLeftProperty Auto Const Mandatory
	String property StarCoresCollectionName Auto Const Mandatory
	int property DLC04GZMainQuest_ObjectiveStageAndID Auto Const
	bool property IsTheOutsideCollection Auto Const
	bool property IsTheExteriorCollection Auto Const
	DLC04:DLC04_GZStarControlTerminalScript property DLC04GZ_StarControlTerminalRef Auto Const Mandatory
EndGroup

Function SetupStarCoreCollection()
	int i = 0
	While (i < Self.GetCount())
		ObjectReference current = Self.GetAt(i)
		Debug.Trace("Setting up Collection: " + Self + ", index=" + i + ", value=" + current)
		DLC04:DLC04_GZStarCoreActivatorScript currentAsActivator = current as DLC04:DLC04_GZStarCoreActivatorScript
		DLC04:DLC04_GZStarCorePanelScript currentAsPanel = current as DLC04:DLC04_GZStarCorePanelScript

		if (currentAsActivator != None)
			currentAsActivator.RegisterCollection(Self)
		ElseIf (currentAsPanel != None)
			currentAsPanel.RegisterCollection(Self)
		Else
			Debug.Trace("ERROR: Unrecognized Star Core Collection Contents: " + current, 2)
		EndIf
		i = i + 1
	EndWhile	

	if (!IsTheOutsideCollection)
		StarCoresTotalProperty.SetValue(Self.GetCount())
		StarCoresTakenProperty.SetValue(0)
		StarCoresLeftProperty.SetValue(Self.GetCount())
	Else
		;StarCoresTotalProperty is fixed in advance, since the collection is empty.
		StarCoresTakenProperty.SetValue(0)
		StarCoresLeftProperty.SetValue(StarCoresTotalProperty.GetValue())
	EndIf
	Self.RegisterForRemoteEvent(DLC04GZMainQuest, "OnStageSet")
EndFunction

Event Quest.OnStageSet(Quest q, int stageID, int itemID)
	if (stageID == DLC04GZMainQuest_ObjectiveStageAndID)
		if (StarCoresTakenProperty.GetValue() >= StarCoresTotalProperty.GetValue())
			DLC04GZMainQuest.SetObjectiveCompleted(DLC04GZMainQuest_ObjectiveStageAndID)
		EndIf
	EndIf
EndEvent

Function StarCoreTaken(ObjectReference core)
	Self.RemoveRef(core)
	if (DLC04GZMainQuest.IsRunning() && DLC04GZMainQuest.IsObjectiveDisplayed(DLC04GZMainQuest_ObjectiveStageAndID))
		DLC04GZMainQuest.ModObjectiveGlobal(1, StarCoresTakenProperty, DLC04GZMainQuest_ObjectiveStageAndID, StarCoresTotalProperty.GetValue(), True, True, True)
		StarCoresLeftProperty.Mod(-1)
	Else
		StarCoresTakenProperty.Mod(1)
		StarCoresLeftProperty.Mod(-1)
	EndIf
EndFunction

Function UpdateTextReplacementData()
	Debug.Trace("Updating Replacement Data:: (" + StarCoresCollectionName + "Left) " + StarCoresLeftProperty.GetValueInt())
	DLC04GZ_StarControlTerminalRef.AddTextReplacementData(StarCoresCollectionName + "Taken", StarCoresTakenProperty)
	DLC04GZ_StarControlTerminalRef.AddTextReplacementData(StarCoresCollectionName + "Left", StarCoresLeftProperty)
	DLC04GZ_StarControlTerminalRef.AddTextReplacementData(StarCoresCollectionName + "Total", StarCoresTotalProperty)
EndFunction