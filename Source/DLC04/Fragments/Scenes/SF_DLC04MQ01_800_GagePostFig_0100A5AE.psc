;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ01_800_GagePostFig_0100A5AE Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("ShockedGasps", True)
DLC04_NUK001_CrowdManager.PlaySustainedCrowdAnimationNoWait(0, 2, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("ShockedGasps", False)
DLC04_NUK001_CrowdManager.StopSustainedCrowdAnimation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("UncertainMurmur", True)
DLC04_NUK001_CrowdManager.PlaySustainedCrowdAnimationNoWait(0, 2, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("UncertainMurmur", False)
DLC04_NUK001_CrowdManager.StopSustainedCrowdAnimation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
DLC04MQ01Gauntlet.SetStage(2009)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_Begin
Function Fragment_Phase_09_Begin()
;BEGIN CODE
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("HesitantCheering", True)
DLC04_NUK001_CrowdManager.PlaySustainedCrowdAnimationNoWait(0, 1, 8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_Begin
Function Fragment_Phase_11_Begin()
;BEGIN CODE
Utility.Wait(3)
DLC04_NUK001_CrowdManager.ToggleCrowdNoise("HesitantCheering", False)
DLC04_NUK001_CrowdManager.StopSustainedCrowdAnimation()
GetOwningQuest().SetStage(749)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC04:DLC04_NUK001_CrowdManagerQuestScript Property DLC04_NUK001_CrowdManager Auto Const Mandatory

Quest Property DLC04MQ01Gauntlet Auto Const Mandatory
