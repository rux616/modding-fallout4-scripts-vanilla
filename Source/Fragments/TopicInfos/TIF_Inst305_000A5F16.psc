;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_Inst305_000A5F16 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE Inst305QuestScript
Inst305QuestScript kmyQuest = GetOwningQuest() as Inst305QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.AllowMicActivate=0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE Inst305QuestScript
Inst305QuestScript kmyQuest = GetOwningQuest() as Inst305QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.AllowMicActivate=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
