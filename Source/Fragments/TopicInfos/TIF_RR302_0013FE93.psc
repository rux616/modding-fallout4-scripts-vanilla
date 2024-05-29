;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RR302_0013FE93 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE RR302Script
RR302Script kmyQuest = GetOwningQuest() as RR302Script
;END AUTOCAST
;BEGIN CODE
; Flagged that this talk happened
kmyQuest.bTalkedToTinkAtPoliceStation = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
