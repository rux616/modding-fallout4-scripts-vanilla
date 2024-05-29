;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinDestBoSArtillery_00095436 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MinDestBoSArtilleryScript
Quest __temp = self as Quest
MinDestBoSArtilleryScript kmyQuest = __temp as MinDestBoSArtilleryScript
;END AUTOCAST
;BEGIN CODE
; turn guns towards Prydwen
kmyQuest.FireAtPrydwen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MinDestBoSArtilleryScript
Quest __temp = self as Quest
MinDestBoSArtilleryScript kmyQuest = __temp as MinDestBoSArtilleryScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FireAtPrydwen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MinDestBoS.SetStage(450)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MinDestBoS Auto Const
