;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RadioInstituteDynamic_01001879 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE RadioInstituteDynamicQuestScript
RadioInstituteDynamicQuestScript kmyQuest = GetOwningQuest() as RadioInstituteDynamicQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.AttackSceneLoop=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
