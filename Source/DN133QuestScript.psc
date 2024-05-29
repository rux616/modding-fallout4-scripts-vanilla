Scriptname DN133QuestScript extends Quest Conditional

bool readyForCleanup = false

;NOTE WE DO NOT ACTUALLY SHUT THE QUEST DOWN AT THIS POINT
; We need the quest to get the markers for MinDefendCastle
Function CheckForQuestShutdown()
	if GetStageDone(MirelurkStage) && GetStageDone(QueenStage) && GetStageDone(SentryBotStage) && GetStageDone(RubbleStage)
		setStage(shutdownStage)
	endif
EndFunction


Function StartMirelurkCleanup()
	readyForCleanup = true
	debug.trace(self + "StartMirelurkCleanup")
	RegisterForRemoteEvent(DN133_MinutemenClutterParent, "OnCellDetach")
EndFunction


Event ObjectReference.OnCellDetach(ObjectReference akSender)
	debug.trace(self + " OnCellDetach " + akSender)
	if akSender == DN133_MinutemenClutterParent
		CancelTimerGameTime(1)
		StartTimerGameTime(8, 1)
	endif
EndEvent

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == 1 && !DN133_MinutemenClutterParent.Is3dLoaded()
		CleanUpMirelurkClutter()
	else
		StartTimerGameTime(8, 1)
	endif
EndEvent

Function CleanUpMirelurkClutter()
	debug.trace(self + "CleanUpMirelurkClutter")
	UnregisterForRemoteEvent(DN133_MinutemenClutterParent, "OnCellDetach")
	DN133_MinutemenClutterParent.EnableNoWait()
	DN133_MirelurkClutterParent.DisableNoWait()
	MirelurkQueen.getReference().DisableNoWait()
	
	;CourtyardMirelurks.DisableAll()
	;WallMirelurks.DisableAll()
	MirelurkEggs.DisableAll()
	DN133FComment2EnableParent.Enable()
	DN133SouthBostonMirelurks.disable()
	int i = 0
	int count = AllMirelurks.Length
	Debug.Trace(self + "Cleaning Up Mirelurks")
	Debug.Trace(self + "::: Mirelurk Count == " + count)
	while i < count
		AllMirelurks[i].Disable()
		i += 1
	EndWhile
EndFunction

Function RegisterMirelurks()
	Debug.Trace(self + "Registering Mirelurks")
	int i = 0
	int count = CourtyardMirelurks.GetCount()
	AllMirelurks = New ObjectReference[0]
	Debug.Trace(self + "::: CourtyardMirelurks Count == " + count)
	while i < count
		AllMirelurks.Add(CourtyardMirelurks.GetAt(i))
		i += 1
	EndWhile

	i =0
	count = WallMirelurks.GetCount()
	Debug.Trace(self + "::: WallMirelurks Count == " + count)
	while i < count
		AllMirelurks.Add(WallMirelurks.GetAt(i))
		i += 1
	EndWhile
	Debug.Trace(self + "AllMirelurks == " + AllMirelurks)
EndFunction

int EggsDestroyed = 0

Function IncrementEggCounter()
	Debug.Trace(self + ": IncrementEggCounter")
	EggsDestroyed += 1
	Debug.Trace(self + ": Eggs Destroyed = " + EggsDestroyed)
	if EggsDestroyed >= WarnNumber && !GetStageDone(WarnStage)
		SetStage(WarnStage)
	Elseif EggsDestroyed >= ReleaseNumber && !GetStageDone(ReleaseStage)
		SetStage(ReleaseStage)
	Endif
EndFunction

Group EggDestruction
	int Property WarnStage = 390 Auto Const
	int Property WarnNumber = 30 Auto Const
	int Property ReleaseStage = 400 Auto Const
	int Property ReleaseNumber = 55 Auto Const
EndGroup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Group shutdownStageGroup
	int property shutdownStage auto
	int property MirelurkStage auto
	int property QueenStage auto
	int property RubbleStage auto
	int property SentryBotStage auto
endGroup

ObjectReference[] AllMirelurks

Group Properties
	
	ObjectReference Property DN133_MinutemenClutterParent Auto Const

	ObjectReference Property DN133_MirelurkClutterParent Auto Const
	RefCollectionAlias Property MirelurkEggs auto

	RefCollectionAlias Property CourtyardMirelurks Auto

	RefCollectionAlias Property WallMirelurks Auto

	ReferenceAlias Property MirelurkQueen Auto

	Bool Property SentryKilledWithoutRonnie Auto Conditional

	ObjectReference Property DN133FComment2EnableParent Auto
	ObjectReference Property DN133SouthBostonMirelurks Auto

	Bool Property PrestonHelpedClearCastle auto conditional
EndGroup