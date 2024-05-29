;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueGenericDoctors_0005FB8E Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE GenericDoctorsScript
GenericDoctorsScript kmyQuest = GetOwningQuest() as GenericDoctorsScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Game.GetCaps(), 75)
kmyquest.StartMedical(akSpeaker, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
