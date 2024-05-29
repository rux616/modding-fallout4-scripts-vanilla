;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_InstMassFusion_00192E40 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE InstMassFusionQuestScript
InstMassFusionQuestScript kmyQuest = GetOwningQuest() as InstMassFusionQuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Agitator.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Agitator Auto Const
