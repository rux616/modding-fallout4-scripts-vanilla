;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03CoA_DialogueNucleus_01009B37 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if !DLC03AtomM02.GetStageDone(100) && !DLC03CoA_QuestPointers.GetStageDone(100) && !DLC03CoA_QuestPointers.GetStageDone(150)
  DLC03CoA_QuestPointers.SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03AtomM02 Auto Const Mandatory

Quest Property DLC03CoA_AtomM02_Misc Auto Const Mandatory

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory
