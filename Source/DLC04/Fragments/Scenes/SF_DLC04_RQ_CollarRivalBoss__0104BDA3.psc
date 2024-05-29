;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04_RQ_CollarRivalBoss__0104BDA3 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_QuestScript
DLC04:DLC04_RQ_QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04_RQ_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetQuestGiverData()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
