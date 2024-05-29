;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS16_000C8825 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MS16QuestScript
MS16QuestScript kmyQuest = GetOwningQuest() as MS16QuestScript
;END AUTOCAST
;BEGIN CODE
getOwningQuest().setstage(55)
kmyquest.SetObjectiveCompleted(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
