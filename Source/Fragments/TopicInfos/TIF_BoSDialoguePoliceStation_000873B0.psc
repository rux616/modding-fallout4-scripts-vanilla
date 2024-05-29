;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoSDialoguePoliceStation_000873B0 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BoSM01.Start()
BoSM01.EnableBoSM01Act1()
BoSM01Pointer.SetStage(10)
BoSR02.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

bosm01questscript Property BoSM01 Auto Const

Quest Property BosR02 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoSM01Pointer Auto Const
