;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:TopicInfos:TIF_DLC01DialoguePostQuest_0100B277 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC01MQPostQuestRadiantParent.SetStage(10)
DLC01MQPostQuestRadiantParent.StartRadiantQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC01:DLC01MQ03Script Property DLC01MQPostQuestRadiantParent Auto Const Mandatory
