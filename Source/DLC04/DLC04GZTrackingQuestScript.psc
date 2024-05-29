Scriptname DLC04:DLC04GZTrackingQuestScript Extends Quest
{Script for DLC04GZTrackingQuest, which spawns and manages the Star Cores needed by the Main and Misc quests.}

Group Autofill_Properties
	DLC04:DLC04GZMainQuestScript property DLC04GZMainQuest Auto Const Mandatory
	{DLC04GZMainQuest}
	DLC04:DLC04GZMiscObjectiveQuestScript property DLC04GZMiscObjective Auto Const Mandatory
	{DLC04GZMiscObjective}

	RefCollectionAlias property StarCores_All Auto Const Mandatory
	{RefCollectionAlias pointing at all of the Star Cores at all times.}
	RefCollectionAlias property StarCores_InHoldingContainer Auto Const Mandatory
	{RefCollectionAlias pointing at all of the Star Cores in the Holding Container.}
	RefCollectionAlias property StarCores_InPlayer Auto Const Mandatory
	{RefCollectionAlias pointing at all of the Star Cores carried by the player.}
	RefCollectionAlias property StarCores_InMainframe Auto Const Mandatory
	{RefCollectionAlias pointing at all of the Star Cores in the Mainframe's Holding Container.}
	RefCollectionAlias property LockedStarCorePanels Auto Const Mandatory
	{RefCollectionAlias with all of the DLC04_GZStarCorePanels in the mainframe that have a Star Core.}

	ReferenceAlias property StarCoreHoldingContainer Auto Const Mandatory
	{Star Core holding container.}
	ReferenceAlias property StarCoreMainframeContainer Auto Const Mandatory
	{Mainframe holding container.}

	GlobalVariable property DLC04GZ_StarCoresInstalled Auto Const Mandatory
	{Count of Star Cores that have been installed.}
	GlobalVariable property DLC04GZ_StarCoresClearTotal Auto Const Mandatory
	{Number of Star Cores needed to secure the zone.}
	GlobalVariable property DLC04GZ_StarCoresTotal Auto Const Mandatory
	{Number of Star Cores in total.}
	GlobalVariable property DLC04GZ_StarCoresPlayer Auto Const Mandatory
	GlobalVariable property DLC04GZ_StarCoresNotInstalled Auto Const Mandatory


	ObjectReference property DLC04GZ_StarCoreSpawnMarker Auto Const Mandatory
	{Marker to spawn Star Cores at.}
	MiscObject property DLC04GZ_StarCore Auto Const Mandatory
	{Star Core Misc Item base object.}
	Message property DLC04GZ_StarCoreActivateTextBlank Auto Const Mandatory

	DLC04:DLC04_GZStarControlTerminalScript property DLC04GZ_StarControlTerminalRef Auto Const Mandatory
EndGroup

Group Quest_Properties
	;Stages on the Main Quest the Tracking Quest sets or responds to.
	int property MainQuestStage_SearchingForStarCore = 50 Auto Const
	int property MainQuestStage_FoundStarCore = 60 Auto Const
EndGroup

;Local variables.
Actor player
int totalStarCoresAcquired
ObjectReference StarCoreHoldingContainerRef
ObjectReference StarCoreMainframeContainerRef


Event OnInit()
	player = Game.GetPlayer()
	StarCoreHoldingContainerRef = StarCoreHoldingContainer.GetReference()
	StarCoreMainframeContainerRef = StarCoreMainframeContainer.GetReference()
EndEvent


;When this quest starts, spawn the Star Core misc items, adding them to the holding container
;and their initial ref collections.
Function SpawnStarCores()
	int numToSpawn = DLC04GZ_StarCoresTotal.GetValueInt()
	int i = 0
	While (i < numToSpawn)
		ObjectReference core = DLC04GZ_StarCoreSpawnMarker.PlaceAtMe(DLC04GZ_StarCore)
		StarCores_All.AddRef(core)
		StarCores_InHoldingContainer.AddRef(core)
		StarCoreHoldingContainerRef.AddItem(core)
		i = i + 1
	EndWhile

	DLC04GZ_StarCoresPlayer.SetValue(0)
	DLC04GZ_StarCoresInstalled.SetValue(0)
	DLC04GZ_StarCoresNotInstalled.SetValue(DLC04GZ_StarCoresTotal.GetValueInt())
EndFunction


;Does the player have a Star Core?
bool Function PlayerHasCore()
	return StarCores_InPlayer.GetCount() > 0
EndFunction

;Transfer a Core from the holding container to the player.
Function AddCoreToPlayer()
	TransferCore(StarCores_InHoldingContainer, StarCores_InPlayer, player)
	Debug.Trace("Setting Value from " + DLC04GZ_StarCoresPlayer.GetValueInt() + " to " + StarCores_InPlayer.GetCount())
	DLC04GZ_StarCoresPlayer.SetValue(StarCores_InPlayer.GetCount())
	Debug.Trace("Values are now " + DLC04GZ_StarCoresPlayer.GetValueInt() + " : " + StarCores_InPlayer.GetCount())

	;If we were waiting for the player to acquire a Core, they just did, so set the desired stage.
	if (DLC04GZMainQuest.GetStage() == MainQuestStage_SearchingForStarCore)
		DLC04GZMainQuest.SetStage(MainQuestStage_FoundStarCore)
	ElseIf (DLC04GZMainQuest.IsRunning())
		DLC04GZMainQuest.UpdateStarCoreAcquireCount(DLC04GZ_StarCoresPlayer.GetValueInt() + DLC04GZ_StarCoresInstalled.GetValueInt())
	EndIf
EndFunction

;Transfer a Core from the player to the holding container.
Function RemoveCoreFromPlayer()
	TransferCore(StarCores_InPlayer, StarCores_InHoldingContainer, StarCoreHoldingContainerRef)
	Debug.Trace("Setting Value from " + DLC04GZ_StarCoresPlayer.GetValueInt() + " to " + StarCores_InPlayer.GetCount())
	DLC04GZ_StarCoresPlayer.SetValue(StarCores_InPlayer.GetCount())
	Debug.Trace("Values are now " + DLC04GZ_StarCoresPlayer.GetValueInt() + " : " + StarCores_InPlayer.GetCount())
EndFunction

;Transfer a Core from the player to the mainframe. These cores are 'locked' and can't be taken back.
Function RemoveCoreFromPlayerMainframe()
	TransferCore(StarCores_InPlayer, StarCores_InMainframe, StarCoreMainframeContainerRef)
	Debug.Trace("Setting Value from " + DLC04GZ_StarCoresPlayer.GetValueInt() + " to " + StarCores_InPlayer.GetCount())
	DLC04GZ_StarCoresPlayer.SetValue(StarCores_InPlayer.GetCount())
	Debug.Trace("Values are now " + DLC04GZ_StarCoresPlayer.GetValueInt() + " : " + StarCores_InPlayer.GetCount())
EndFunction

;Transfer a Core from a source collection to a destination collection, adding it to the appropriate container.
Function TransferCore(RefCollectionAlias sourceCollection, RefCollectionAlias destCollection, ObjectReference destContainer)
	if (sourceCollection.GetCount() == 0)
		Debug.Trace("ERROR: " + sourceCollection + " has no more cores to transfer.")
	Else
		ObjectReference core = sourceCollection.GetAt(0)
		sourceCollection.RemoveRef(core)
		destCollection.AddRef(core)
		destContainer.AddItem(core)
	EndIf
EndFunction


;When the player takes or inserts a Star Core, lock the panel.
Function LockStarCorePanel(ObjectReference consolePanel)
	consolePanel.BlockActivation()
	consolePanel.SetActivateTextOverride(DLC04GZ_StarCoreActivateTextBlank)
	LockedStarCorePanels.AddRef(consolePanel)
EndFunction

;When the player installs a Star Core into a mainframe panel, update the quest objectives.
Function MainframeCoreInstalled()
	;Update objectives that are monitoring this global.
	ModObjectiveGlobal(1, DLC04GZ_StarCoresInstalled)
	DLC04GZ_StarCoresNotInstalled.Mod(-1)
	Debug.Trace(DLC04GZ_StarCoresInstalled.GetValueInt())
	if (DLC04GZMainQuest.IsRunning())
		DLC04GZMainQuest.UpdateStarCoreInstallCount()
	EndIf
	if (DLC04GZMiscObjective.IsRunning())
		DLC04GZMiscObjective.UpdateStarCoreInstallCount()
	EndIf

	if (DLC04GZ_StarCoresInstalled.GetValueInt() == DLC04GZ_StarCoresClearTotal.GetValueInt())
		DLC04GZ_StarControlTerminalRef.BootSequence1Ready = False
		DLC04GZ_StarControlTerminalRef.BootSequence2Ready = True
		DLC04GZMainQuest.DisableEmergencyProtocolOptions()
	ElseIf (DLC04GZ_StarCoresInstalled.GetValueInt() == 1)
		DLC04GZ_StarControlTerminalRef.BootSequence1Ready = True
	EndIf

	StarControl_UpdateTextReplacementData()
EndFunction


;Text Replacement for the Star Control Terminal.
Function StarControl_UpdateTextReplacementData()
	DLC04GZ_StarControlTerminalRef.AddTextReplacementData("DLC04GZ_StarCoresInstalled", DLC04GZ_StarCoresInstalled)
	DLC04GZ_StarControlTerminalRef.AddTextReplacementData("DLC04GZ_StarCoresNotInstalled", DLC04GZ_StarCoresNotInstalled)
	DLC04GZ_StarControlTerminalRef.AddTextReplacementData("DLC04GZ_StarCoresClearTotal", DLC04GZ_StarCoresClearTotal)
	DLC04GZ_StarControlTerminalRef.AddTextReplacementData("DLC04GZ_StarCoresTotal", DLC04GZ_StarCoresTotal)
	DLC04GZ_StarControlTerminalRef.AddTextReplacementData("DLC04GZ_StarCoresPlayer", DLC04GZ_StarCoresPlayer)
	GalacticZoneExteriorCores.UpdateTextReplacementData()
	GalacticZoneNukaGalaxyCores.UpdateTextReplacementData()
	GalacticZoneTheaterCores.UpdateTextReplacementData()
	GalacticZoneVaultTecCores.UpdateTextReplacementData()
	GalacticZoneBattlezoneCores.UpdateTextReplacementData()
	GalacticZoneOutsideCores.UpdateTextReplacementData()
EndFunction



DLC04:DLC04GZTrackingQuestStarCoreCollection property GalacticZoneExteriorCores Auto Const Mandatory
DLC04:DLC04GZTrackingQuestStarCoreCollection property GalacticZoneNukaGalaxyCores Auto Const Mandatory
DLC04:DLC04GZTrackingQuestStarCoreCollection property GalacticZoneTheaterCores Auto Const Mandatory
DLC04:DLC04GZTrackingQuestStarCoreCollection property GalacticZoneVaultTecCores Auto Const Mandatory
DLC04:DLC04GZTrackingQuestStarCoreCollection property GalacticZoneBattlezoneCores Auto Const Mandatory
DLC04:DLC04GZTrackingQuestStarCoreCollection property GalacticZoneOutsideCores Auto Const Mandatory

Function SetupStarCoreCollections()
	GalacticZoneExteriorCores.SetupStarCoreCollection()
	GalacticZoneNukaGalaxyCores.SetupStarCoreCollection()
	GalacticZoneTheaterCores.SetupStarCoreCollection()
	GalacticZoneVaultTecCores.SetupStarCoreCollection()
	GalacticZoneBattlezoneCores.SetupStarCoreCollection()
	GalacticZoneOutsideCores.SetupStarCoreCollection()
	Debug.Trace("Star Core Collections set up.")
EndFunction













RefCollectionAlias property Spacesuits_All Auto Const Mandatory
RefCollectionAlias property Spacesuits_InHoldingContainer Auto Const Mandatory
RefCollectionAlias property SpacesuitHelmets_All Auto Const Mandatory
RefCollectionAlias property SpacesuitHelmets_InHoldingContainer Auto Const Mandatory
Armor property DLC04_Armor_Spacesuit Auto Const Mandatory
Armor property DLC04_Armor_Spacesuit_Helmet Auto Const Mandatory
int property CONST_StageToSetQuestSpacesuitsCollected = 20 Auto Const

Function SetupSpacesuits()
	Spacesuits_InHoldingContainer.AddRefCollection(Spacesuits_All)
	SpacesuitHelmets_InHoldingContainer.AddRefCollection(SpacesuitHelmets_All)
EndFunction

GlobalVariable Property DLC04MS02_Spacesuit_Count Auto Mandatory
Quest Property DLC04MS02 Auto Const Mandatory

Function GiveSpacesuit()
	if (Spacesuits_InHoldingContainer.GetCount() > 0)
		ObjectReference suit = Spacesuits_InHoldingContainer.GetAt(0)
		Spacesuits_InHoldingContainer.RemoveRef(suit)
		player.AddItem(suit)

		ObjectReference helmet = SpacesuitHelmets_InHoldingContainer.GetAt(0)
		SpacesuitHelmets_InHoldingContainer.RemoveRef(helmet)
		player.AddItem(helmet)

		if (Spacesuits_InHoldingContainer.GetCount() == 0)
			Debug.Trace("Stage Set!")
			SetStage(CONST_StageToSetQuestSpacesuitsCollected)
		EndIf
	Else
		player.AddItem(DLC04_Armor_Spacesuit)
		player.AddItem(DLC04_Armor_Spacesuit_Helmet)
	Endif
	
	if DLC04MS02.GetStage() == 300
		DLC04MS02.ModObjectiveGlobal(1.0, DLC04MS02_Spacesuit_Count, 300, 5, true, true)
		if DLC04MS02_Spacesuit_Count.GetValue() >= 5.0
			DLC04MS02.SetStage(400)
		endif
	else
		DLC04MS02_Spacesuit_Count.SetValue(DLC04MS02_Spacesuit_Count.GetValue() + 1.0)
	endif
EndFunction

