;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MQ302BoS_001CF4B7 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MQ302BoSQuestScript
MQ302BoSQuestScript kmyQuest = GetOwningQuest() as MQ302BoSQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.IngramChoiceMade=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
