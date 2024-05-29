;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MQ302Min_001867BF Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MQ302MinQuestScript
MQ302MinQuestScript kmyQuest = GetOwningQuest() as MQ302MinQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SturgesChoiceMade=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
