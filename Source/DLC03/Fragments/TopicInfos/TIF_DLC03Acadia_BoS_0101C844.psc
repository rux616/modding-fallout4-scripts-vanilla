;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03Acadia_BoS_0101C844 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03Acadia_BOSQuestScript
DLC03:DLC03Acadia_BOSQuestScript kmyQuest = GetOwningQuest() as DLC03:DLC03Acadia_BOSQuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.GetStageDone(23)==0
kmyquest.SetStage(23)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
