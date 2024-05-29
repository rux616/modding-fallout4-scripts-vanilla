;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RadioDiamondCity_0001FA58 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE RadioDiamondCityQuestScript
Quest __temp = self as Quest
RadioDiamondCityQuestScript kmyQuest = __temp as RadioDiamondCityQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartRadioTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN AUTOCAST TYPE RadioDiamondCityQuestScript
Quest __temp = self as Quest
RadioDiamondCityQuestScript kmyQuest = __temp as RadioDiamondCityQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SongCount=3
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
