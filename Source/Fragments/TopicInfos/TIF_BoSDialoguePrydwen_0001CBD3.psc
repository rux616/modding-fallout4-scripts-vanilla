;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoSDialoguePrydwen_0001CBD3 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If BoSM02.GetStageDone(430) ==1 && BoS301.GetStageDone(90) == 0
    BoSR03.SetStage(5)
EndIf
If BoSM04.GetStageDone(255) == 1
    BoSR03.SetStage(5)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BoSR03Restart.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoSR03 Auto Const

Quest Property BoSM02 Auto Const

Quest Property BoSM04 Auto Const

Quest Property BoS301 Auto Const

Scene Property BoSR03Restart Auto Const
