;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04DryRockGulch_10_Shoo_010445FE Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
DLC04:DLC04_DRG_QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartShootOut()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
DLC04:DLC04_DRG_QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StopShootOut()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
DLC04_DRG_ShootoutValid.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
DLC04:DLC04_DRG_QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StopShootOut()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC04_DRG_ShootoutValid Auto Const Mandatory
