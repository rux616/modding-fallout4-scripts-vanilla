;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03Acadia_Institute_01013F62 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03AcadiaInstituteQuestScript
DLC03:DLC03AcadiaInstituteQuestScript kmyQuest = GetOwningQuest() as DLC03:DLC03AcadiaInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.GetStageDone(24)==0
kmyquest.SetStage(24)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
