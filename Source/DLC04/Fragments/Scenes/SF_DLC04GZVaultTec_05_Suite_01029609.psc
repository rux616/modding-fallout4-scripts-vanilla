;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04GZVaultTec_05_Suite_01029609 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZVaultTecQuestScript
DLC04:DLC04GZVaultTecQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04GZVaultTecQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetSceneTimestamp(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
