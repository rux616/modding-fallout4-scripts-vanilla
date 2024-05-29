;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_FFGoodneighbor07_0018BB4D Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE FFGoodneighbor07Script
FFGoodneighbor07Script kmyQuest = GetOwningQuest() as FFGoodneighbor07Script
;END AUTOCAST
;BEGIN CODE
;kmyquest.bHancockGiveCapsOnce = 1
Game.GetPlayer().AddItem(pRewardCaps, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pRewardCaps Auto Const
