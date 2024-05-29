;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_FFGoodneighbor01_00108F1E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Player knows Amari is a brain surgeon 
; (Relevant for Curie's quest to become human)
; COMMENTED OUT 6-10 to prevent Main Quest and Emergent Behavior bashing
;pCOMCurieQuest.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pCOMCurieQuest Auto Const
