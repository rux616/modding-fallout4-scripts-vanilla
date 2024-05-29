;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC02:Fragments:Quests:QF_DLC02WorkshopTameOff_0100084C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC02:DLC02WorkshopTameOffScript
Quest __temp = self as Quest
DLC02:DLC02WorkshopTameOffScript kmyQuest = __temp as DLC02:DLC02WorkshopTameOffScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " Startup")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_WorkshopNPCs Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

workshopparentscript Property WorkshopParent Auto Const

ActorValue Property WorkshopBellDistance Auto Const

ReferenceAlias Property Alias_Bell Auto Const
