;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04PowerTracker_0103C5A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DLC04PowerFeedback.SetValue(1)
if DLC04PlayerKickedOut.GetValue() == 1
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DLC04MQ05DoorRef.SetLockLevel(0)
DLC04MQ05DoorRef.Unlock()
if DLC04PowerFeedback.GetValue() == 0
;Don't do anything - feedback hasn't been tripped yet
elseif DLC04PowerFeedback.GetValue() == 1
SetObjectiveDisplayed(10,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Do same stuff here as in DLC04MQ05 Stage 120
SetObjectiveCompleted(10,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04MQ05 Auto Const Mandatory

GlobalVariable Property DLC04PlayerKickedOut Auto Const Mandatory

GlobalVariable Property DLC04PowerFeedback Auto Const Mandatory

ObjectReference Property DLC04MQ05DoorRef Auto Const Mandatory
