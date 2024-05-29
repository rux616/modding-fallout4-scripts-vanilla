;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04MS03_0102EB71 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC04MS03_SeanceDoor_Ref.activate(Game.GetPlayer())
DLC04MS03_SeanceDoor_Ref.Lock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04_GMMCandle01 Auto Const Mandatory

ObjectReference Property DLC04MS03_SeanceDoor_Ref Auto Const Mandatory
