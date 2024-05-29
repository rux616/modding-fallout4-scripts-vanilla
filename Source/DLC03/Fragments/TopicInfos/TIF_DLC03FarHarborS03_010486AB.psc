;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03FarHarborS03_010486AB Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; How does Mariner end?
 if ( pDLC03FarHarborFF03b.bAdviceEndLife == 1 )
  GetOwningQuest().SetStage(580)    ; Kills herself if pushed to it twice
else
  GetOwningQuest().SetStage(560)   ; Otherwise she sails
endif

GetOwningQuest().SetStage(28)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC03:DLC03FarHarborFF03b Property pDLC03FarHarborFF03b Auto Const Mandatory
