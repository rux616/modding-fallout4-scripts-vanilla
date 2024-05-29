;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MinArtillery_000AE80C Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MinArtilleryScript
MinArtilleryScript kmyQuest = GetOwningQuest() as MinArtilleryScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ShowFailureMessageTooClose()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
