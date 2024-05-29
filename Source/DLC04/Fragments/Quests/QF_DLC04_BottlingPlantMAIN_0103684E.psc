;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04_BottlingPlantMAIN_0103684E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04BottlingPlantMainScript
Quest __temp = self as Quest
DLC04:DLC04BottlingPlantMainScript kmyQuest = __temp as DLC04:DLC04BottlingPlantMainScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(170)
	SetObjectiveCompleted(10)
	SetStage(180)
endif

kmyQuest.CheckForZoneCleared()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04BottlingPlantMainScript
Quest __temp = self as Quest
DLC04:DLC04BottlingPlantMainScript kmyQuest = __temp as DLC04:DLC04BottlingPlantMainScript
;END AUTOCAST
;BEGIN CODE
If GetStageDone(120)
	SetObjectiveCompleted(10)
	SetStage(180)
Endif

kmyQuest.CheckForZoneCleared()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04BottlingPlantMainScript
Quest __temp = self as Quest
DLC04:DLC04BottlingPlantMainScript kmyQuest = __temp as DLC04:DLC04BottlingPlantMainScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)

kmyQuest.CheckForZoneCleared()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
DLC04_BottlingPlantReleaseQueen.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04BottlingPlantMainScript
Quest __temp = self as Quest
DLC04:DLC04BottlingPlantMainScript kmyQuest = __temp as DLC04:DLC04BottlingPlantMainScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30)

kmyQuest.CheckForZoneCleared()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;If MQ03 was running, the zone is now secured. Allow the player to raise the flag.
if (pDLC04MQ03.IsRunning()) && DLC04PlayerKickedOut.getValue() == 0
	pDLC04MQ03.SetStage(500)

	;Set objective stage to raise the flag
	SetStage(1100)

Else 	;If MQ03 is NOT running, this quest is now complete
	SetStage(2000)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04BottlingPlantMainScript
Quest __temp = self as Quest
DLC04:DLC04BottlingPlantMainScript kmyQuest = __temp as DLC04:DLC04BottlingPlantMainScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(1000)
kmyQuest.ListenForFlagRaise()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveFailed(1000)
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
CompleteQuest()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property PDLC04MQ03 Auto Const Mandatory

Scene Property DLC04_BottlingPlantReleaseQueen Auto Const Mandatory

GlobalVariable Property DLC04PlayerKickedOut Auto Const Mandatory
