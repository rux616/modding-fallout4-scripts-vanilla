;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_Inst306_00221228 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE Inst306QuestScript
Inst306QuestScript kmyQuest = GetOwningQuest() as Inst306QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.TalkedToDesdemona=1

; Run the bucket quest (RR303 - 100)
pRR304.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pRR304 Auto Const Mandatory
