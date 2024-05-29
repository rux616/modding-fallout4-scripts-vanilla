;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04DrinkingBuddy_0101738E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04DrinkingBuddyScript
Quest __temp = self as Quest
DLC04:DLC04DrinkingBuddyScript kmyQuest = __temp as DLC04:DLC04DrinkingBuddyScript
;END AUTOCAST
;BEGIN CODE
;Uncomment the below once recipes have been added.

kMyQuest.AddNewRecipes()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
