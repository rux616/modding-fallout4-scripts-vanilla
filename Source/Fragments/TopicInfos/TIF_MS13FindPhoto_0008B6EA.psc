;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS13FindPhoto_0008B6EA Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; reward player
if GetOwningQuest().GetStageDone(450)
	GetOwningQuest().SetStage(500)
endif
if GetOwningQuest().GetStageDone(460)
	GetOwningQuest().SetStage(510)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
