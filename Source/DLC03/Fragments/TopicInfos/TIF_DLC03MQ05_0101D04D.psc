;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03MQ05_0101D04D Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03MQ05Script
DLC03:DLC03MQ05Script kmyQuest = GetOwningQuest() as DLC03:DLC03MQ05Script
;END AUTOCAST
;BEGIN CODE
; Adjust the trial counter
kmyQuest.nDiMAJusticeCounter -= 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
