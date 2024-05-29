;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_CIS_PlayerActivateEvent_001760FB Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
CIS_NextAllowed_CaitLockPickReminder.SetValue(CIS_NextAllowed_CaitLockPickReminder.GetValue() + 0.2) ;will be elsewhere, but this is to prevent this fragment from spamming the scripting system because "Run Immediately" happens every frame

debug.trace(self + "Player activated:" + akTargetRef)
FollowersScript.StartCompanionInteractionScene(CIS_Type_CaitLockPickReminder, akTargetRef, akTargetRef.GetCurrentLocation())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_01
Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
CIS_NextAllowed_ValentineHackTerminalReminder.SetValue(CIS_NextAllowed_ValentineHackTerminalReminder.GetValue() + 0.2) ;will be elsewhere, but this is to prevent this fragment from spamming the scripting system because "Run Immediately" happens every frame

debug.trace(self + "Player activated:" + akTargetRef)
FollowersScript.StartCompanionInteractionScene(CIS_Type_ValentineHackTerminalReminder, akTargetRef, akTargetRef.GetCurrentLocation())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CIS_Type_ValentineHackTerminalReminder Auto Const
GlobalVariable Property CIS_Type_CaitLockPickReminder Auto Const

GlobalVariable Property CIS_NextAllowed_CaitLockPickReminder const auto
GlobalVariable Property CIS_NextAllowed_ValentineHackTerminalReminder const auto


