ScriptName MS07aPlayerAliasScript extends ReferenceAlias

Key Property DmndEarlKey Auto
Key Property DmndSurgeryKey Auto
Quest Property pQuest Auto Const
int Property iStageToSet Auto Const
int Property iShutdownStage Auto Const
Location Property pLocation Auto Const
Location Property DiamondCityLocation Auto Const
ReferenceAlias Property Nick Auto Const
Faction Property IsCurrentCompanion Auto Const
Scene Property NickSearchesScene Auto Const

Event OnInit()
	AddInventoryEventFilter(DmndEarlKey)
	AddInventoryEventFilter(DmndSurgeryKey)
EndEvent

;check if the player has Earl's house key, kick off objectives if he does
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If akBaseItem == DmndEarlKey
		If GetOwningQuest().GetStageDone(15) == 0
			GetOwningQuest().Setstage(15)
		EndIf
	EndIf

	If akBaseItem == DmndSurgeryKey
		If GetOwningQuest().GetStageDone(45) == 0
			GetOwningQuest().Setstage(45)
		EndIf
	EndIf

EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	;Player has entered Earl's place, see if we should flash the objective again	
	if !pQuest.GetStageDone(iStageToSet) && !pQuest.GetStageDone(20) && !pQuest.GetStageDone(30) && !pQuest.GetStageDone(35) && !pQuest.GetStageDone(40) && !pQuest.GetStageDone(50)
		if akNewLoc == pLocation
			pQuest.SetStage(iStageToSet)
		endif
	endif

	;If player leaves Earl's while Nick's scene is playing, end it
	if akOldLoc == pLocation && NickSearchesScene.isPlaying()
		NickSearchesScene.Stop()
	endif

	;Only triggered if Nick hates player. Player has left Diamond City. Wrap up quest.
	if pQuest.GetStageDone(210)
		if akOldLoc == DiamondCityLocation && !DiamondCityLocation.IsChild(akNewLoc)
			pQuest.SetStage(220)
		endif
	endif
EndEvent