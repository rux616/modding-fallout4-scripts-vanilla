;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ02DisciplesScene01_0101D0AC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_14_End
Function Fragment_Phase_14_End()
;BEGIN CODE
DLC04_RQ_KillRivalBoss.SetStage(0)
DLC04_RQ_KillRivalBoss_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC04_RQ_KillRivalBoss_Intro Auto Const Mandatory

Quest Property DLC04_RQ_KillRivalBoss Auto Const Mandatory
