;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ201a_002_NickScene01_00066A2B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE MQ201QuestScript
MQ201QuestScript kmyQuest = GetOwningQuest() as MQ201QuestScript
;END AUTOCAST
;BEGIN CODE
GetOwningQuest().SetStage(25)
kmyquest.PlayerNoFightSceneStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE MQ201QuestScript
MQ201QuestScript kmyQuest = GetOwningQuest() as MQ201QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayerNoFightSceneEnd()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
