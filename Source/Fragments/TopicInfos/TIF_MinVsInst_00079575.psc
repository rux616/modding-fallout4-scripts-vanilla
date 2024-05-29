;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MinVsInst_00079575 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MinVsInstQuestScript
MinVsInstQuestScript kmyQuest = GetOwningQuest() as MinVsInstQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DoctorSceneDone=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
