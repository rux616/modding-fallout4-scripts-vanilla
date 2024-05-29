;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RR102_0007B313 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE RR102Script
RR102Script kmyQuest = GetOwningQuest() as RR102Script
;END AUTOCAST
;BEGIN CODE
; Flag that the PC isn't against Institute
kmyQuest.bNoToAgainstInstitute = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
