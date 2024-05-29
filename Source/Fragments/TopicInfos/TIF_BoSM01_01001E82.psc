;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoSM01_01001E82 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE BoSM01QuestScript
BoSM01QuestScript kmyQuest = GetOwningQuest() as BoSM01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetStage(68)
kmyQuest.CheckMidquestEventReporting()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
