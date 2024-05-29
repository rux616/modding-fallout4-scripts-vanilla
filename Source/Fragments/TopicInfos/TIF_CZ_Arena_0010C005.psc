;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CZ_Arena_0010C005 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE ArenaScript
ArenaScript kmyQuest = GetOwningQuest() as ArenaScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SpotlightCombatant1(true)
kmyquest.SpotlightCombatant2(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
