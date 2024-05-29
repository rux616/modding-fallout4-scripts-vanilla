;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04DialogueSettlement_0101E3AC Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC04DialogueSettlement.SetStage(10)
DLC04SettlementDoctor_GreetScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC04SettlementDoctor_GreetScene Auto Const Mandatory

Quest Property DLC04DialogueSettlement Auto Const Mandatory
