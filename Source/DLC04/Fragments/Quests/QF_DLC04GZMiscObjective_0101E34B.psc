;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04GZMiscObjective_0101E34B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;The objective we display depends on whether the player has been repairing Star Control or not.
int starCoresInstalled = DLC04GZ_StarCoresInstalled.GetValueInt()
int starCoresTotal = DLC04GZ_StarCoresTotal.GetValueInt()

if (starCoresInstalled == starCoresTotal)
     SetStage(100)
ElseIf (starCoresInstalled > 0)
     SetObjectiveDisplayed(11)
Else
     SetObjectiveDisplayed(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set by the quest script once all Star Cores have been installed.

;Complete the install objective (whichever one was active).
SetObjectiveCompleted(10)
SetObjectiveCompleted(11)

;Direct the player to unlock the display case so they can get the armor.
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Clean up and shut down.
CompleteAllObjectives()
CompleteQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC04GZ_StarCoresInstalled Auto Const Mandatory

GlobalVariable Property DLC04GZ_StarCoresTotal Auto Const Mandatory
