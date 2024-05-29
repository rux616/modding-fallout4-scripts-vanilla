;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RETravelKMK10_0018607D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE rescript
Quest __temp = self as Quest
rescript kmyQuest = __temp as rescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Startup()
; randomly enable some of the supes
float time = GameHour.GetValue()
int enableChance = 50
; enable more at night
if time > 20 || time < 6
	enableChance = 75
endif
kmyquest.REParent.RandomlyEnableOrKillCollection(Alias_SuperMutants, enableChance, 0, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_SuperMutants Auto Const

GlobalVariable Property GameHour Auto Const
