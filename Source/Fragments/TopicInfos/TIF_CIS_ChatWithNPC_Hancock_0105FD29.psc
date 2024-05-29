;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CIS_ChatWithNPC_Hancock_0105FD29 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE CIS_ChatWithNPC_HancockScript
CIS_ChatWithNPC_HancockScript kmyQuest = GetOwningQuest() as CIS_ChatWithNPC_HancockScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.iDialougeSet += 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
