;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03FarHarborFF03b_0104802B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborFF03b
DLC03:DLC03FarHarborFF03b kmyQuest = GetOwningQuest() as DLC03:DLC03FarHarborFF03b
;END AUTOCAST
;BEGIN CODE
kmyQuest.bOfferedSupport = 1

GetOwningQuest().SetStage(21)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
