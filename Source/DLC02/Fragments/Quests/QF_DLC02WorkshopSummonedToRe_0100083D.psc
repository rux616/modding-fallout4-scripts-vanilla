;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC02:Fragments:Quests:QF_DLC02WorkshopSummonedToRe_0100083D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC02:DLC02WorkshopSummonedToRelaxScript
Quest __temp = self as Quest
DLC02:DLC02WorkshopSummonedToRelaxScript kmyQuest = __temp as DLC02:DLC02WorkshopSummonedToRelaxScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

workshopparentscript Property WorkshopParent Auto Const

ActorValue Property WorkshopBellDistance Auto Const

ReferenceAlias Property Alias_Bell Auto Const
