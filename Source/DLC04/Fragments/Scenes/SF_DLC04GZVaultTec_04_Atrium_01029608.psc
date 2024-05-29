;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04GZVaultTec_04_Atrium_01029608 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
DLC04GZVaultTec_AtriumDoor.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZVaultTecQuestScript
DLC04:DLC04GZVaultTecQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04GZVaultTecQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetSceneTimestamp(4)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04GZVaultTec_AtriumDoor Auto Const Mandatory
