;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_WorkshopRecruitVaultTec_0010C957 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE workshopparentscript
workshopparentscript kmyQuest = GetOwningQuest() as workshopparentscript
;END AUTOCAST
;BEGIN CODE
; clear alias
kmyQuest.AddToWorkshopRecruitAlias(NONE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE workshopparentscript
workshopparentscript kmyQuest = GetOwningQuest() as workshopparentscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddPermanentActorToWorkshopPlayerChoice(WorkshopRecruitVaultTec.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
(WorkshopRecruitVaultTec.GetActorRef() as WorkshopNPCScript).SetWorkshopStatus(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property WorkshopRecruitVaultTec Auto Const
