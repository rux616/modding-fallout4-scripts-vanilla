;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04_RQ_Manager_0104BCD1 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC04:DLC04_RQ_ManagerScript
DLC04:DLC04_RQ_ManagerScript kmyQuest = GetOwningQuest() as DLC04:DLC04_RQ_ManagerScript
;END AUTOCAST
;BEGIN CODE
kmyquest.AttachShockCollar(akSpeakerRef as actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
