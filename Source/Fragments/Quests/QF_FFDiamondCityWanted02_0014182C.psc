;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCityWanted02_0014182C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCityWantedScript
Quest __temp = self as Quest
FFDiamondCityWantedScript kmyQuest = __temp as FFDiamondCityWantedScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartupFunction()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCityWantedScript
Quest __temp = self as Quest
FFDiamondCityWantedScript kmyQuest = __temp as FFDiamondCityWantedScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ActivatedBoardFunction()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCityWantedScript
Quest __temp = self as Quest
FFDiamondCityWantedScript kmyQuest = __temp as FFDiamondCityWantedScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ActivatedDugoutBoardFunction()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCityWantedScript
Quest __temp = self as Quest
FFDiamondCityWantedScript kmyQuest = __temp as FFDiamondCityWantedScript
;END AUTOCAST
;BEGIN CODE
kmyquest.NoteReadFunction()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCityWantedScript
Quest __temp = self as Quest
FFDiamondCityWantedScript kmyQuest = __temp as FFDiamondCityWantedScript
;END AUTOCAST
;BEGIN CODE
kmyquest.QuestCompleteFunction()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
