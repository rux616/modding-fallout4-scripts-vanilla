;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQ00_01000805 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01MQ00Script
Quest __temp = self as Quest
DLC01:DLC01MQ00Script kmyQuest = __temp as DLC01:DLC01MQ00Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "Startup")
kmyQuest.Startup()

; Make it so the Tesla Rifle scraps into something (plastic)
pmodScrapRecipe_NullMelee_Plastic.AddForm(pDLC01LightningGun)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC01:DLC01MQ00Script
Quest __temp = self as Quest
DLC01:DLC01MQ00Script kmyQuest = __temp as DLC01:DLC01MQ00Script
;END AUTOCAST
;BEGIN CODE
;Starts up first official quest in DLC01.
DLC01MQ01.Start()

; don't need to track player anymore
kmyQuest.UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC01MQ01 Auto Const Mandatory

Weapon Property pDLC01LightningGun Auto Const Mandatory

FormList Property pmodScrapRecipe_NullMelee_Plastic Auto Const Mandatory
