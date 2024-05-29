;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_004_ShaunCries_000AA772 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN AUTOCAST TYPE mq101questscript
mq101questscript kmyQuest = GetOwningQuest() as mq101questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.BabyCry()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE mq101questscript
mq101questscript kmyQuest = GetOwningQuest() as mq101questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.BabyGiggle()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property BabyActivator Auto Const
