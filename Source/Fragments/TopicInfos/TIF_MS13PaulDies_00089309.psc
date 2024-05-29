;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MS13PaulDies_00089309 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MS13PaulDiesScript
MS13PaulDiesScript kmyQuest = GetOwningQuest() as MS13PaulDiesScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateDarcyLastGreetTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
