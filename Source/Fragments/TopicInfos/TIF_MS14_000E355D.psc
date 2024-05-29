;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS14_000E355D Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MS14QuestScript
MS14QuestScript kmyQuest = GetOwningQuest() as MS14QuestScript
;END AUTOCAST
;BEGIN CODE
Vadim.GetActorReference().SetRestrained(False)
kmyquest.VadimFree=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Vadim Auto Const
