;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_MQ101TVStation_00141A81 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE MQ101TVStationScript
MQ101TVStationScript kmyQuest = GetOwningQuest() as MQ101TVStationScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayNukeLine03()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
