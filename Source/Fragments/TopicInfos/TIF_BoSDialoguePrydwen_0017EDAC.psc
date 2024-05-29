;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoSDialoguePrydwen_0017EDAC Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BoS201B.SetStage(20)
if BoSIngramIntroDone.GetValue() == 0
BoSIngramIntroDone.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSIngramIntroDone Auto Const

Quest Property BoS201B Auto Const
