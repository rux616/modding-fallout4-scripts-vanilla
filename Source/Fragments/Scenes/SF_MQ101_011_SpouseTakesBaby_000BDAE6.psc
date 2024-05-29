;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_011_SpouseTakesBaby_000BDAE6 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE mq101questscript
mq101questscript kmyQuest = GetOwningQuest() as mq101questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.BabyGiggle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
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
