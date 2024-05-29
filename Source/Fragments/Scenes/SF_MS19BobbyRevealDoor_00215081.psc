;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS19BobbyRevealDoor_00215081 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
V81_BobbyDeLuca.PlayIdle(IdleKickDoor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
MS19secretDoor.PlayAnimation("Play01")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property V81_BobbyDeLuca Auto Const

Idle Property IdleKickDoor Auto Const

ObjectReference Property MS19SecretDoor Auto Const
