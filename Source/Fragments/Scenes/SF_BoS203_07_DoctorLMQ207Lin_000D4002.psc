;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS203_07_DoctorLMQ207Lin_000D4002 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
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
