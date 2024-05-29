;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_REChokepoint01_001ABF9A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
REChokepoint01Toll.SetValue(50)
if (!GetOwningQuest().GetStageDone(21))
     GetOwningQuest().SetStage(21)
ElseIf (!GetOwningQuest().GetStageDone(22))
     GetOwningQuest().SetStage(22)
ElseIf (!GetOwningQuest().GetStageDone(23))
     GetOwningQuest().SetStage(23)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property REChokepoint01Toll Auto Const
