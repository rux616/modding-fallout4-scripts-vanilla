;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03FarHarborS02_0100AF4E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborS02Script
DLC03:DLC03FarHarborS02Script kmyQuest = GetOwningQuest() as DLC03:DLC03FarHarborS02Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.bPCOfferFreeHelp = 1

GetOwningQuest().SetStage(21)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
