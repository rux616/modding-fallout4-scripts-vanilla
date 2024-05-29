;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13Thugs_000838AD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Startup()
; enable 2-4 of them
Alias_Thugs.GetAt(0).enable()
Alias_Thugs.GetAt(1).enable()
if utility.RandomInt() < 30
	Alias_Thugs.GetAt(3).enable()
else
	Alias_Thugs.GetActorAt(3).KillSilent()
endif
if utility.RandomInt() < 25
	Alias_Thugs.GetAt(4).enable()
else
	Alias_Thugs.GetActorAt(4).KillSilent()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; set flag after player first fights Malcolm's thugs
if Alias_myLocation.GetLocation() == DiamondCityLocation
	MS13NelsonDies.ThugsAttackPlayer = true
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LocationAlias Property Alias_myLocation Auto Const

Location Property DiamondCityLocation Auto Const

MS13NelsonDiesScript Property MS13NelsonDies Auto Const

Location Property GoodneighborLocation Auto Const

RefCollectionAlias Property Alias_Thugs Auto Const
