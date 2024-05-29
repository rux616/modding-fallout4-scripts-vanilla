;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03_V118_Quest_020390A4 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_QuestScript
DLC03:DLC03_V118_QuestScript kmyQuest = GetOwningQuest() as DLC03:DLC03_V118_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetClueTrackerStage(104)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
