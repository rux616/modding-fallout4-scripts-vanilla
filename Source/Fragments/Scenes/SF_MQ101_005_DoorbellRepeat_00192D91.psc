;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_005_DoorbellRepeat_00192D91 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
QSTCharGenDoorbellRing.Play(PlayerHouseDoor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

sound Property QSTChargenDoorbellRing Auto Const

ReferenceAlias Property PlayerHouseDoor Auto Const
