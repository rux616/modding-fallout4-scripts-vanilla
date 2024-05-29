;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03Acadia_BoS_01024F96 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC03:DLC03Acadia_BOSQuestScript
DLC03:DLC03Acadia_BOSQuestScript kmyQuest = GetOwningQuest() as DLC03:DLC03Acadia_BOSQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.MQ01SceneDone=1
if DLC03Acadia_BoS_Misc.IsObjectiveDisplayed(10)
DLC03Acadia_BoS_Misc.SetObjectiveCompleted(10,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03Acadia_BoS_Misc Auto Const Mandatory
