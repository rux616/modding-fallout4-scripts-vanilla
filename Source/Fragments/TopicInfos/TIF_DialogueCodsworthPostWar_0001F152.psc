;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueCodsworthPostWar_0001F152 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Game.GetPlayer().AddItem(pCodsworthHolotape01, 1)
pMQ102.SetStage(22)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Holotape Property pCodsworthHolotape01 Auto Const

Quest Property pMQ03 Auto Const

Quest Property pMQ102 Auto Const
