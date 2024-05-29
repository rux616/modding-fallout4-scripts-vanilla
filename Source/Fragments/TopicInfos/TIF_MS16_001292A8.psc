;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS16_001292A8 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if pMS16EndPaymentGlobal.getValue() > 0
    game.getplayer().additem(pLL_Caps_Reward_Large)
     game.getplayer().additem(pcaps001, 50)
else
     game.getplayer().additem(pLL_Caps_Reward_Large)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property LL_Caps_Reward_Large_and_Change Auto Const

LeveledItem Property pLL_Caps_Reward_Large Auto Const

GlobalVariable Property pMS16EndPaymentGlobal Auto Const

MiscObject Property pCaps001 Auto Const Mandatory
