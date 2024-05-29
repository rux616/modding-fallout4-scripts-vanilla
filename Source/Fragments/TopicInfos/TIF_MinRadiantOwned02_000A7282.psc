;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MinRadiantOwned02_000A7282 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE WorkshopRE01Script
WorkshopRE01Script kmyQuest = GetOwningQuest() as WorkshopRE01Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " radio set stage 40")
; give objective if player is listening
kmyQuest.RadioSetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MinRecruitQuestScript Property MinRadiantOwned01 Auto Const
