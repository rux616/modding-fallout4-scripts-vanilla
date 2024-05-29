;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoS00Radio_0006F104 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if BoS00.GetStageDone(10) == 0
if Game.IsPlayerRadioOn() == 1
if Game.GetPlayerRadioFrequency() == 95
BoS00.SetStage(10)
endif
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS00 Auto Const
