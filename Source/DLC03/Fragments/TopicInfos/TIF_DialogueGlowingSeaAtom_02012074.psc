;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DialogueGlowingSeaAtom_02012074 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BoS301CoAInfo.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoS301CoAInfo Auto Const Mandatory
