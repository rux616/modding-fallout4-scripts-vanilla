;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04GZTrackingQuest_0101E34C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZTrackingQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZTrackingQuestScript kmyQuest = __temp as DLC04:DLC04GZTrackingQuestScript
;END AUTOCAST
;BEGIN CODE
;DEBUG: Give the player all of the Star Cores.
int i = 0
While (Alias_StarCores_InHoldingContainer.GetCount() > 0)
     kMyQuest.AddCoreToPlayer()
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZTrackingQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZTrackingQuestScript kmyQuest = __temp as DLC04:DLC04GZTrackingQuestScript
;END AUTOCAST
;BEGIN CODE
;On startup, spawn the Star Core misc items. These all start out in a holding container.
kMyQuest.SpawnStarCores()

;Set up the Star Core RefCollectionAliases.
kMyQuest.SetupStarCoreCollections()

;On startup, set up the Spacesuit quest items.
kMyQuest.SetupSpacesuits()

;On startup, initialize text replacement for the Star Control terminal.
kMyQuest.StarControl_UpdateTextReplacementData()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Remove the Spacesuits from the aliases that make them quest items.
Alias_Spacesuits_All.RemoveAll()
Alias_SpacesuitHelmets_All.RemoveAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Make the Starport Nuka elevator functional.
DLC04StarportNukaElevatorMaster.MakeElevatorFunctional()

;Notify the Galactic Zone subquests that power has been restored. (The ones that care, anyway.)
DLC04GZNukaGalaxy.SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_StarCores_InHoldingContainer Auto Const Mandatory

Quest Property DLC04GZNukaGalaxy Auto Const Mandatory

Quest Property DLC04GZMainQuest Auto Const Mandatory

Location Property DLC04GalacticZone_NukaGalaxyLocation Auto Const Mandatory

Cell Property DLC04GZNukaGalaxy01 Auto Const Mandatory

elevatormasterscript Property DLC04StarportNukaElevatorMaster Auto Const Mandatory

DLC04:DLC04GZTrackingQuestStarCoreCollection Property Alias_GalacticZoneExteriorCores Auto Const Mandatory

DLC04:DLC04GZTrackingQuestStarCoreCollection Property Alias_GalacticZoneNukaGalaxyCores Auto Const Mandatory

DLC04:DLC04GZTrackingQuestStarCoreCollection Property Alias_GalacticZoneVaultTecCores Auto Const Mandatory

DLC04:DLC04GZTrackingQuestStarCoreCollection Property Alias_GalacticZoneTheaterCores Auto Const Mandatory

DLC04:DLC04GZTrackingQuestStarCoreCollection Property Alias_GalacticZoneBattlezoneCores Auto Const Mandatory

DLC04:DLC04GZTrackingQuestStarCoreCollection Property Alias_GalacticZoneOutsideCores Auto Const Mandatory

Quest Property DLC04GZBattlezone Auto Const Mandatory

ObjectReference Property DLC04GZCampGate Auto Const Mandatory

RefCollectionAlias Property Alias_Spacesuits_All Auto Const Mandatory

RefCollectionAlias Property Alias_SpacesuitHelmets_All Auto Const Mandatory
