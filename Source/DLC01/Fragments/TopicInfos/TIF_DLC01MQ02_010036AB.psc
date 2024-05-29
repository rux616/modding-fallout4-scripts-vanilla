;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:TopicInfos:TIF_DLC01MQ02_010036AB Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Set stage to make Ada a companion
DLC01COMRobotCompanion.SetStage(70)
If GetOwningQuest().IsObjectiveDisplayed(2700) == 1
   GetOwningQuest().SetObjectiveCompleted(2700)
   GetOwningQuest().SetObjectiveDisplayed(2800)
   GetOwningQuest().SetStage(2700)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property COMCodsworth Auto Const

Quest Property DLC01CodsworthCompanionDataUpdate Auto Const

Quest Property DLC01COMRobotCompanion Auto Const Mandatory
