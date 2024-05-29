;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_FFGoodneighbor07_001324C0 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE FFGoodneighbor07Script
FFGoodneighbor07Script kmyQuest = GetOwningQuest() as FFGoodneighbor07Script
;END AUTOCAST
;BEGIN CODE
;Increment negotiation var
kmyquest.iNegotiationSuccesses = 3
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFGoodneighbor07 Auto Const
