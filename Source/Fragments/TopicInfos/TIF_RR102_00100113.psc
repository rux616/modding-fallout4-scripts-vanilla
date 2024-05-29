;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RR102_00100113 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Play some music
pMUSReveal03x.Add()

;Fire tutorial event for "Player can fast travel from RRHQ"
Tutorial.SetStage(1940)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MusicType Property pMUSReveal03x Auto Const

Quest Property Tutorial Auto Const Mandatory
