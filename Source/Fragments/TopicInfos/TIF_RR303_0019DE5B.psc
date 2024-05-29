;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RR303_0019DE5B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE CompanionVertibirdQuestScript
CompanionVertibirdQuestScript kmyQuest = GetOwningQuest() as CompanionVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
; Make the companions exit
kmyquest.CompanionsShouldExitVertibird()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
