;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueRailroad_0005D7C4 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DialogueRailroadScript
DialogueRailroadScript kmyQuest = GetOwningQuest() as DialogueRailroadScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.bTinkerTomFooledInIntro = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
