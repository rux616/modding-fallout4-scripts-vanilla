;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04MS03_0102EB5F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
UpstairsHallwayScene.Stop()
(DLC04_GMMGrenades01 as TrapGrenadeBouquet).LocalFireTrap()
(DLC04_GMMGrenades02 as TrapGrenadeBouquet).LocalFireTrap()
(DLC04_GMMGrenades03 as TrapGrenadeBouquet).LocalFireTrap()
(DLC04_GMMGrenades04 as TrapGrenadeBouquet).LocalFireTrap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04_GMMGrenades01 Auto Const Mandatory

ObjectReference Property DLC04_GMMGrenades02 Auto Const Mandatory

ObjectReference Property DLC04_GMMGrenades03 Auto Const Mandatory

ObjectReference Property DLC04_GMMGrenades04 Auto Const Mandatory

Scene Property UpstairsHallwayScene Auto Const Mandatory
