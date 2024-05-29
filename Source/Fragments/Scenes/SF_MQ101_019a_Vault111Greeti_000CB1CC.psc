;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_019a_Vault111Greeti_000CB1CC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN AUTOCAST TYPE mq101questscript
mq101questscript kmyQuest = GetOwningQuest() as mq101questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.SuitTakersSwitchNeutral()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ101_019a_Vault111Greeting02 Auto Const
