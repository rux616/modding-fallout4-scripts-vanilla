;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueInstitute_010681BE Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueInstituteQuestScript
DialogueInstituteQuestScript kmyQuest = GetOwningQuest() as DialogueInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.JustinGreeted=1
(MQ207 as MQ206QuestScript).UpdateIntroductions()

;Set a stage to prevent Justin doing this scene again
DialogueInstitute.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ207 Auto Const

Quest Property DialogueInstitute Auto Const
