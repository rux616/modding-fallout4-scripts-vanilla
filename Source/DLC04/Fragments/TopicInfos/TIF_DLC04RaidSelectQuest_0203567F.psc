;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04RaidSelectQuest_0203567F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.DisplayNoTargetsMessage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
