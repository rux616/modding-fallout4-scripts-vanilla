;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueInstituteShaunKi_0016329F Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueInstShaunSynthQuestScript
DialogueInstShaunSynthQuestScript kmyQuest = GetOwningQuest() as DialogueInstShaunSynthQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.UpdateQuestItem(3)
kmyquest.FreeformQuestRunning=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
