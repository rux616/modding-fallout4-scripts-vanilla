;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04GZVaultTec_06_Hydrop_0102960A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
DLC04GZVaultTec_AromaticsTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZVaultTecQuestScript
DLC04:DLC04GZVaultTecQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04GZVaultTecQuestScript
;END AUTOCAST
;BEGIN CODE
DLC04GZVaultTec_AromaticsTrigger.Disable()
kMyQuest.SetSceneTimestamp(6)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04GZVaultTec_AromaticsTrigger Auto Const Mandatory
