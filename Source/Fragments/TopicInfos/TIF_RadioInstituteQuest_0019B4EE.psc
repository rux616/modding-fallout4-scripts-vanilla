;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RadioInstituteQuest_0019B4EE Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE RadioInstituteQuestScript
RadioInstituteQuestScript kmyQuest = GetOwningQuest() as RadioInstituteQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CurrentSong=29
kmyquest.UpdateRadio()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
