;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03_COMOldLongfellowTa_0101549C Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.SwitchToPowerArmor(None)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
