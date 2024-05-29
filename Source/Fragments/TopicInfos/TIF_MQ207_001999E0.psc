;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MQ207_001999E0 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE mq206questscript
mq206questscript kmyQuest = GetOwningQuest() as mq206questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShaunDontBelieveStarted=2
kmyquest.ShaunConvProgress=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
