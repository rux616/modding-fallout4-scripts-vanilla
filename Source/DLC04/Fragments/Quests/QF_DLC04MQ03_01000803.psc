;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ03_01000803 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(10)
Game.GetPlayer().MoveTo(DLC04MQ03Start)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
if GetStageDone(10) == 0
SetStage(10)
endif
SetStage(100)
Game.GetPlayer().MoveTo(DLC04GZFlagPoleMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
if GetStageDone(10) == 0
SetStage(10)
endif
SetStage(200)
Game.GetPlayer().MoveTo(DLC04DRGFlagPoleMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
if GetStageDone(10) == 0
SetStage(10)
endif
SetStage(300)
Game.GetPlayer().MoveTo(DLC04KKFlagPoleMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
if GetStageDone(10) == 0
SetStage(10)
endif
SetStage(400)
Game.GetPlayer().MoveTo(DLC04SAFlagPoleMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
if GetStageDone(10) == 0
SetStage(10)
endif
SetStage(500)
Game.GetPlayer().MoveTo(DLC04BPFlagPoleMarkerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;If the quest for each zone has already been completed
;	Pop the objective to assign it to a gang
;If it has not been completed, objective to claim the zone
;	This to handle if the player immediately leaves Nukatown and goes to the zones


if DLC04GZMainQuest.IsCompleted()
	SetStage(100)
	SetObjectiveDisplayed(20,1)
Else
	SetObjectiveDisplayed(10,1)
Endif

if DLC04DryRockGulch.IsCompleted()
	SetStage(200)
	SetObjectiveDisplayed(40,1)
else
	SetObjectiveDisplayed(30,1)
endif

if DLC04_KiddieKingdomMain.IsCompleted()
	SetStage(300)
	SetObjectiveDisplayed(60,1)
Else
	SetObjectiveDisplayed(50,1)
endif

if DLC04SafariAdventureQuest.IsCompleted()
	SetStage(400)
	SetObjectiveDisplayed(80,1)
else
	SetObjectiveDisplayed(70,1)
endif

if DLC04_BottlingPlantMain.IsCompleted()
	SetStage(500)
	SetObjectiveDisplayed(100,1)
Else
	SetObjectiveDisplayed(90,1)
Endif


DLC04DryRockGulchMapMarkerRef.AddToMap()
DLC04SafariAdventureMapMarkerRef.AddToMap()
DLC04KiddieKingdomMapMarkerRef.AddToMap()
DLC04GalacticZoneMapMarkerRef.AddToMap()
DLC04BottlingPlantMapMarkerRef.AddToMap()
DLC04ParkPopulationHandler.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;This stage is set to trigger a change in the objective marker
;DO NOT DELETE THIS STAGE

;Commented out on purpose
;SetObjectiveCompleted(10,1)
;SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ03QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ03QuestScript kmyQuest = __temp as DLC04:DLC04MQ03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FlagCount()
if IsObjectiveDisplayed(20)
	SetObjectiveCompleted(20,1)
elseif IsObjectiveDisplayed(10)
	SetObjectiveCompleted(10,1)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;This stage is set to trigger a change in the objective marker
;DO NOT DELETE THIS STAGE

;Commented out on purpose
;SetObjectiveCompleted(30,1)
;SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ03QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ03QuestScript kmyQuest = __temp as DLC04:DLC04MQ03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FlagCount()
If IsObjectiveDisplayed(40)
	SetObjectiveCompleted(40,1)
elseif IsObjectiveDisplayed(30)
	SetObjectiveCompleted(30,1)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;This stage is set to trigger a change in the objective marker
;DO NOT DELETE THIS STAGE

;Commented out on purpose
;SetObjectiveCompleted(50,1)
;SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ03QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ03QuestScript kmyQuest = __temp as DLC04:DLC04MQ03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FlagCount()
If IsObjectiveDisplayed(60)
	SetObjectiveCompleted(60,1)
elseif IsObjectiveDisplayed(50)
	SetObjectiveCompleted(50,1)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;This stage is set to trigger a change in the objective marker
;DO NOT DELETE THIS STAGE

;Commented out on purpose
;SetObjectiveCompleted(70,1)
;SetObjectiveDisplayed(80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ03QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ03QuestScript kmyQuest = __temp as DLC04:DLC04MQ03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FlagCount()
If IsObjectiveDisplayed(80)
	SetObjectiveCompleted(80,1)
elseif IsObjectiveDisplayed(70)
	SetObjectiveCompleted(70,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;This stage is set to trigger a change in the objective marker
;DO NOT DELETE THIS STAGE

;Commented out on purpose
;SetObjectiveCompleted(90,1)
;SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ03QuestScript
Quest __temp = self as Quest
DLC04:DLC04MQ03QuestScript kmyQuest = __temp as DLC04:DLC04MQ03QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FlagCount()
If isObjectiveDisplayed(100)
	SetObjectiveCompleted(100,1)
elseif IsObjectiveDisplayed(90)
	SetObjectiveCompleted(90,1)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0655_Item_00
Function Fragment_Stage_0655_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110,1)
Game.AddAchievement(82)
DLC04MQ04.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04MQ04 Auto Const Mandatory

ObjectReference Property DLC04MQ03Start Auto Const Mandatory

ObjectReference Property DLC04SafariAdventureMapMarkerRef Auto Const Mandatory

ObjectReference Property DLC04KiddieKingdomMapMarkerRef Auto Const Mandatory

ObjectReference Property DLC04GalacticZoneMapMarkerRef Auto Const Mandatory

ObjectReference Property DLC04BottlingPlantMapMarkerRef Auto Const Mandatory

ObjectReference Property DLC04DryRockGulchMapMarkerRef Auto Const Mandatory

Quest Property DLC04ParkPopulationHandler Auto Const Mandatory

ObjectReference Property DLC04GZFlagPoleMarkerRef Auto Const Mandatory

ObjectReference Property DLC04BPFlagPoleMarkerRef Auto Const Mandatory

ObjectReference Property DLC04DRGFlagPoleMarkerRef Auto Const Mandatory

ObjectReference Property DLC04KKFlagPoleMarkerRef Auto Const Mandatory

ObjectReference Property DLC04SAFlagPoleMarkerRef Auto Const Mandatory

Quest Property DLC04_KiddieKingdomMain Auto Const Mandatory

Quest Property DLC04_BottlingPlantMAIN Auto Const Mandatory

Quest Property DLC04DryRockGulch Auto Const Mandatory

Quest Property DLC04GZMainQuest Auto Const Mandatory

Quest Property DLC04SafariAdventureQuest Auto Const Mandatory
