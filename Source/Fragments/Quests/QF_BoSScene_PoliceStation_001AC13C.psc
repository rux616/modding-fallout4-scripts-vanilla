;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSScene_PoliceStation_001AC13C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Enable scene trigger
Alias_SceneTrigger.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
if !BosKickout.GetStageDone(20) && !BosKickout.GetStageDone(30) && !BoS202.GetStageDone(255)
  BoSScene_PoliceStation_001.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;If the player hasn't triggered the prereq stage for the quest, trigger it now.

if !Alias_SceneTrigger.GetRef().IsDisabled()
  Alias_SceneTrigger.GetRef().Disable()
endif

if !GetStageDone(10)
  SetStage(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_PASoldier.GetRef().Disable()
Alias_FieldScribe.GetRef().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_PASoldier.GetRef().Disable()
Alias_FieldScribe.GetRef().Disable()
Alias_SceneTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_FieldScribe Auto Const

ReferenceAlias Property Alias_PASoldier Auto Const

Scene Property BoSScene_PoliceStation_001 Auto Const

ReferenceAlias Property Alias_SceneTrigger Auto Const Mandatory

LocationAlias Property Alias_CambridgePDLocation Auto Const Mandatory

Quest Property BoSKickOut Auto Const

Quest Property BoS202 Auto Const
