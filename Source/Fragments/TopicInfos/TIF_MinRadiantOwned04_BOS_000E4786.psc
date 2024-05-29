;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MinRadiantOwned04_BOS_000E4786 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MinRadiantOwned04Script
MinRadiantOwned04Script kmyQuest = GetOwningQuest() as MinRadiantOwned04Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RadioSetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
