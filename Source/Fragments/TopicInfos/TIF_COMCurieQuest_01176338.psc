;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_COMCurieQuest_01176338 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE COMCurieQuestScript
COMCurieQuestScript kmyQuest = GetOwningQuest() as COMCurieQuestScript
;END AUTOCAST
;BEGIN CODE
; Flag that Curie's been talked to
kmyQuest.bCurieToldAboutAmari = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
