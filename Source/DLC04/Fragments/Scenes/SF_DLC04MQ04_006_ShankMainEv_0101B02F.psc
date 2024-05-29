;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ04_006_ShankMainEv_0101B02F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
Quest myQuest = GetOwningQuest()
myQuest.SetStage(270)
myQuest.SetObjectiveCompleted(250)
myQUest.SetObjectiveDisplayed(270)
kmyQuest.InitializeHappinessObjective()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
