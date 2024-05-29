;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03FarHarborS03_01048685 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; How does Mariner end?
int bLeave = pDLC03FarHarborFF03b.bAdviceSpareFriendsPain
int bSuicide = pDLC03FarHarborFF03b.bAdviceEndLife
 if ( bLeave || bSuicide )
  GetOwningQuest().SetStage(560)    ; She sails
else
  GetOwningQuest().SetStage(570)   ; Otherwise she stays
endif

GetOwningQuest().SetStage(29)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC03:DLC03FarHarborFF03b Property pDLC03FarHarborFF03b Auto Const Mandatory
