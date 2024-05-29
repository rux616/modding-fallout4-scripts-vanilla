;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueCodsworthPostWar_000A1803 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pMQ03.SetStage(30)
p004_CodsworthPatrolHumming.Start()
(GetOwningQuest() as DialogueCodsworthPostWarScript).CodsworthPatrol = 1
akspeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMQ03 Auto Const

Scene Property p004_CodsworthPatrolHumming Auto Const
