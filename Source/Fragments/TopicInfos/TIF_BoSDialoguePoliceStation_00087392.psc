;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoSDialoguePoliceStation_00087392 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BoSR01.SetStage(10)
BoSM01.Start()
BoSM01.EnableBoSM01Act1()
BoSM01Pointer.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BoSM01QuestScript Property BoSM01 Auto Const

Quest Property BoSR01 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoSM01Pointer Auto Const
