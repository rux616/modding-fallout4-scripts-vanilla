;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:TopicInfos:TIF_DLC01COMRobotCompanionBl_0100F796 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC01:DLC01CompanionUnlockScript
DLC01:DLC01CompanionUnlockScript kmyQuest = GetOwningQuest() as DLC01:DLC01CompanionUnlockScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommandUnlockPlayAnim()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE DLC01:DLC01CompanionUnlockScript
DLC01:DLC01CompanionUnlockScript kmyQuest = GetOwningQuest() as DLC01:DLC01CompanionUnlockScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DLC01EyebotInteractVFX.stop(kmyquest.RobotCompanion.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
