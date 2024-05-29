;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueInstituteClaytonF_000D1482 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DialogueInstituteQuestScript
DialogueInstituteQuestScript kmyQuest = GetOwningQuest() as DialogueInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ClaytonGreeted=1
(MQ207 as MQ206QuestScript).UpdateIntroductions()

;Set a stage to prevent Alli from greeting again
DialogueInstitute.SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ207 Auto Const

Quest Property DialogueInstitute Auto Const
