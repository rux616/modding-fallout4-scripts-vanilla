;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ01_OverbossPreFi_0100A5AD_1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;Begin the fight.
GetOwningQuest().SetStage(700)

;Turn off the crowd noise from this scene.
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("ChantDeath", False)
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("WildCheering", False)
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("HalfheartedApplause", False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
DLC04MQ01Gauntlet.SetRaiderOverbossResistanceMult(-0.25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("ChantDeath", True)
DLC04_NUK001_CrowdManager.PlaySustainedCrowdAnimationNoWait(3, 1, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
DLC04MQ01Gauntlet.SetRaiderOverbossResistanceMult(-0.25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
DLC04_NUK001_CrowdManager.StopSustainedCrowdAnimation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("WildCheering", True)
DLC04_NUK001_CrowdManager.PlaySustainedCrowdAnimationNoWait(2, 1, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN CODE
DLC04MQ01Gauntlet.SetRaiderOverbossResistanceMult(-100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01QuestScript
DLC04:DLC04MQ01QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ01QuestScript
;END AUTOCAST
;BEGIN CODE
DLC04_NUK001_CrowdManager.StopSustainedCrowdAnimation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_Begin
Function Fragment_Phase_09_Begin()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("HalfheartedApplause", True)
DLC04_NUK001_CrowdManager.PlaySustainedCrowdAnimationNoWait(1, 1, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ01QuestScript
DLC04:DLC04MQ01QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ01QuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetStage(620)
DLC04_NUK001_CrowdManager.StopSustainedCrowdAnimation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_End
Function Fragment_Phase_11_End()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdIdleNoise("IdleHigh", True)
GetOwningQuest().SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC04:DLC04MQ01GauntletQuestScript Property DLC04MQ01Gauntlet Auto Const Mandatory

DLC04:DLC04_NUK001_CrowdManagerQuestScript Property DLC04_NUK001_CrowdManager Auto Const Mandatory

ReferenceAlias Property DLC04_Overboss Auto Const

Idle Property DLC04OverBossPumpUpAudienceB Auto Const Mandatory

Idle Property DLC04OverBossPumpUpAudienceA Auto Const Mandatory

Idle Property DLC04OverBossPumpUpAudienceC Auto Const Mandatory
