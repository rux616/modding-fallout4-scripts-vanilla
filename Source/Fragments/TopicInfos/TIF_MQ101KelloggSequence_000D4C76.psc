;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MQ101KelloggSequence_000D4C76 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE mq101kelloggsequencescript
mq101kelloggsequencescript kmyQuest = GetOwningQuest() as mq101kelloggsequencescript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowKelloggName()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
