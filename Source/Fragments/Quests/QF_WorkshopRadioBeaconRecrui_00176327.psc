;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_WorkshopRadioBeaconRecrui_00176327 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE WorkshopRadioBeaconRecruitScript
Quest __temp = self as Quest
WorkshopRadioBeaconRecruitScript kmyQuest = __temp as WorkshopRadioBeaconRecruitScript
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
