;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MQ207_001999DB Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MQ206QuestScript
MQ206QuestScript kmyQuest = GetOwningQuest() as MQ206QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShaunDontBelieveStarted=2
kmyquest.ShaunConvProgress=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
