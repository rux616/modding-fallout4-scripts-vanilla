;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS16_0005209A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pMS16EndPaymentGlobal.setValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pLL_Caps_Reward_Large Auto Const

LeveledItem Property pLL_Caps_Reward_Large_and_Change Auto Const

GlobalVariable Property pMS16EndPaymentGlobal Auto Const
