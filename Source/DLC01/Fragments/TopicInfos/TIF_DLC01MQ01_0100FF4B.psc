;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:TopicInfos:TIF_DLC01MQ01_0100FF4B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Set stage to make Ada a follower
DLC01COMRobotCompanion.SetStage(70)
GetOwningQuest().SetStage(3000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property COMCodsworth Auto Const

Quest Property DLC01CodsworthCompanionDataUpdate Auto Const

Quest Property DLC01COMRobotCompanion Auto Const

ActorValue Property DLC01RobotDefaultOff Auto Const

ActorValue Property DLC01PersonalityMode Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Actor Property DLC01AdaRef Auto Const
