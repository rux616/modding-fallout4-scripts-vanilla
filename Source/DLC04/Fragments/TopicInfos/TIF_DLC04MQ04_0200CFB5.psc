;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04MQ04_0200CFB5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04QuestScript
DLC04:DLC04MQ04QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.iPlayerGangChoice = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
