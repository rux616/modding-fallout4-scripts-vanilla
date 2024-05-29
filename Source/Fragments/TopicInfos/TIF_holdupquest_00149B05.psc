;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_holdupquest_00149B05 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getPlayer().additem(pLL_Caps_Reward_small)
akspeaker.SetValue(pHoldupCapsAV, 1)
pholdupMessageCommandObeyed.show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property pHoldupCapsAV Auto Const

LeveledItem Property pLL_Caps_Reward_Small Auto Const

Message Property pholdupMessageCommandObeyed Auto Const
