;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueInstituteShaunKi_001AC343 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueInstShaunSynthQuestScript
DialogueInstShaunSynthQuestScript kmyQuest = GetOwningQuest() as DialogueInstShaunSynthQuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(ShaunHolotapeMQ302,1)
kmyquest.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Holotape Property ShaunHolotapeMQ302 Auto Const
