Scriptname DLC04:DLC04MQ03QuestScript extends Quest

Int TotalFlagCount
;Quest Property DLC04_WW02 Auto Const Mandatory
Quest Property DLC04GZMainQuest Auto Const Mandatory
Quest Property DLC04_KiddieKingdomMain Auto Const Mandatory
Quest Property DLC04_BottlingPlantMain Auto Const Mandatory
Quest Property DLC04SafariAdventureQuest Auto Const Mandatory
Quest Property DLC04MQ03 Auto Const Mandatory

Function FlagCount()

	TotalFlagCount += 1

	;Currently, the flag count is (5) - this is where it should be adjusted if a section is cut
	If TotalFlagCount >= 5
		SetStage(600)
	EndIf

EndFunction

;This will pre-check if any zone has already been "completed" and is ready for the flag when DLC04MQ03 launches
Function PreCheck()

	If DLC04GZMainQuest.GetStageDone(1000) == 1 && DLC04MQ03.GetStageDone(100) == 0
		DLC04MQ03.SetStage(100)
	EndIf

	;If DLC04_WW02.GetStageDone(1000) == 1 && DLC04MQ03.GetStageDone(200) == 0
	;	DLC04MQ03.SetStage(200)
	;EndIf

	If DLC04_KiddieKingdomMain.GetStageDone(1000) == 1 && DLC04MQ03.GetStageDone(300) == 0
		DLC04MQ03.SetStage(300)
	EndIf		

	If DLC04SafariAdventureQuest.GetStageDone(1000) == 1 && DLC04MQ03.GetStageDone(400) == 0
		DLC04MQ03.SetStage(400)
	EndIf

	If DLC04_BottlingPlantMain.GetStageDone(1000) == 1 && DLC04MQ03.GetStageDone(500) == 0
		DLC04MQ03.SetStage(500)
	EndIf

EndFunction