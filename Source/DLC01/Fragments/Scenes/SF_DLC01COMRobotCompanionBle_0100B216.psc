;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01COMRobotCompanionBle_0100B216 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE DLC01:DLC01CompanionUnlockScript
DLC01:DLC01CompanionUnlockScript kmyQuest = GetOwningQuest() as DLC01:DLC01CompanionUnlockScript
;END AUTOCAST
;BEGIN CODE
FollowersScript.trace(self, "PHASE 2, calling kmyquest.CommandUnlockStartNewAttempt()")
kmyquest.CommandUnlockStartNewAttempt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN AUTOCAST TYPE DLC01:DLC01CompanionUnlockScript
DLC01:DLC01CompanionUnlockScript kmyQuest = GetOwningQuest() as DLC01:DLC01CompanionUnlockScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CommandUnlockAttempt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE DLC01:DLC01CompanionUnlockScript
DLC01:DLC01CompanionUnlockScript kmyQuest = GetOwningQuest() as DLC01:DLC01CompanionUnlockScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DLC01EyebotInteractVFX.stop(kmyquest.RobotCompanion.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
