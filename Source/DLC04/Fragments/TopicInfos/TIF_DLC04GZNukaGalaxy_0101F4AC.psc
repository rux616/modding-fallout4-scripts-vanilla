;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04GZNukaGalaxy_0101F4AC Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC04GZNukaGalaxyTransmitterRef_PA03.SetValue(DLC04GZNukaGalaxySceneStage, 3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property DLC04GZNukaGalaxySceneStage Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxyTransmitterRef_PA01 Auto Const Mandatory

ObjectReference Property DLC04GZNukaGalaxyTransmitterRef_PA03 Auto Const Mandatory
