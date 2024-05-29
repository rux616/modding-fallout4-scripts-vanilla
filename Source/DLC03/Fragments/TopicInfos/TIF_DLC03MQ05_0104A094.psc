;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03MQ05_0104A094 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE dlc03:dlc03mq05script
dlc03:dlc03mq05script kmyQuest = GetOwningQuest() as dlc03:dlc03mq05script
;END AUTOCAST
;BEGIN CODE
kmyQuest.nFightAllenCounter -= 3
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
