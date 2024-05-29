;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF__02006740 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartCountdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartCountdown()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_Stands_Group1 Auto Const Mandatory

RefCollectionAlias Property Alias_Stands_Group2 Auto Const Mandatory

RefCollectionAlias Property Alias_Stands_Group3 Auto Const Mandatory

RefCollectionAlias Property Alias_Stands_Group4 Auto Const Mandatory

RefCollectionAlias Property Alias_Stands_Group5 Auto Const Mandatory
