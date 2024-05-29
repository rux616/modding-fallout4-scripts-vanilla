;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueSwansPond_00108199 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueSwansPondScript
DialogueSwansPondScript kmyQuest = GetOwningQuest() as DialogueSwansPondScript
;END AUTOCAST
;BEGIN CODE
; End the Tour Bot's wallah
Sound.stopinstance(kmyQuest.nTourBotWallahID)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
