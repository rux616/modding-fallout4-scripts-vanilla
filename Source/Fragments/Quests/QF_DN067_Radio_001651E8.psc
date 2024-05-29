;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN067_Radio_001651E8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
(DNMasterQuest as RadioFailsafeScript).RemoveScene(DN067_RadioLoop)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DNMasterQuest Auto Const Mandatory

Scene Property DN067_RadioLoop Auto Const Mandatory
