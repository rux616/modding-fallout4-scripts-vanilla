;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:TopicInfos:TIF_DLC01MQ03_0100084B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC01:DLC01MQ03Script
DLC01:DLC01MQ03Script kmyQuest = GetOwningQuest() as DLC01:DLC01MQ03Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartRadiantQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
