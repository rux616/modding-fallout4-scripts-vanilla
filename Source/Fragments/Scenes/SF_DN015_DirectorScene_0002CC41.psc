;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN015_DirectorScene_0002CC41 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE DN015QuestScript
DN015QuestScript kmyQuest = GetOwningQuest() as DN015QuestScript
;END AUTOCAST
;BEGIN CODE
getOwningQuest().setStage(250)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
