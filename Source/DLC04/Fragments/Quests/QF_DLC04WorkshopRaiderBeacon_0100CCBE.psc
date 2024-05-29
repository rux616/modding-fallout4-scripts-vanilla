;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04WorkshopRaiderBeacon_0100CCBE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:WorkshopRaiderBeaconRecruitScript
Quest __temp = self as Quest
DLC04:WorkshopRaiderBeaconRecruitScript kmyQuest = __temp as DLC04:WorkshopRaiderBeaconRecruitScript
;END AUTOCAST
;BEGIN CODE
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
