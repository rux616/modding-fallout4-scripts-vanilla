;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:TopicInfos:TIF_DLC01MQ05_01004EF3 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Set stage on DLC01Lair quest so Mechanist gives the player the passcode if they are alive.
DLC01Lair.SetStage(1501)

DLC01MQ05.SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC01Lair Auto Const

Quest Property DLC01MQ05 Auto Const
