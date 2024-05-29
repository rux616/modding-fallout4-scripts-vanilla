;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03DialogueFarHarborGe_01048C12 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Pointer quest
pDLC03FarHarborS01_Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDLC03FarHarborFF03b_Misc Auto Const Mandatory

Quest Property pDLC03FarHarborFF03c Auto Const Mandatory

Quest Property PDLC03FarHarborFF03c_Misc Auto Const Mandatory

Quest Property pDLC03FarHarborS01_Misc Auto Const Mandatory
