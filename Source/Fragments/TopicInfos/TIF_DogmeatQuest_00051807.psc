;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DogmeatQuest_00051807 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DogmeatQuestFindStuffScript
DogmeatQuestFindStuffScript kmyQuest = GetOwningQuest() as DogmeatQuestFindStuffScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DogmeatTryToFindHostile()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property AO_Dogmeat_EscortToHostileBeckon Auto Const
