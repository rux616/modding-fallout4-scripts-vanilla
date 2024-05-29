;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03FarHarborS03_01023A44 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborS03Script
DLC03:DLC03FarHarborS03Script kmyQuest = GetOwningQuest() as DLC03:DLC03FarHarborS03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.bPlayerBelievesMariner = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
