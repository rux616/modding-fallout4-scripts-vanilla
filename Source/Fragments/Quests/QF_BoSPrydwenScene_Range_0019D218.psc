;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSPrydwenScene_Range_0019D218 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE BoSRangeSceneScript
Quest __temp = self as Quest
BoSRangeSceneScript kmyQuest = __temp as BoSRangeSceneScript
;END AUTOCAST
;BEGIN CODE
;Enable scene trigger 
Alias_SceneTrigger.GetRef().Enable()

;Activate scene timer
kmyquest.SetRangeSceneTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Check to make sure everyone's got weapons before starting scene
if Alias_RangeSoldier01.GetRef().GetItemCount(ObjectTypeWeapon) > 0 && Alias_RangeSoldier02.GetRef().GetItemCount(ObjectTypeWeapon) > 0 && Alias_RangeSoldier03.GetRef().GetItemCount(ObjectTypeWeapon) > 0
  BoSPrydwenScene_Range_001.Start()  
else
  setstage(90)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_RangeSoldier03.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_RangeSoldier01.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_RangeSoldier02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Disable scene trigger 
Alias_SceneTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AirportSoldier01 Auto Const

ReferenceAlias Property Alias_AirportSoldier02 Auto Const

ReferenceAlias Property Alias_RangeSoldier03 Auto Const

ReferenceAlias Property Alias_RangeSoldier01 Auto Const

ReferenceAlias Property Alias_RangeSoldier02 Auto Const

Scene Property BoSPrydwenScene_Range_001 Auto Const

ReferenceAlias Property Alias_SceneTrigger Auto Const Mandatory

Keyword Property ObjectTypeWeapon Auto Const
