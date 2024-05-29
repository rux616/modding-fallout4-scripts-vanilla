;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:TopicInfos:TIF_DLC01MQ02_0100A14B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; complete MQ02, start MQ03:
GetOwningQuest().SetStage(700)
; also try to start MQ03 radiant
DLC01MQ03.StartRadiantQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC01:DLC01MQ03Script Property DLC01MQ03 Auto Const Mandatory
