;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04RaidChaseOff_010273CB Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC04:DLC04RaidChaseOffScript
DLC04:DLC04RaidChaseOffScript kmyQuest = GetOwningQuest() as DLC04:DLC04RaidChaseOffScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetupRaid()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
