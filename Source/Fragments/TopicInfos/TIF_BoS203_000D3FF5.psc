;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_BoS203_000D3FF5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(DialogueInstitute as DialogueInstituteQuestScript).MadisonGreeted=1
(MQ207 as MQ206QuestScript).UpdateIntroductions()
DialogueInstitute.SetStage(65)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueInstitute Auto Const

Quest Property MQ207 Auto Const
