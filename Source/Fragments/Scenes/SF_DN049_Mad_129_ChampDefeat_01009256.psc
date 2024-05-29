;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN049_Mad_129_ChampDefeat_01009256 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
Actor Mad_ChampActor = Mad_Champ.GetActorRef()
QSTBoxingRingBell.Play(Mad_ChampActor)
Utility.Wait(0.75)
QSTBoxingRingBell.Play(Mad_ChampActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTBoxingRingBell Auto Const

ReferenceAlias Property Mad_Champ Auto Const
