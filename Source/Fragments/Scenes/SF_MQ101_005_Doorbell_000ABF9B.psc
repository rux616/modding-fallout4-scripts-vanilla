;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_005_Doorbell_000ABF9B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
pQSTCharGenDoorbellRing.Play(PlayerHouseDoor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

sound Property pQSTChargenDoorbellRing Auto Const

ReferenceAlias Property PlayerHouseDoor Auto Const
