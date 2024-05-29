;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DaraDoAlignment_0102E811 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04DialogueHubologistsScript
DLC04:DLC04DialogueHubologistsScript kmyQuest = GetOwningQuest() as DLC04:DLC04DialogueHubologistsScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Unfreeze()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
