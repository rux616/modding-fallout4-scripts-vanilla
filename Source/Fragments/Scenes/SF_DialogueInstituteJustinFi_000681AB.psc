;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueInstituteJustinFi_000681AB Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE DialogueInstituteQuestScript
DialogueInstituteQuestScript kmyQuest = GetOwningQuest() as DialogueInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.JustinGreeted=1
(MQ207 as MQ206QuestScript).UpdateIntroductions()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ207 Auto Const
