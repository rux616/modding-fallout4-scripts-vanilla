;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04Holotapes_0101110B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Return to NIRA's inisital dialogue scene at phase 9

DLC04DialogueSettlement.SetStage(45)
DLC04DialogueSettlement_NIRAQuestionHub.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC04DialogueSettlement_NIRAFirstScene Auto Const Mandatory

Scene Property DLC04DialogueSettlement_NIRAQuestionHub Auto Const Mandatory

Quest Property DLC04DialogueSettlement Auto Const Mandatory
