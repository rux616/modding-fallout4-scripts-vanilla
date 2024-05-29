;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ02DisciplesScene_0101D0AC_1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_13_End
Function Fragment_Phase_13_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ02QuestScript
DLC04:DLC04MQ02QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.TalkedToDisciples=True
if DLC04MQ02.GetStageDone(100) && DLC04MQ02.GetStageDone(200)==False
DLC04MQ02.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04MQ02 Auto Const Mandatory
