;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_RR303_00149E7A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CompanionsShouldExitVertibird()
kmyquest.GhostOff()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
