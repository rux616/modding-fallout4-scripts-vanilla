;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03CoA_DialogueNucleus_01009129 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if !DLC03CoA_QuestPointers.GetStageDone(300) && !DLC03CoA_QuestPointers.GetStageDone(350)
  DLC03CoA_QuestPointers.SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03CoA_FFNucleus01_Misc Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory

Quest Property DLC03AcadiaQuestPointers Auto Const Mandatory

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory
