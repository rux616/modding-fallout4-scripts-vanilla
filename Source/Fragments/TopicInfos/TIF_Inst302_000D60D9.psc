;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname fragments:topicinfos:tif_inst302_000d60d9 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE Inst302QuestScript
Inst302QuestScript kmyQuest = GetOwningQuest() as Inst302QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 60)
kmyquest.F6CapsGiven = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const
