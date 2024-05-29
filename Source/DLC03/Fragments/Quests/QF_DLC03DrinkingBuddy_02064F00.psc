;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03DrinkingBuddy_02064F00 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DrinkingBuddyScript
Quest __temp = self as Quest
DLC03:DLC03DrinkingBuddyScript kmyQuest = __temp as DLC03:DLC03DrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.AddNewRecipes()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
