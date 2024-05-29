;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MinRecruit07_0114280E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MinRecruitQuestScript
MinRecruitQuestScript kmyQuest = GetOwningQuest() as MinRecruitQuestScript
;END AUTOCAST
;BEGIN CODE
; give objective if player is listening
debug.trace(self + " radio set stage 40")
kmyQuest.RadioSetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
