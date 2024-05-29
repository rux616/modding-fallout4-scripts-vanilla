;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueInstitute_01068C18 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueInstituteQuestScript
DialogueInstituteQuestScript kmyQuest = GetOwningQuest() as DialogueInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.MadisonGreeted=1
(MQ207 as MQ206QuestScript).UpdateIntroductions()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ207 Auto Const

Quest Property DialogueInstitute Auto Const
