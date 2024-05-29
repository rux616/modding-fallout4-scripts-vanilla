;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MinDefendCastle_011284C1 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MinDefendCastleRadioSquadNW.SetValue(0)
MinDefendCastleRadioSquadSW.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MinDefendCastleRadioSquadSW Auto Const

GlobalVariable Property MinDefendCastleRadioSquadNW Auto Const
