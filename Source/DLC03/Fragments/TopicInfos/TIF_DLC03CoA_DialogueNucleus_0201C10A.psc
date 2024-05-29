;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03CoA_DialogueNucleus_0201C10A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;High Confessor trusts the player more now
DLC03CoA_QuestsCompleted.SetValue(DLC03CoA_QuestsCompleted.Getvalue() + 1)

;Fail DLC03MQ06a
DLC03MQ06a.SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC03CoA_QuestsCompleted Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory
