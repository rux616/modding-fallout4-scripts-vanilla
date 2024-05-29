;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03AcadiaM03_0104B216 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03AcadiaM03QuestScript
DLC03:DLC03AcadiaM03QuestScript kmyQuest = GetOwningQuest() as DLC03:DLC03AcadiaM03QuestScript
;END AUTOCAST
;BEGIN CODE
DLC03AcadiaM03Reward.SetValue(200)
kmyquest.ChallengeTrack+=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC03AcadiaM03Reward Auto Const Mandatory
