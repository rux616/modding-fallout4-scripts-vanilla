;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03_V118_PearlHiring_01036789 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_PearlHiringScript
DLC03:DLC03_V118_PearlHiringScript kmyQuest = GetOwningQuest() as DLC03:DLC03_V118_PearlHiringScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.bWaitOutsideHotel = true
GetOwningQuest().SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
