;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04SettlementDoctor_0101F9A3 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC04:DLC04SettlementDoctorScript
DLC04:DLC04SettlementDoctorScript kmyQuest = GetOwningQuest() as DLC04:DLC04SettlementDoctorScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartMedical(akSpeaker, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
