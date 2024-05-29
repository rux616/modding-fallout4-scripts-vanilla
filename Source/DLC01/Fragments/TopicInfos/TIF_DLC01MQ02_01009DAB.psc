;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:TopicInfos:TIF_DLC01MQ02_01009DAB Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Set stage so Codsworth cannot go into hatred
; during this point in the quest.
DLC01CodsworthCompanionDataUpdate.SetStage(10)
; Set stage to make Codsworth a follower
COMCodsworth.SetStage(80)
If GetOwningQuest().IsObjectiveDisplayed(350) == 1
   GetOwningQuest().SetObjectiveCompleted(350)
   GetOwningQuest().SetObjectiveDisplayed(400)
   GetOwningQuest().SetStage(450)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property COMCodsworth Auto Const

Quest Property DLC01CodsworthCompanionDataUpdate Auto Const
