;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03FarHarborS03_01048697 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; How does Mariner end?
 if ( pDLC03FarHarborFF03b.bAdviceEndLife == 1 )
  GetOwningQuest().SetStage(560)    ; Told her about killing herself, she decides to sail away
else
  GetOwningQuest().SetStage(570)   ; Otherwise she stays
endif

GetOwningQuest().SetStage(27)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC03:DLC03FarHarborFF03b Property pDLC03FarHarborFF03b Auto Const Mandatory
